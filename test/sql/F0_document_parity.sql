-- Each detail view against the matching section of the document the catalog
-- serves. The views and the document functions read the same upstream rows
-- through different expressions, so this checks the views, not the functions.

CREATE TEMP VIEW orders AS
    SELECT * FROM lakekeeper.iceberg_table WHERE full_name = 'sales.eu.orders';
CREATE TEMP VIEW doc AS
    SELECT body->'metadata' AS m FROM pgl_test.api WHERE name = 'load_table_orders';

SELECT pgl_test.ok(
    (SELECT jsonb_object_agg(p.key, p.value)
     FROM lakekeeper.table_property p, orders t
     WHERE p.warehouse_id = t.warehouse_id AND p.table_id = t.table_id)
    = (SELECT m->'properties' FROM doc),
    'table_property matches the properties the catalog serves');

SELECT pgl_test.ok(
    (SELECT jsonb_object_agg(r.ref_name, jsonb_strip_nulls(jsonb_build_object(
                'type', r.ref_type,
                'snapshot-id', r.snapshot_id,
                'min-snapshots-to-keep', r.min_snapshots_to_keep,
                'max-snapshot-age-ms', r.max_snapshot_age_ms,
                'max-ref-age-ms', r.max_ref_age_ms)))
     FROM lakekeeper.table_ref r, orders t
     WHERE r.warehouse_id = t.warehouse_id AND r.table_id = t.table_id)
    = (SELECT m->'refs' FROM doc),
    'table_ref matches the refs the catalog serves');

SELECT pgl_test.ok(
    pgl_test.json_canonical(
        (SELECT jsonb_agg(jsonb_strip_nulls(jsonb_build_object(
                    'snapshot-id', s.snapshot_id,
                    'parent-snapshot-id', s.parent_snapshot_id,
                    'sequence-number', s.sequence_number,
                    'timestamp-ms', s.timestamp_ms,
                    'manifest-list', s.manifest_list,
                    'schema-id', s.schema_id,
                    'summary', s.summary)))
         FROM lakekeeper.table_snapshot s, orders t
         WHERE s.warehouse_id = t.warehouse_id AND s.table_id = t.table_id))
    = pgl_test.json_canonical((SELECT m->'snapshots' FROM doc)),
    'table_snapshot matches the snapshots the catalog serves');

SELECT pgl_test.ok(
    (SELECT jsonb_agg(jsonb_build_object('snapshot-id', l.snapshot_id,
                                         'timestamp-ms', l.timestamp_ms)
                      ORDER BY l.sequence_number)
     FROM lakekeeper.table_snapshot_log l, orders t
     WHERE l.warehouse_id = t.warehouse_id AND l.table_id = t.table_id)
    = (SELECT m->'snapshot-log' FROM doc),
    'table_snapshot_log matches the snapshot log the catalog serves, in order');

SELECT pgl_test.ok(
    (SELECT jsonb_agg(jsonb_build_object('metadata-file', l.metadata_file,
                                         'timestamp-ms', l.timestamp_ms)
                      ORDER BY l.sequence_number)
     FROM lakekeeper.table_metadata_log l, orders t
     WHERE l.warehouse_id = t.warehouse_id AND l.table_id = t.table_id)
    = (SELECT m->'metadata-log' FROM doc),
    'table_metadata_log matches the metadata log the catalog serves, in order');

SELECT pgl_test.ok(
    (SELECT jsonb_agg(jsonb_build_object('spec-id', spec_id, 'fields', fields)
                      ORDER BY spec_id)
     FROM (SELECT f.partition_spec_id AS spec_id,
                  coalesce(jsonb_agg(jsonb_build_object(
                               'field-id', f.field_id,
                               'source-id', f.source_id,
                               'name', f.name,
                               'transform', f.transform)
                           ORDER BY f.ordinal)
                           FILTER (WHERE f.field_id IS NOT NULL), '[]'::jsonb) AS fields
           FROM lakekeeper.table_partition_field f, orders t
           WHERE f.warehouse_id = t.warehouse_id AND f.table_id = t.table_id
           GROUP BY f.partition_spec_id) s)
    = (SELECT m->'partition-specs' FROM doc),
    'table_partition_field matches the partition specs the catalog serves');

SELECT pgl_test.ok(
    (SELECT jsonb_agg(jsonb_build_object('order-id', order_id, 'fields', fields)
                      ORDER BY order_id)
     FROM (SELECT o.sort_order_id AS order_id,
                  coalesce(jsonb_agg(jsonb_build_object(
                               'source-id', o.source_id,
                               'transform', o.transform,
                               'direction', o.direction,
                               'null-order', o.null_order)
                           ORDER BY o.ordinal)
                           FILTER (WHERE o.source_id IS NOT NULL), '[]'::jsonb) AS fields
           FROM lakekeeper.table_sort_field o, orders t
           WHERE o.warehouse_id = t.warehouse_id AND o.table_id = t.table_id
           GROUP BY o.sort_order_id) s)
    = (SELECT m->'sort-orders' FROM doc),
    'table_sort_field matches the sort orders the catalog serves');

SELECT pgl_test.ok(
    (SELECT jsonb_agg(jsonb_build_object(
                'snapshot-id', s.snapshot_id,
                'statistics-path', s.statistics_path,
                'file-size-in-bytes', s.file_size_in_bytes,
                'file-footer-size-in-bytes', s.file_footer_size_in_bytes,
                'blob-metadata', s.blob_metadata)
                ORDER BY s.snapshot_id)
     FROM lakekeeper.table_statistics s, orders t
     WHERE s.warehouse_id = t.warehouse_id AND s.table_id = t.table_id)
    = (SELECT m->'statistics' FROM doc),
    'table_statistics matches the statistics the catalog serves');

SELECT pgl_test.ok(
    (SELECT jsonb_agg(jsonb_build_object(
                'snapshot-id', s.snapshot_id,
                'statistics-path', s.statistics_path,
                'file-size-in-bytes', s.file_size_in_bytes)
                ORDER BY s.snapshot_id)
     FROM lakekeeper.partition_statistics s, orders t
     WHERE s.warehouse_id = t.warehouse_id AND s.table_id = t.table_id)
    = (SELECT m->'partition-statistics' FROM doc),
    'partition_statistics matches the partition statistics the catalog serves');

CREATE TEMP VIEW eu_orders AS
    SELECT * FROM lakekeeper.iceberg_view WHERE full_name = 'sales.eu.eu_orders';
CREATE TEMP VIEW vdoc AS
    SELECT body->'metadata' AS m FROM pgl_test.api WHERE name = 'load_view_eu_orders';

SELECT pgl_test.ok(
    pgl_test.json_canonical(
        (SELECT jsonb_agg(jsonb_strip_nulls(jsonb_build_object(
                    'version-id', vv.version_id,
                    'schema-id', vv.schema_id,
                    'timestamp-ms', floor(extract(epoch from vv.timestamp_at) * 1000)::bigint,
                    'summary', vv.summary,
                    'default-catalog', vv.default_catalog,
                    'default-namespace', to_jsonb(vv.default_namespace_name),
                    'representations', (
                        SELECT jsonb_agg(jsonb_build_object('type', r.typ,
                                                            'sql', r.sql,
                                                            'dialect', r.dialect)
                                         ORDER BY r.dialect)
                        FROM lakekeeper.view_representation r
                        WHERE r.warehouse_id = vv.warehouse_id
                          AND r.view_id = vv.view_id
                          AND r.version_id = vv.version_id))))
         FROM lakekeeper.view_version vv, eu_orders v
         WHERE vv.warehouse_id = v.warehouse_id AND vv.view_id = v.view_id))
    = pgl_test.json_canonical((SELECT m->'versions' FROM vdoc)),
    'view_version and view_representation match the versions the catalog serves');

SELECT pgl_test.ok(
    (SELECT jsonb_agg(jsonb_build_object(
                'version-id', l.version_id,
                'timestamp-ms', floor(extract(epoch from l.timestamp_at) * 1000)::bigint)
                ORDER BY l.created_at, l.version_id)
     FROM lakekeeper.view_version_log l, eu_orders v
     WHERE l.warehouse_id = v.warehouse_id AND l.view_id = v.view_id)
    = (SELECT m->'version-log' FROM vdoc),
    'view_version_log matches the version log the catalog serves, in order');

SELECT pgl_test.ok(
    (SELECT jsonb_object_agg(p.key, p.value)
     FROM lakekeeper.view_property p, eu_orders v
     WHERE p.warehouse_id = v.warehouse_id AND p.view_id = v.view_id)
    = (SELECT m->'properties' FROM vdoc),
    'view_property matches the properties the catalog serves');
