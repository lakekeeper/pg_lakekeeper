-- Iceberg table detail.

SELECT pgl_test.inlined('SELECT * FROM lakekeeper.iceberg_table WHERE warehouse_id = gen_random_uuid()');
SELECT pgl_test.inlined('SELECT * FROM lakekeeper.table_property');
SELECT pgl_test.inlined('SELECT * FROM lakekeeper.table_snapshot');
SELECT pgl_test.inlined('SELECT * FROM lakekeeper.table_ref');
SELECT pgl_test.inlined('SELECT * FROM lakekeeper.table_snapshot_log');
SELECT pgl_test.inlined('SELECT * FROM lakekeeper.table_metadata_log');
SELECT pgl_test.inlined('SELECT * FROM lakekeeper.table_partition_field');
SELECT pgl_test.inlined('SELECT * FROM lakekeeper.table_sort_field');
SELECT pgl_test.inlined('SELECT * FROM lakekeeper.table_statistics');
SELECT pgl_test.inlined('SELECT * FROM lakekeeper.partition_statistics');

SELECT full_name, format_version, current_schema_id, default_partition_spec_id,
       default_sort_order_id, current_snapshot_id, last_column_id,
       last_partition_id, last_sequence_number, next_row_id, is_live
FROM lakekeeper.iceberg_table
ORDER BY full_name;

SELECT pgl_test.ok(
    (SELECT current_snapshot_id FROM lakekeeper.iceberg_table
     WHERE full_name = 'sales.eu.orders') = 3002,
    'current_snapshot_id follows the main branch');

SELECT t.full_name, p.key, p.value
FROM lakekeeper.table_property p
JOIN lakekeeper.iceberg_table t USING (warehouse_id, table_id)
ORDER BY t.full_name, p.key;

SELECT s.snapshot_id, s.parent_snapshot_id, s.sequence_number, s.operation,
       s.added_data_files, s.deleted_data_files, s.total_data_files,
       s.total_delete_files, s.added_records, s.deleted_records, s.total_records,
       s.added_files_size, s.removed_files_size, s.total_files_size
FROM lakekeeper.table_snapshot s
ORDER BY s.snapshot_id;

SELECT r.ref_name, r.ref_type, r.snapshot_id, r.min_snapshots_to_keep,
       r.max_snapshot_age_ms, r.max_ref_age_ms
FROM lakekeeper.table_ref r
ORDER BY r.ref_name;

SELECT pgl_test.ok(
    (SELECT count(*) FROM lakekeeper.table_snapshot_log l
     JOIN lakekeeper.iceberg_table t USING (warehouse_id, table_id)
     WHERE t.full_name = 'sales.eu.orders') = 2
    AND (SELECT count(*) FROM lakekeeper.table_metadata_log l
         JOIN lakekeeper.iceberg_table t USING (warehouse_id, table_id)
         WHERE t.full_name = 'sales.eu.orders') = 2,
    'both logs record every commit to a table');

-- Row lineage and the encryption key reference, which only format version 3
-- carries.
SELECT t.full_name, s.snapshot_id, s.first_row_id, s.assigned_rows, s.key_id
FROM lakekeeper.table_snapshot s
JOIN lakekeeper.iceberg_table t USING (warehouse_id, table_id)
WHERE t.format_version = 3
ORDER BY s.snapshot_id;

SELECT pgl_test.ok(
    (SELECT count(*) FROM lakekeeper.table_snapshot s
     JOIN lakekeeper.iceberg_table t USING (warehouse_id, table_id)
     WHERE t.format_version < 3 AND s.first_row_id IS NOT NULL) = 0,
    'a snapshot below format version 3 carries no row range');

SELECT t.full_name, f.partition_spec_id, f.ordinal, f.field_id, f.source_id,
       f.name, f.transform
FROM lakekeeper.table_partition_field f
JOIN lakekeeper.iceberg_table t USING (warehouse_id, table_id)
ORDER BY t.full_name, f.ordinal NULLS FIRST;

SELECT t.full_name, o.sort_order_id, o.ordinal, o.source_id, o.transform,
       o.direction, o.null_order
FROM lakekeeper.table_sort_field o
JOIN lakekeeper.iceberg_table t USING (warehouse_id, table_id)
ORDER BY t.full_name, o.ordinal NULLS FIRST;

-- A spec with no fields still contributes a row, so a table is never missing
-- from a partition listing.
SELECT pgl_test.ok(
    (SELECT count(DISTINCT table_id) FROM lakekeeper.table_partition_field)
        = (SELECT count(*) FROM lakekeeper.iceberg_table),
    'every table appears in the partition field listing');

SELECT snapshot_id, statistics_path LIKE '%stats-3002.puffin' AS path_matches,
       file_size_in_bytes, file_footer_size_in_bytes,
       jsonb_array_length(blob_metadata) AS blobs
FROM lakekeeper.table_statistics
ORDER BY snapshot_id;

SELECT snapshot_id, file_size_in_bytes
FROM lakekeeper.partition_statistics
ORDER BY snapshot_id;
