-- The Iceberg schema document.

SELECT jsonb_pretty(lakekeeper.schema_json(t.warehouse_id, t.tabular_id, 0))
FROM lakekeeper.tabular t
WHERE t.full_name = 'sales.eu.orders';

SELECT pgl_test.ok(
    pgl_test.json_canonical(
        (SELECT jsonb_agg(lakekeeper.schema_json(t.warehouse_id, t.tabular_id, s.schema_id))
         FROM lakekeeper.tabular t
         JOIN lakekeeper.tabular_schema s ON s.warehouse_id = t.warehouse_id
                                         AND s.tabular_id = t.tabular_id
         WHERE t.full_name = 'sales.eu.orders'))
    = pgl_test.json_canonical(
        (SELECT body->'metadata'->'schemas' FROM pgl_test.api
         WHERE name = 'load_table_orders')),
    'the schema document matches the one the catalog serves for orders');

SELECT pgl_test.ok(
    pgl_test.json_canonical(
        (SELECT jsonb_agg(lakekeeper.schema_json(t.warehouse_id, t.tabular_id, s.schema_id))
         FROM lakekeeper.tabular t
         JOIN lakekeeper.tabular_schema s ON s.warehouse_id = t.warehouse_id
                                         AND s.tabular_id = t.tabular_id
         WHERE t.full_name = 'sales.eu.eu_orders'))
    = pgl_test.json_canonical(
        (SELECT body->'metadata'->'schemas' FROM pgl_test.api
         WHERE name = 'load_view_eu_orders')),
    'the schema document matches the one the catalog serves for a view');

SELECT pgl_test.ok(
    NOT (lakekeeper.schema_json(t.warehouse_id, t.tabular_id, 0) ? 'identifier-field-ids'),
    'a schema with no identifier fields omits the key')
FROM lakekeeper.tabular t WHERE t.full_name = 'logs.events';
