-- Schemas and their fields.

SELECT pgl_test.inlined('SELECT * FROM lakekeeper.tabular_schema');
SELECT pgl_test.inlined('SELECT * FROM lakekeeper.field WHERE tabular_id = gen_random_uuid()');

SELECT t.full_name, s.schema_id, s.typ
FROM lakekeeper.tabular_schema s
JOIN lakekeeper.tabular t ON t.warehouse_id = s.warehouse_id
                         AND t.tabular_id = s.tabular_id
ORDER BY t.full_name, s.schema_id;

SELECT f.field_id, f.parent_field_id, f.ordinal, f.node_role, f.name,
       f.type_name, f.required, f.is_identifier, f.doc
FROM lakekeeper.field f
JOIN lakekeeper.tabular t ON t.warehouse_id = f.warehouse_id
                         AND t.tabular_id = f.tabular_id
WHERE t.full_name = 'sales.eu.orders' AND f.schema_id = 0
ORDER BY f.field_id;

SELECT pgl_test.ok(
    (SELECT type_name FROM lakekeeper.field f
     JOIN lakekeeper.tabular t ON t.warehouse_id = f.warehouse_id
                              AND t.tabular_id = f.tabular_id
     WHERE t.full_name = 'sales.eu.orders' AND f.name = 'amount') = 'decimal(12, 2)',
    'a decimal renders with its precision and scale');

SELECT pgl_test.ok(
    (SELECT array_agg(f.node_role ORDER BY f.field_id)
     FROM lakekeeper.field f
     JOIN lakekeeper.tabular t ON t.warehouse_id = f.warehouse_id
                              AND t.tabular_id = f.tabular_id
     WHERE t.full_name = 'sales.eu.orders' AND f.parent_field_id IS NOT NULL)
    = ARRAY['field', 'field', 'element', 'key', 'value'],
    'list elements and map keys and values are labelled by their parent');

SELECT pgl_test.ok(
    (SELECT f.name FROM lakekeeper.field f
     JOIN lakekeeper.tabular t ON t.warehouse_id = f.warehouse_id
                              AND t.tabular_id = f.tabular_id
     WHERE t.full_name = 'sales.eu.orders' AND f.is_identifier) = 'order_id',
    'the identifier field is marked');

SELECT pgl_test.ok(
    (SELECT count(*) FROM lakekeeper.field f
     JOIN lakekeeper.tabular t ON t.warehouse_id = f.warehouse_id
                              AND t.tabular_id = f.tabular_id
     WHERE t.full_name = 'sales.eu.eu_orders') = 3,
    'view schemas carry fields too');

SELECT lakekeeper.iceberg_type_name('fixed', '{"length": 16}'::jsonb),
       lakekeeper.iceberg_type_name('string', NULL);
