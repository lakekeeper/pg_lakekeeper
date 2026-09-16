SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@.view_metadata(warehouse_id uuid, view_id uuid)
RETURNS jsonb
LANGUAGE plpgsql STABLE AS $meta$
DECLARE
    v    record;
    doc  jsonb;
    part jsonb;
BEGIN
    SELECT * INTO v
      FROM @extschema@.iceberg_view i
     WHERE i.warehouse_id = view_metadata.warehouse_id
       AND i.view_id = view_metadata.view_id;

    IF NOT FOUND THEN
        RETURN NULL;
    END IF;

    SELECT jsonb_agg(@extschema@.schema_json(s.warehouse_id, s.view_id, s.schema_id)
                     ORDER BY s.schema_id)
      INTO part
      FROM @lk@.view_schema s
     WHERE s.warehouse_id = v.warehouse_id AND s.view_id = v.view_id;

    doc := jsonb_build_object(
        'view-uuid', v.view_id,
        'format-version', ltrim(v.format_version, 'v')::integer,
        'location', v.location,
        'current-version-id', v.current_version_id,
        'schemas', coalesce(part, '[]'::jsonb));

    SELECT coalesce(jsonb_agg(
               jsonb_build_object(
                   'version-id', ver.version_id,
                   'timestamp-ms', floor(extract(epoch from ver."timestamp") * 1000)::bigint,
                   'schema-id', ver.schema_id,
                   'summary', ver.summary,
                   'default-namespace', coalesce(ns.namespace_name, ARRAY[]::text[]),
                   'representations', coalesce(reps.representations, '[]'::jsonb))
               || CASE WHEN ver.default_catalog IS NULL THEN '{}'::jsonb
                       ELSE jsonb_build_object('default-catalog', ver.default_catalog) END
               ORDER BY ver.version_id), '[]'::jsonb)
      INTO part
      FROM @lk@.view_version ver
      LEFT JOIN @lk@.namespace ns
        ON ns.warehouse_id = ver.warehouse_id AND ns.namespace_id = ver.default_namespace_id
      LEFT JOIN LATERAL (
          SELECT jsonb_agg(jsonb_build_object('type', r.typ::text,
                                              'sql', r.sql,
                                              'dialect', r.dialect)
                           ORDER BY r.dialect) AS representations
          FROM @lk@.view_representation r
          WHERE r.warehouse_id = ver.warehouse_id
            AND r.view_id = ver.view_id
            AND r.view_version_id = ver.version_id) reps ON true
     WHERE ver.warehouse_id = v.warehouse_id AND ver.view_id = v.view_id;
    doc := doc || jsonb_build_object('versions', part);

    SELECT coalesce(jsonb_agg(
               jsonb_build_object(
                   'version-id', l.version_id,
                   'timestamp-ms', floor(extract(epoch from l."timestamp") * 1000)::bigint)
               ORDER BY l.created_at, l.version_id), '[]'::jsonb)
      INTO part
      FROM @lk@.view_version_log l
     WHERE l.warehouse_id = v.warehouse_id AND l.view_id = v.view_id;
    doc := doc || jsonb_build_object('version-log', part);

    SELECT coalesce(jsonb_object_agg(p.key, p.value), '{}'::jsonb) INTO part
      FROM @lk@.view_properties p
     WHERE p.warehouse_id = v.warehouse_id AND p.view_id = v.view_id;
    doc := doc || jsonb_build_object('properties', part);

    RETURN doc;
END
$meta$;
$def$);

COMMENT ON FUNCTION @extschema@.view_metadata(uuid, uuid) IS
    'The Iceberg view metadata document, as the catalog serves it.';

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@.load_view(warehouse_id uuid, namespace text[], name text)
RETURNS jsonb
LANGUAGE plpgsql STABLE AS $load$
DECLARE
    tb record;
BEGIN
    SELECT t.tabular_id, t.metadata_location INTO tb
      FROM @lk@.tabular t
      JOIN @lk@.namespace n
        ON n.warehouse_id = t.warehouse_id AND n.namespace_id = t.namespace_id
     WHERE t.warehouse_id = load_view.warehouse_id
       AND n.namespace_name = load_view.namespace
       AND t.name = load_view.name
       AND t.typ = 'view'
       AND t.deleted_at IS NULL;

    IF NOT FOUND THEN
        RETURN NULL;
    END IF;

    RETURN jsonb_build_object(
        'metadata-location', tb.metadata_location,
        'metadata', @extschema@.view_metadata(load_view.warehouse_id, tb.tabular_id));
END
$load$;
$def$);

COMMENT ON FUNCTION @extschema@.load_view(uuid, text[], text) IS
    'The load-view response for one view, named the way the catalog API names it. Returns null when no live view has that name.';
