-- The read patterns operational tooling runs against a catalog: locating a
-- table's files, planning compaction and snapshot expiry, checking a name
-- before creating it, and reconciling an external inventory.

-- A client that only needs to read a table's files wants the metadata pointer,
-- not the whole document.
SELECT pgl_test.inlined($$
    SELECT t.metadata_location
    FROM lakekeeper.namespace n
    JOIN lakekeeper.tabular t USING (warehouse_id, namespace_id)
    WHERE n.warehouse_id = (SELECT warehouse_id FROM lakekeeper.warehouse
                            WHERE warehouse_name = 'wh_hard')
      AND n.namespace_name = ARRAY['sales', 'eu']
      AND t.name = 'orders'$$);

SELECT pgl_test.ok(
    (SELECT t.metadata_location
     FROM lakekeeper.namespace n
     JOIN lakekeeper.tabular t USING (warehouse_id, namespace_id)
     WHERE n.warehouse_id = (SELECT warehouse_id FROM lakekeeper.warehouse
                             WHERE warehouse_name = 'wh_hard')
       AND n.namespace_name = ARRAY['sales', 'eu']
       AND t.name = 'orders')
    = (SELECT lakekeeper.load_table(w.warehouse_id, ARRAY['sales', 'eu'], 'orders')
                  ->>'metadata-location'
       FROM lakekeeper.warehouse w WHERE w.warehouse_name = 'wh_hard'),
    'the metadata pointer read from the view matches the one the load response carries');

SELECT pgl_test.ok(
    (SELECT bool_and(t.location IS NOT NULL AND t.metadata_location IS NOT NULL)
     FROM lakekeeper.iceberg_table t WHERE t.is_live),
    'every live table exposes both its base location and its metadata pointer');

SELECT pgl_test.ok(
    (SELECT bool_and(s.manifest_list IS NOT NULL) FROM lakekeeper.table_snapshot s),
    'every snapshot names its manifest list');

-- Checking a namespace before creating in it.
SELECT pgl_test.ok(
    EXISTS (SELECT 1 FROM lakekeeper.namespace n
            JOIN lakekeeper.warehouse w USING (warehouse_id)
            WHERE w.warehouse_name = 'wh_hard'
              AND n.namespace_name = ARRAY['sales', 'eu'])
    AND NOT EXISTS (SELECT 1 FROM lakekeeper.namespace n
                    JOIN lakekeeper.warehouse w USING (warehouse_id)
                    WHERE w.warehouse_name = 'wh_hard'
                      AND n.namespace_name = ARRAY['sales', 'apac']),
    'a namespace can be checked for before a client tries to create a table in it');

-- A soft-deleted table keeps its row. An existence check has to read is_live, or
-- it reports a table that the catalog no longer serves.
SELECT pgl_test.ok(
    EXISTS (SELECT 1 FROM lakekeeper.tabular t
            JOIN lakekeeper.warehouse w USING (warehouse_id)
            WHERE w.warehouse_name = 'wh_soft' AND t.full_name = 'staging.retired')
    AND NOT EXISTS (SELECT 1 FROM lakekeeper.tabular t
                    JOIN lakekeeper.warehouse w USING (warehouse_id)
                    WHERE w.warehouse_name = 'wh_soft'
                      AND t.full_name = 'staging.retired' AND t.is_live),
    'a soft-deleted table is present but not live');

-- Compaction planning: the file and record counts of the current snapshot.
SELECT t.full_name,
       s.total_data_files,
       s.total_delete_files,
       s.total_records,
       s.total_files_size,
       s.total_files_size / nullif(s.total_data_files, 0) AS mean_file_size
FROM lakekeeper.iceberg_table t
LEFT JOIN lakekeeper.table_snapshot s
       ON s.warehouse_id = t.warehouse_id
      AND s.table_id = t.table_id
      AND s.snapshot_id = t.current_snapshot_id
WHERE t.is_live
ORDER BY t.full_name;

-- A table that has never been written to has no current snapshot. A maintenance
-- pass must still see it rather than drop it from the listing.
SELECT pgl_test.ok(
    (SELECT count(*) FROM lakekeeper.iceberg_table t
     LEFT JOIN lakekeeper.table_snapshot s
            ON s.warehouse_id = t.warehouse_id
           AND s.table_id = t.table_id
           AND s.snapshot_id = t.current_snapshot_id
     WHERE t.is_live)
    = (SELECT count(*) FROM lakekeeper.iceberg_table WHERE is_live),
    'a table with no snapshot still appears in a maintenance listing');

-- Expiry planning: which snapshots no ref pins.
SELECT t.full_name, s.snapshot_id, s.sequence_number
FROM lakekeeper.table_snapshot s
JOIN lakekeeper.iceberg_table t USING (warehouse_id, table_id)
WHERE NOT EXISTS (SELECT 1 FROM lakekeeper.table_ref r
                  WHERE r.warehouse_id = s.warehouse_id
                    AND r.table_id = s.table_id
                    AND r.snapshot_id = s.snapshot_id)
ORDER BY t.full_name, s.snapshot_id;

SELECT pgl_test.ok(
    (SELECT count(*) FROM lakekeeper.table_snapshot s
     JOIN lakekeeper.iceberg_table t USING (warehouse_id, table_id)
     WHERE t.full_name = 'sales.eu.orders'
       AND NOT EXISTS (SELECT 1 FROM lakekeeper.table_ref r
                       WHERE r.warehouse_id = s.warehouse_id
                         AND r.table_id = s.table_id
                         AND r.snapshot_id = s.snapshot_id)) = 0,
    'a snapshot kept by a tag counts as pinned, not as expirable');

-- Reconciling an inventory of table names held outside the catalog.
CREATE TEMP TABLE inventory (namespace text[], name text);
INSERT INTO inventory VALUES
    (ARRAY['sales', 'eu'], 'orders'),
    (ARRAY['logs'], 'events'),
    (ARRAY['logs'], 'never_created'),
    (ARRAY['sales', 'eu'], 'Orders');

SELECT i.namespace, i.name AS registered_but_absent
FROM inventory i
WHERE NOT EXISTS (
    SELECT 1 FROM lakekeeper.tabular t
    JOIN lakekeeper.warehouse w USING (warehouse_id)
    WHERE w.warehouse_name = 'wh_hard'
      AND t.is_live
      AND t.namespace_name = i.namespace
      AND t.name = i.name)
ORDER BY 1, 2;

-- The views compare names exactly, so an inventory that does not store them the
-- way the catalog does needs a case-insensitive comparison, or the load
-- functions, which match names the way the catalog matches them.
SELECT pgl_test.ok(
    NOT EXISTS (SELECT 1 FROM lakekeeper.tabular t
                JOIN lakekeeper.warehouse w USING (warehouse_id)
                WHERE w.warehouse_name = 'wh_hard' AND t.name = 'Orders')
    AND EXISTS (SELECT 1 FROM lakekeeper.tabular t
                JOIN lakekeeper.warehouse w USING (warehouse_id)
                WHERE w.warehouse_name = 'wh_hard' AND t.name ILIKE 'Orders')
    AND (SELECT lakekeeper.load_table(w.warehouse_id, ARRAY['sales', 'eu'], 'Orders')
         FROM lakekeeper.warehouse w WHERE w.warehouse_name = 'wh_hard') IS NOT NULL,
    'a differently cased name misses the view and resolves through load_table');

SELECT t.full_name AS in_catalog_but_unregistered
FROM lakekeeper.tabular t
JOIN lakekeeper.warehouse w USING (warehouse_id)
WHERE w.warehouse_name = 'wh_hard'
  AND t.is_live
  AND t.typ = 'table'
  AND NOT EXISTS (SELECT 1 FROM inventory i
                  WHERE i.namespace = t.namespace_name AND i.name = t.name)
ORDER BY 1;
