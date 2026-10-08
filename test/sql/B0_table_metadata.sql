-- The Iceberg table metadata document and the load-table response.

-- The document the catalog serves, rebuilt from the rows it was stored in.
SELECT pgl_test.ok(
    pgl_test.doc_eq(
        lakekeeper.load_table(t.warehouse_id, ARRAY['sales', 'eu'], 'orders')->'metadata',
        (SELECT body->'metadata' FROM pgl_test.api WHERE name = 'load_table_orders'))
    AND lakekeeper.load_table(t.warehouse_id, ARRAY['sales', 'eu'], 'orders')->'metadata-location'
        = (SELECT body->'metadata-location' FROM pgl_test.api WHERE name = 'load_table_orders'),
    'load_table matches the catalog response for a table with snapshots')
FROM lakekeeper.warehouse t WHERE t.warehouse_name = 'wh_hard';

SELECT pgl_test.ok(
    pgl_test.doc_eq(
        lakekeeper.load_table(t.warehouse_id, ARRAY['logs'], 'events')->'metadata',
        (SELECT body->'metadata' FROM pgl_test.api WHERE name = 'load_table_events'))
    AND lakekeeper.load_table(t.warehouse_id, ARRAY['logs'], 'events')->'metadata-location'
        = (SELECT body->'metadata-location' FROM pgl_test.api WHERE name = 'load_table_events'),
    'load_table matches the catalog response for a table with no snapshots')
FROM lakekeeper.warehouse t WHERE t.warehouse_name = 'wh_hard';

SELECT pgl_test.ok(
    pgl_test.doc_eq(
        lakekeeper.load_table(t.warehouse_id, ARRAY['sales', 'eu'], 'orders_v3')->'metadata',
        (SELECT body->'metadata' FROM pgl_test.api WHERE name = 'load_table_orders_v3'))
    AND lakekeeper.load_table(t.warehouse_id, ARRAY['sales', 'eu'], 'orders_v3')->'metadata-location'
        = (SELECT body->'metadata-location' FROM pgl_test.api WHERE name = 'load_table_orders_v3'),
    'load_table matches the catalog response for a format version 3 table')
FROM lakekeeper.warehouse t WHERE t.warehouse_name = 'wh_hard';

SELECT pgl_test.ok(
    pgl_test.doc_eq(
        lakekeeper.load_table(t.warehouse_id, ARRAY['sales', 'eu'], 'evolved')->'metadata',
        (SELECT body->'metadata' FROM pgl_test.api WHERE name = 'load_table_evolved'))
    AND lakekeeper.load_table(t.warehouse_id, ARRAY['sales', 'eu'], 'evolved')->'metadata-location'
        = (SELECT body->'metadata-location' FROM pgl_test.api WHERE name = 'load_table_evolved'),
    'load_table matches the catalog response for a table with a history')
FROM lakekeeper.warehouse t WHERE t.warehouse_name = 'wh_hard';

-- The shapes that history left behind, as the document reports them.
SELECT jsonb_array_length(m->'schemas') AS schemas,
       m->'current-schema-id' AS current_schema,
       jsonb_array_length(m->'partition-specs') AS specs,
       m->'default-spec-id' AS default_spec,
       jsonb_array_length(m->'sort-orders') AS sort_orders,
       m->'default-sort-order-id' AS default_sort,
       jsonb_path_query_array(m, '$.snapshots[*].summary.operation') AS operations,
       jsonb_path_query_array(m, '$."snapshot-log"[*]."snapshot-id"') AS snapshot_log,
       jsonb_array_length(m->'metadata-log') AS metadata_log_entries,
       m->'properties' AS properties
FROM lakekeeper.iceberg_table t,
     LATERAL lakekeeper.table_metadata(t.warehouse_id, t.table_id) AS m
WHERE t.full_name = 'sales.eu.evolved';

SELECT f.schema_id, f.field_id, f.name, f.type_name, f.required,
       f.initial_default, f.write_default
FROM lakekeeper.field f
JOIN lakekeeper.iceberg_table t ON t.warehouse_id = f.warehouse_id AND t.table_id = f.tabular_id
WHERE t.full_name = 'sales.eu.evolved' AND f.parent_field_id IS NULL
  AND (f.schema_id = 1 OR f.name IN ('qty', 'legacy_note'))
ORDER BY f.schema_id, f.field_id;

-- Ordered sections are compared in order, which the canonical form does not check.
SELECT jsonb_path_query_array(
           lakekeeper.table_metadata(t.warehouse_id, t.table_id),
           '$."snapshot-log"[*]."snapshot-id"') AS snapshot_log
FROM lakekeeper.iceberg_table t WHERE t.full_name = 'sales.eu.orders';

SELECT pgl_test.ok(
    (SELECT jsonb_path_query_array(
                lakekeeper.table_metadata(t.warehouse_id, t.table_id),
                '$."metadata-log"[*]."metadata-file"')
     FROM lakekeeper.iceberg_table t WHERE t.full_name = 'sales.eu.orders')
    = (SELECT jsonb_agg(l.metadata_file ORDER BY l.sequence_number)
       FROM lakekeeper.table_metadata_log l
       JOIN lakekeeper.iceberg_table t USING (warehouse_id, table_id)
       WHERE t.full_name = 'sales.eu.orders'),
    'the metadata log keeps the order it was written in');

-- Names resolve the way the catalog resolves them.
SELECT pgl_test.ok(
    lakekeeper.load_table(t.warehouse_id, ARRAY['SALES', 'EU'], 'ORDERS') IS NOT NULL,
    'the table name lookup is case-insensitive, as the catalog is')
FROM lakekeeper.warehouse t WHERE t.warehouse_name = 'wh_hard';

SELECT pgl_test.ok(
    lakekeeper.load_table(t.warehouse_id, ARRAY['logs'], 'no_such_table') IS NULL,
    'an unknown name returns null')
FROM lakekeeper.warehouse t WHERE t.warehouse_name = 'wh_hard';

SELECT pgl_test.ok(
    lakekeeper.load_table(t.warehouse_id, ARRAY['logs'], 'delta_events') IS NULL,
    'a generic table is not returned as an Iceberg table')
FROM lakekeeper.warehouse t WHERE t.warehouse_name = 'wh_hard';

-- A format version 1 table raises rather than return a document of the wrong shape.
SELECT lakekeeper.table_metadata(t.warehouse_id, t.table_id)
FROM lakekeeper.iceberg_table t WHERE t.full_name = 'logs.legacy_v1';

-- So does a table whose document would carry wrapped encryption keys.
SELECT lakekeeper.table_metadata(t.warehouse_id, t.table_id)
FROM lakekeeper.iceberg_table t WHERE t.full_name = 'logs.encrypted_v3';

SELECT t.full_name, k.key_id, k.encrypted_by_id, k.properties
FROM lakekeeper.table_encryption_key k
JOIN lakekeeper.iceberg_table t USING (warehouse_id, table_id)
ORDER BY t.full_name, k.key_id;

SELECT pgl_test.inlined('SELECT * FROM lakekeeper.table_encryption_key');

SELECT pgl_test.inlined('SELECT * FROM lakekeeper.iceberg_table');
