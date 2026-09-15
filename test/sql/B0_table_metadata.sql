-- The Iceberg table metadata document and the load-table response.

-- The document the catalog serves, rebuilt from the rows it was stored in.
SELECT pgl_test.ok(
    pgl_test.json_canonical(
        lakekeeper.load_table(t.warehouse_id, ARRAY['sales', 'eu'], 'orders'))
    = pgl_test.json_canonical(
        (SELECT body FROM pgl_test.api WHERE name = 'load_table_orders')),
    'load_table matches the catalog response for a table with snapshots')
FROM lakekeeper.warehouse t WHERE t.warehouse_name = 'wh_hard';

SELECT pgl_test.ok(
    pgl_test.json_canonical(
        lakekeeper.load_table(t.warehouse_id, ARRAY['logs'], 'events'))
    = pgl_test.json_canonical(
        (SELECT body FROM pgl_test.api WHERE name = 'load_table_events')),
    'load_table matches the catalog response for a table with no snapshots')
FROM lakekeeper.warehouse t WHERE t.warehouse_name = 'wh_hard';

SELECT pgl_test.ok(
    pgl_test.json_canonical(
        lakekeeper.load_table(t.warehouse_id, ARRAY['sales', 'eu'], 'orders_v3'))
    = pgl_test.json_canonical(
        (SELECT body FROM pgl_test.api WHERE name = 'load_table_orders_v3')),
    'load_table matches the catalog response for a format version 3 table')
FROM lakekeeper.warehouse t WHERE t.warehouse_name = 'wh_hard';

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
