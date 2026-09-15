-- Tag definitions and the tags attached to objects.

SELECT pgl_test.inlined('SELECT * FROM lakekeeper.tag_definition');
SELECT pgl_test.inlined('SELECT * FROM lakekeeper.tag_allowed_value');
SELECT pgl_test.inlined('SELECT * FROM lakekeeper.tag WHERE warehouse_id = gen_random_uuid()');

SELECT name, description, scope, value_kind
FROM lakekeeper.tag_definition
ORDER BY name;

SELECT d.name, v.value
FROM lakekeeper.tag_allowed_value v
JOIN lakekeeper.tag_definition d USING (tag_definition_id)
ORDER BY d.name, v.value;

SELECT tag_name, target_type, value, source,
       field_id IS NOT NULL AS on_column
FROM lakekeeper.tag
ORDER BY target_type, tag_name;

SELECT pgl_test.ok(
    (SELECT count(DISTINCT target_type) FROM lakekeeper.tag) = 6,
    'tags are attached to every target kind the fixture covers');

SELECT pgl_test.ok(
    (SELECT array_agg(d.name ORDER BY d.name) FROM lakekeeper.tag_definition d)
        = (SELECT array_agg(x->>'name' ORDER BY x->>'name')
           FROM pgl_test.api a, jsonb_array_elements(a.body->'tag-definitions') x
           WHERE a.name = 'tag_definition_list'),
    'the tag definition view matches the tag definition list endpoint');
