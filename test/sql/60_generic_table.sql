-- Generic (non-Iceberg) tables.

SELECT pgl_test.inlined('SELECT * FROM lakekeeper.generic_table WHERE warehouse_id = gen_random_uuid()');
SELECT pgl_test.inlined('SELECT * FROM lakekeeper.generic_table_property');

SELECT full_name, format, doc, location, schema_info, is_live, protected
FROM lakekeeper.generic_table
ORDER BY full_name;

SELECT g.full_name, p.key, p.value
FROM lakekeeper.generic_table_property p
JOIN lakekeeper.generic_table g USING (warehouse_id, generic_table_id)
ORDER BY g.full_name, p.key;

SELECT pgl_test.ok(
    (SELECT array_agg(g.name ORDER BY g.name) FROM lakekeeper.generic_table g)
        = (SELECT array_agg(i->>'name' ORDER BY i->>'name')
           FROM pgl_test.api a, jsonb_array_elements(a.body->'identifiers') i
           WHERE a.name = 'generic_table_list'),
    'the generic table listing matches the generic table list endpoint');
