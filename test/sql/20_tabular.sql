-- Tables, views and generic tables.

SELECT pgl_test.inlined('SELECT * FROM lakekeeper.tabular WHERE warehouse_id = gen_random_uuid()');

SELECT w.warehouse_name, t.full_name, t.typ, t.is_live, t.protected,
       t.deleted_at IS NOT NULL AS soft_deleted,
       t.metadata_location IS NOT NULL AS has_metadata_pointer
FROM lakekeeper.tabular t
JOIN lakekeeper.warehouse w USING (warehouse_id)
ORDER BY w.warehouse_name, t.full_name;

SELECT pgl_test.ok(
    (SELECT location FROM lakekeeper.tabular WHERE full_name = 'sales.eu.orders')
        LIKE 's3://warehouse/hard/%',
    'location joins the protocol to the stored path');

-- A generic table has no metadata pointer and is still live.
SELECT pgl_test.ok(
    (SELECT is_live FROM lakekeeper.tabular
     WHERE full_name = 'logs.delta_events' AND typ = 'generic-table'),
    'a generic table counts as live without a metadata pointer');

SELECT pgl_test.ok(
    NOT (SELECT is_live FROM lakekeeper.tabular WHERE full_name = 'staging.retired'),
    'a soft-deleted table is not live');

SELECT pgl_test.ok(
    NOT EXISTS (SELECT 1 FROM lakekeeper.tabular WHERE name = 'scratch'),
    'a table dropped from a hard-delete warehouse leaves no row');

SELECT pgl_test.ok(
    (SELECT array_agg(t.name ORDER BY t.name)
     FROM lakekeeper.tabular t
     WHERE t.namespace_name = ARRAY['sales', 'eu'] AND t.typ = 'table' AND t.is_live)
        = (SELECT array_agg(i->>'name' ORDER BY i->>'name')
           FROM pgl_test.api a, jsonb_array_elements(a.body->'identifiers') i
           WHERE a.name = 'table_list'),
    'the live tables in sales.eu match the table list endpoint');

SELECT pgl_test.ok(
    (SELECT array_agg(t.name ORDER BY t.name)
     FROM lakekeeper.tabular t
     WHERE t.namespace_name = ARRAY['sales', 'eu'] AND t.typ = 'view' AND t.is_live)
        = (SELECT array_agg(i->>'name' ORDER BY i->>'name')
           FROM pgl_test.api a, jsonb_array_elements(a.body->'identifiers') i
           WHERE a.name = 'view_list'),
    'the live views in sales.eu match the view list endpoint');
