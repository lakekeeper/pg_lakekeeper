SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@.table_metadata(warehouse_id uuid, table_id uuid)
RETURNS jsonb
LANGUAGE plpgsql STABLE AS $meta$
DECLARE
    t    record;
    doc  jsonb;
    part jsonb;
BEGIN
    SELECT * INTO t
      FROM @extschema@.iceberg_table i
     WHERE i.warehouse_id = table_metadata.warehouse_id
       AND i.table_id = table_metadata.table_id;

    IF NOT FOUND THEN
        RETURN NULL;
    END IF;

    IF t.format_version < 2 THEN
        RAISE EXCEPTION
            'pg_lakekeeper: % is format version %, whose metadata has a different shape',
            t.full_name, t.format_version
            USING HINT = 'Read this table through the catalog API.';
    END IF;

    IF EXISTS (SELECT 1 FROM @lk@.table_encryption_keys k
                WHERE k.warehouse_id = t.warehouse_id AND k.table_id = t.table_id) THEN
        RAISE EXCEPTION
            'pg_lakekeeper: % carries encryption keys, whose wrapped key material this extension does not read',
            t.full_name
            USING HINT = 'Read this table through the catalog API. lakekeeper.table_encryption_key lists which keys it references.';
    END IF;

    SELECT jsonb_agg(@extschema@.schema_json(s.warehouse_id, s.table_id, s.schema_id)
                     ORDER BY s.schema_id)
      INTO part
      FROM @lk@.table_schema s
     WHERE s.warehouse_id = t.warehouse_id AND s.table_id = t.table_id;

    doc := jsonb_build_object(
        'format-version', t.format_version,
        'table-uuid', t.table_id,
        'location', t.location,
        'last-sequence-number', t.last_sequence_number,
        'last-updated-ms', t.last_updated_ms,
        'last-column-id', t.last_column_id,
        'last-partition-id', t.last_partition_id,
        'current-schema-id', t.current_schema_id,
        'default-spec-id', t.default_partition_spec_id,
        'default-sort-order-id', t.default_sort_order_id,
        'schemas', coalesce(part, '[]'::jsonb));

    SELECT coalesce(jsonb_agg(s.partition_spec ORDER BY s.partition_spec_id), '[]'::jsonb)
      INTO part
      FROM @lk@.table_partition_spec s
     WHERE s.warehouse_id = t.warehouse_id AND s.table_id = t.table_id;
    doc := doc || jsonb_build_object('partition-specs', part);

    SELECT coalesce(jsonb_agg(s.sort_order ORDER BY s.sort_order_id), '[]'::jsonb)
      INTO part
      FROM @lk@.table_sort_order s
     WHERE s.warehouse_id = t.warehouse_id AND s.table_id = t.table_id;
    doc := doc || jsonb_build_object('sort-orders', part);

    SELECT coalesce(jsonb_object_agg(r.table_ref_name,
                                     r.retention
                                     || jsonb_build_object('snapshot-id', r.snapshot_id)),
                    '{}'::jsonb)
      INTO part
      FROM @lk@.table_refs r
     WHERE r.warehouse_id = t.warehouse_id AND r.table_id = t.table_id;
    doc := doc || jsonb_build_object('refs', part);

    IF t.format_version >= 3 THEN
        doc := doc || jsonb_build_object('next-row-id', t.next_row_id);
    END IF;

    IF t.current_snapshot_id IS NOT NULL THEN
        doc := doc || jsonb_build_object('current-snapshot-id', t.current_snapshot_id);
    END IF;

    SELECT jsonb_object_agg(p.key, p.value) INTO part
      FROM @lk@.table_properties p
     WHERE p.warehouse_id = t.warehouse_id AND p.table_id = t.table_id;
    IF part IS NOT NULL THEN
        doc := doc || jsonb_build_object('properties', part);
    END IF;

    SELECT jsonb_agg(
               jsonb_build_object(
                   'snapshot-id', s.snapshot_id,
                   'sequence-number', s.sequence_number,
                   'timestamp-ms', s.timestamp_ms,
                   'manifest-list', s.manifest_list,
                   'summary', s.summary)
               || CASE WHEN s.parent_snapshot_id IS NULL THEN '{}'::jsonb
                       ELSE jsonb_build_object('parent-snapshot-id', s.parent_snapshot_id) END
               || CASE WHEN s.schema_id IS NULL THEN '{}'::jsonb
                       ELSE jsonb_build_object('schema-id', s.schema_id) END
               || CASE WHEN s.first_row_id IS NULL THEN '{}'::jsonb
                       ELSE jsonb_build_object('first-row-id', s.first_row_id) END
               || CASE WHEN s.assigned_rows IS NULL THEN '{}'::jsonb
                       ELSE jsonb_build_object('added-rows', s.assigned_rows) END
               || CASE WHEN s.key_id IS NULL THEN '{}'::jsonb
                       ELSE jsonb_build_object('key-id', s.key_id) END
               ORDER BY s.sequence_number)
      INTO part
      FROM @lk@.table_snapshot s
     WHERE s.warehouse_id = t.warehouse_id AND s.table_id = t.table_id;
    IF part IS NOT NULL THEN
        doc := doc || jsonb_build_object('snapshots', part);
    END IF;

    SELECT jsonb_agg(jsonb_build_object('snapshot-id', l.snapshot_id,
                                        'timestamp-ms', l."timestamp")
                     ORDER BY l.sequence_number)
      INTO part
      FROM @lk@.table_snapshot_log l
     WHERE l.warehouse_id = t.warehouse_id AND l.table_id = t.table_id;
    IF part IS NOT NULL THEN
        doc := doc || jsonb_build_object('snapshot-log', part);
    END IF;

    SELECT jsonb_agg(jsonb_build_object('metadata-file', l.metadata_file,
                                        'timestamp-ms', l."timestamp")
                     ORDER BY l.sequence_number)
      INTO part
      FROM @lk@.table_metadata_log l
     WHERE l.warehouse_id = t.warehouse_id AND l.table_id = t.table_id;
    IF part IS NOT NULL THEN
        doc := doc || jsonb_build_object('metadata-log', part);
    END IF;

    SELECT jsonb_agg(jsonb_build_object(
               'snapshot-id', s.snapshot_id,
               'statistics-path', s.statistics_path,
               'file-size-in-bytes', s.file_size_in_bytes,
               'file-footer-size-in-bytes', s.file_footer_size_in_bytes,
               'blob-metadata', s.blob_metadata)
               ORDER BY s.snapshot_id)
      INTO part
      FROM @lk@.table_statistics s
     WHERE s.warehouse_id = t.warehouse_id AND s.table_id = t.table_id;
    IF part IS NOT NULL THEN
        doc := doc || jsonb_build_object('statistics', part);
    END IF;

    SELECT jsonb_agg(jsonb_build_object(
               'snapshot-id', s.snapshot_id,
               'statistics-path', s.statistics_path,
               'file-size-in-bytes', s.file_size_in_bytes)
               ORDER BY s.snapshot_id)
      INTO part
      FROM @lk@.partition_statistics s
     WHERE s.warehouse_id = t.warehouse_id AND s.table_id = t.table_id;
    IF part IS NOT NULL THEN
        doc := doc || jsonb_build_object('partition-statistics', part);
    END IF;

    RETURN doc;
END
$meta$;
$def$);

COMMENT ON FUNCTION @extschema@.table_metadata(uuid, uuid) IS
    'The Iceberg table metadata document, as the catalog serves it. Raises on a format version 1 table, whose document has a different shape.';

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@.load_table(warehouse_id uuid, namespace text[], name text)
RETURNS jsonb
LANGUAGE plpgsql STABLE AS $load$
DECLARE
    tb record;
BEGIN
    SELECT t.tabular_id, t.metadata_location INTO tb
      FROM @lk@.tabular t
      JOIN @lk@.namespace n
        ON n.warehouse_id = t.warehouse_id AND n.namespace_id = t.namespace_id
     WHERE t.warehouse_id = load_table.warehouse_id
       AND n.namespace_name = load_table.namespace
       AND t.name = load_table.name
       AND t.typ = 'table'
       AND t.deleted_at IS NULL;

    IF NOT FOUND THEN
        RETURN NULL;
    END IF;

    RETURN jsonb_build_object(
        'metadata-location', tb.metadata_location,
        'metadata', @extschema@.table_metadata(load_table.warehouse_id, tb.tabular_id));
END
$load$;
$def$);

COMMENT ON FUNCTION @extschema@.load_table(uuid, text[], text) IS
    'The load-table response for one table, named the way the catalog API names it. Returns null when no live table has that name.';
