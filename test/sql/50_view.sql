-- Iceberg view detail.

SELECT pgl_test.inlined('SELECT * FROM lakekeeper.iceberg_view WHERE warehouse_id = gen_random_uuid()');
SELECT pgl_test.inlined('SELECT * FROM lakekeeper.view_version');
SELECT pgl_test.inlined('SELECT * FROM lakekeeper.view_representation');
SELECT pgl_test.inlined('SELECT * FROM lakekeeper.view_property');
SELECT pgl_test.inlined('SELECT * FROM lakekeeper.view_version_log');

SELECT full_name, format_version, current_version_id, current_schema_id, is_live
FROM lakekeeper.iceberg_view
ORDER BY full_name;

SELECT iv.full_name, v.version_id, v.schema_id, v.default_catalog,
       v.default_namespace_name, v.summary
FROM lakekeeper.view_version v
JOIN lakekeeper.iceberg_view iv USING (warehouse_id, view_id)
ORDER BY iv.full_name, v.version_id;

SELECT iv.full_name, r.version_id, r.typ, r.dialect, r.sql
FROM lakekeeper.view_representation r
JOIN lakekeeper.iceberg_view iv USING (warehouse_id, view_id)
ORDER BY iv.full_name, r.version_id, r.dialect;

SELECT pgl_test.ok(
    (SELECT current_version_id FROM lakekeeper.iceberg_view
     WHERE full_name = 'sales.eu.eu_orders') = 2,
    'the view reports the version the catalog serves');

SELECT pgl_test.ok(
    (SELECT count(*) FROM lakekeeper.view_version_log l
     JOIN lakekeeper.iceberg_view v USING (warehouse_id, view_id)
     WHERE v.full_name = 'sales.eu.eu_orders') = 2,
    'the version log records both versions');

SELECT pgl_test.ok(
    (SELECT array_agg(v.name ORDER BY v.name) FROM lakekeeper.iceberg_view v
     WHERE v.is_live AND v.namespace_name = ARRAY['sales', 'eu'])
        = (SELECT array_agg(i->>'name' ORDER BY i->>'name')
           FROM pgl_test.api a, jsonb_array_elements(a.body->'identifiers') i
           WHERE a.name = 'view_list'),
    'the view listing matches the view list endpoint');

SELECT p.key, p.value FROM lakekeeper.view_property p ORDER BY p.key;
