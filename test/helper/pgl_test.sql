-- Assertions for the pg_regress suite. Loaded into the test database before
-- the first test file runs.
CREATE SCHEMA IF NOT EXISTS pgl_test;

CREATE OR REPLACE FUNCTION pgl_test.ok(cond boolean, msg text) RETURNS void
LANGUAGE plpgsql AS $$
BEGIN
    IF cond IS NOT TRUE THEN
        RAISE EXCEPTION 'ASSERTION FAILED: %', msg;
    END IF;
END
$$;

COMMENT ON FUNCTION pgl_test.ok(boolean, text) IS
    'Raises when the condition is not true, naming the assertion in the diff.';

CREATE OR REPLACE FUNCTION pgl_test.inlined(query text) RETURNS void
LANGUAGE plpgsql AS $$
DECLARE
    line text;
BEGIN
    FOR line IN EXECUTE 'EXPLAIN (COSTS OFF, VERBOSE) ' || query LOOP
        IF line ~ 'Function Scan on lakekeeper\._' THEN
            RAISE EXCEPTION 'NOT INLINED: %', query;
        END IF;
    END LOOP;
END
$$;

COMMENT ON FUNCTION pgl_test.inlined(text) IS
    'Raises when the planner did not inline the function behind a view.';

CREATE TABLE IF NOT EXISTS pgl_test.api (name text PRIMARY KEY, body jsonb NOT NULL);

COMMENT ON TABLE pgl_test.api IS
    'REST responses captured from the upstream build the fixture was generated on.';

CREATE OR REPLACE FUNCTION pgl_test.id_key(section text) RETURNS text
LANGUAGE sql IMMUTABLE AS $$
    SELECT CASE section
        WHEN 'schemas'              THEN 'schema-id'
        WHEN 'partition-specs'      THEN 'spec-id'
        WHEN 'sort-orders'          THEN 'order-id'
        WHEN 'snapshots'            THEN 'snapshot-id'
        WHEN 'statistics'           THEN 'snapshot-id'
        WHEN 'partition-statistics' THEN 'snapshot-id'
        WHEN 'versions'             THEN 'version-id'
    END
$$;

COMMENT ON FUNCTION pgl_test.id_key(text) IS
    'The document sections the catalog serves from unordered collections, and the key that identifies an element of each. Every other section compares in order.';

CREATE OR REPLACE FUNCTION pgl_test.sort_by(arr jsonb, key text) RETURNS jsonb
LANGUAGE sql IMMUTABLE AS $$
    SELECT CASE
        WHEN key IS NULL OR arr IS NULL OR jsonb_typeof(arr) <> 'array' THEN arr
        ELSE coalesce((SELECT jsonb_agg(e ORDER BY e->key) FROM jsonb_array_elements(arr) e),
                      '[]'::jsonb)
    END
$$;

CREATE OR REPLACE FUNCTION pgl_test.section_eq(ours jsonb, theirs jsonb, section text)
RETURNS boolean
LANGUAGE sql IMMUTABLE AS $$
    SELECT pgl_test.sort_by(ours, pgl_test.id_key(section))
           IS NOT DISTINCT FROM
           pgl_test.sort_by(theirs, pgl_test.id_key(section))
$$;

COMMENT ON FUNCTION pgl_test.section_eq(jsonb, jsonb, text) IS
    'One section of a document against the catalog''s, order-insensitive only where the catalog is.';

CREATE OR REPLACE FUNCTION pgl_test.doc_eq(ours jsonb, theirs jsonb) RETURNS boolean
LANGUAGE plpgsql IMMUTABLE AS $$
DECLARE
    k text;
BEGIN
    IF (SELECT array_agg(x ORDER BY x) FROM jsonb_object_keys(ours) x)
       IS DISTINCT FROM
       (SELECT array_agg(x ORDER BY x) FROM jsonb_object_keys(theirs) x) THEN
        RETURN false;
    END IF;
    FOR k IN SELECT jsonb_object_keys(theirs) LOOP
        IF NOT pgl_test.section_eq(ours->k, theirs->k, k) THEN
            RETURN false;
        END IF;
    END LOOP;
    RETURN true;
END
$$;

COMMENT ON FUNCTION pgl_test.doc_eq(jsonb, jsonb) IS
    'A whole document against the catalog''s: same keys, each section compared with section_eq.';

CREATE OR REPLACE FUNCTION pgl_test.table_parity(p_full_name text, p_api_name text)
RETURNS TABLE (section text, matches boolean)
LANGUAGE plpgsql STABLE AS $$
DECLARE
    wh  uuid;
    tid uuid;
    m   jsonb;
BEGIN
    SELECT t.warehouse_id, t.table_id INTO wh, tid
    FROM lakekeeper.iceberg_table t WHERE t.full_name = p_full_name;
    SELECT a.body->'metadata' INTO m FROM pgl_test.api a WHERE a.name = p_api_name;

    section := 'properties';
    matches := (SELECT jsonb_object_agg(p.key, p.value) FROM lakekeeper.table_property p
                WHERE p.warehouse_id = wh AND p.table_id = tid)
               IS NOT DISTINCT FROM m->'properties';
    RETURN NEXT;

    section := 'refs';
    matches := coalesce((SELECT jsonb_object_agg(r.ref_name, jsonb_strip_nulls(jsonb_build_object(
                    'type', r.ref_type, 'snapshot-id', r.snapshot_id,
                    'min-snapshots-to-keep', r.min_snapshots_to_keep,
                    'max-snapshot-age-ms', r.max_snapshot_age_ms,
                    'max-ref-age-ms', r.max_ref_age_ms)))
                FROM lakekeeper.table_ref r WHERE r.warehouse_id = wh AND r.table_id = tid),
                       '{}'::jsonb)
               IS NOT DISTINCT FROM m->'refs';
    RETURN NEXT;

    section := 'snapshots';
    matches := pgl_test.section_eq(
                (SELECT jsonb_agg(jsonb_strip_nulls(jsonb_build_object(
                    'snapshot-id', s.snapshot_id, 'parent-snapshot-id', s.parent_snapshot_id,
                    'sequence-number', s.sequence_number, 'timestamp-ms', s.timestamp_ms,
                    'manifest-list', s.manifest_list, 'schema-id', s.schema_id,
                    'summary', s.summary, 'first-row-id', s.first_row_id,
                    'added-rows', s.assigned_rows, 'key-id', s.key_id)))
                 FROM lakekeeper.table_snapshot s WHERE s.warehouse_id = wh AND s.table_id = tid),
                m->'snapshots', 'snapshots');
    RETURN NEXT;

    section := 'snapshot-log';
    matches := (SELECT jsonb_agg(jsonb_build_object('snapshot-id', l.snapshot_id,
                                                    'timestamp-ms', l.timestamp_ms)
                                 ORDER BY l.sequence_number)
                FROM lakekeeper.table_snapshot_log l WHERE l.warehouse_id = wh AND l.table_id = tid)
               IS NOT DISTINCT FROM m->'snapshot-log';
    RETURN NEXT;

    section := 'metadata-log';
    matches := (SELECT jsonb_agg(jsonb_build_object('metadata-file', l.metadata_file,
                                                    'timestamp-ms', l.timestamp_ms)
                                 ORDER BY l.sequence_number)
                FROM lakekeeper.table_metadata_log l WHERE l.warehouse_id = wh AND l.table_id = tid)
               IS NOT DISTINCT FROM m->'metadata-log';
    RETURN NEXT;

    section := 'partition-specs';
    matches := pgl_test.section_eq((SELECT jsonb_agg(jsonb_build_object('spec-id', x.spec_id, 'fields', x.fields)
                                 ORDER BY x.spec_id)
                FROM (SELECT f.partition_spec_id AS spec_id,
                             coalesce(jsonb_agg(jsonb_build_object(
                                          'field-id', f.field_id, 'source-id', f.source_id,
                                          'name', f.name, 'transform', f.transform)
                                      ORDER BY f.ordinal)
                                      FILTER (WHERE f.field_id IS NOT NULL), '[]'::jsonb) AS fields
                      FROM lakekeeper.table_partition_field f
                      WHERE f.warehouse_id = wh AND f.table_id = tid
                      GROUP BY f.partition_spec_id) x),
                m->'partition-specs', 'partition-specs');
    RETURN NEXT;

    section := 'sort-orders';
    matches := pgl_test.section_eq((SELECT jsonb_agg(jsonb_build_object('order-id', x.order_id, 'fields', x.fields)
                                 ORDER BY x.order_id)
                FROM (SELECT o.sort_order_id AS order_id,
                             coalesce(jsonb_agg(jsonb_build_object(
                                          'source-id', o.source_id, 'transform', o.transform,
                                          'direction', o.direction, 'null-order', o.null_order)
                                      ORDER BY o.ordinal)
                                      FILTER (WHERE o.source_id IS NOT NULL), '[]'::jsonb) AS fields
                      FROM lakekeeper.table_sort_field o
                      WHERE o.warehouse_id = wh AND o.table_id = tid
                      GROUP BY o.sort_order_id) x),
                m->'sort-orders', 'sort-orders');
    RETURN NEXT;

    section := 'statistics';
    matches := pgl_test.section_eq((SELECT jsonb_agg(jsonb_build_object(
                    'snapshot-id', s.snapshot_id, 'statistics-path', s.statistics_path,
                    'file-size-in-bytes', s.file_size_in_bytes,
                    'file-footer-size-in-bytes', s.file_footer_size_in_bytes,
                    'blob-metadata', s.blob_metadata) ORDER BY s.snapshot_id)
                FROM lakekeeper.table_statistics s WHERE s.warehouse_id = wh AND s.table_id = tid),
                m->'statistics', 'statistics');
    RETURN NEXT;

    section := 'partition-statistics';
    matches := pgl_test.section_eq((SELECT jsonb_agg(jsonb_build_object(
                    'snapshot-id', s.snapshot_id, 'statistics-path', s.statistics_path,
                    'file-size-in-bytes', s.file_size_in_bytes) ORDER BY s.snapshot_id)
                FROM lakekeeper.partition_statistics s WHERE s.warehouse_id = wh AND s.table_id = tid),
                m->'partition-statistics', 'partition-statistics');
    RETURN NEXT;

    section := 'schemas';
    matches := pgl_test.section_eq(
                (SELECT jsonb_agg(lakekeeper.schema_json(wh, tid, s.schema_id))
                 FROM lakekeeper.tabular_schema s WHERE s.warehouse_id = wh AND s.tabular_id = tid),
                m->'schemas', 'schemas');
    RETURN NEXT;
END
$$;

COMMENT ON FUNCTION pgl_test.table_parity(text, text) IS
    'Each detail view of one table against the matching section of its captured document.';

CREATE OR REPLACE FUNCTION pgl_test.view_parity(p_full_name text, p_api_name text)
RETURNS TABLE (section text, matches boolean)
LANGUAGE plpgsql STABLE AS $$
DECLARE
    wh  uuid;
    vid uuid;
    m   jsonb;
BEGIN
    SELECT v.warehouse_id, v.view_id INTO wh, vid
    FROM lakekeeper.iceberg_view v WHERE v.full_name = p_full_name;
    SELECT a.body->'metadata' INTO m FROM pgl_test.api a WHERE a.name = p_api_name;

    section := 'versions';
    matches := pgl_test.section_eq(
                (SELECT jsonb_agg(jsonb_strip_nulls(jsonb_build_object(
                    'version-id', vv.version_id, 'schema-id', vv.schema_id,
                    'timestamp-ms', floor(extract(epoch from vv.timestamp_at) * 1000)::bigint,
                    'summary', vv.summary, 'default-catalog', vv.default_catalog,
                    'default-namespace', to_jsonb(vv.default_namespace_name),
                    'representations', (
                        SELECT jsonb_agg(jsonb_build_object('type', r.typ, 'sql', r.sql,
                                                            'dialect', r.dialect)
                                         ORDER BY r.dialect)
                        FROM lakekeeper.view_representation r
                        WHERE r.warehouse_id = vv.warehouse_id AND r.view_id = vv.view_id
                          AND r.version_id = vv.version_id))))
                 FROM lakekeeper.view_version vv WHERE vv.warehouse_id = wh AND vv.view_id = vid),
                m->'versions', 'versions');
    RETURN NEXT;

    section := 'version-log';
    matches := (SELECT jsonb_agg(jsonb_build_object(
                    'version-id', l.version_id,
                    'timestamp-ms', floor(extract(epoch from l.timestamp_at) * 1000)::bigint)
                    ORDER BY l.created_at, l.version_id)
                FROM lakekeeper.view_version_log l WHERE l.warehouse_id = wh AND l.view_id = vid)
               IS NOT DISTINCT FROM m->'version-log';
    RETURN NEXT;

    section := 'properties';
    matches := coalesce((SELECT jsonb_object_agg(p.key, p.value) FROM lakekeeper.view_property p
                         WHERE p.warehouse_id = wh AND p.view_id = vid), '{}'::jsonb)
               IS NOT DISTINCT FROM m->'properties';
    RETURN NEXT;

    section := 'schemas';
    matches := pgl_test.section_eq(
                (SELECT jsonb_agg(lakekeeper.schema_json(wh, vid, s.schema_id))
                 FROM lakekeeper.tabular_schema s WHERE s.warehouse_id = wh AND s.tabular_id = vid),
                m->'schemas', 'schemas');
    RETURN NEXT;
END
$$;

COMMENT ON FUNCTION pgl_test.view_parity(text, text) IS
    'Each detail view of one Iceberg view against the matching section of its captured document.';

GRANT USAGE ON SCHEMA pgl_test TO PUBLIC;
