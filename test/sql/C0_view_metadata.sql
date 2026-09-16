-- The Iceberg view metadata document and the load-view response.

SELECT pgl_test.ok(
    pgl_test.doc_eq(
        lakekeeper.load_view(w.warehouse_id, ARRAY['sales', 'eu'], 'eu_orders')->'metadata',
        (SELECT body->'metadata' FROM pgl_test.api WHERE name = 'load_view_eu_orders'))
    AND lakekeeper.load_view(w.warehouse_id, ARRAY['sales', 'eu'], 'eu_orders')->'metadata-location'
        = (SELECT body->'metadata-location' FROM pgl_test.api
           WHERE name = 'load_view_eu_orders'),
    'load_view matches the catalog response')
FROM lakekeeper.warehouse w WHERE w.warehouse_name = 'wh_hard';

SELECT jsonb_path_query_array(
           lakekeeper.view_metadata(v.warehouse_id, v.view_id),
           '$."version-log"[*]."version-id"') AS version_log,
       jsonb_path_query_array(
           lakekeeper.view_metadata(v.warehouse_id, v.view_id),
           '$.versions[*]."version-id"') AS versions
FROM lakekeeper.iceberg_view v WHERE v.full_name = 'sales.eu.eu_orders';

SELECT pgl_test.ok(
    lakekeeper.load_view(w.warehouse_id, ARRAY['sales', 'eu'], 'orders') IS NULL,
    'a table is not returned as a view')
FROM lakekeeper.warehouse w WHERE w.warehouse_name = 'wh_hard';

SELECT pgl_test.ok(
    lakekeeper.load_view(w.warehouse_id, ARRAY['SALES', 'EU'], 'EU_ORDERS') IS NOT NULL,
    'the view name lookup is case-insensitive, as the catalog is')
FROM lakekeeper.warehouse w WHERE w.warehouse_name = 'wh_hard';

SELECT pgl_test.ok(
    pgl_test.doc_eq(
        lakekeeper.load_view(w.warehouse_id, ARRAY['sales', 'eu'], 'eu_orders_cat')->'metadata',
        (SELECT body->'metadata' FROM pgl_test.api WHERE name = 'load_view_eu_orders_cat'))
    AND (lakekeeper.view_metadata(v.warehouse_id, v.view_id)->'versions'->0->>'default-catalog') = 'prod',
    'load_view matches the catalog response for a view with a default catalog')
FROM lakekeeper.warehouse w
JOIN lakekeeper.iceberg_view v ON v.warehouse_id = w.warehouse_id
WHERE w.warehouse_name = 'wh_hard' AND v.full_name = 'sales.eu.eu_orders_cat';
