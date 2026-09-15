-- Server, project, warehouse and namespace.

SELECT pgl_test.inlined('SELECT * FROM lakekeeper.server');
SELECT pgl_test.inlined('SELECT * FROM lakekeeper.project');
SELECT pgl_test.inlined('SELECT * FROM lakekeeper.warehouse');
SELECT pgl_test.inlined('SELECT * FROM lakekeeper.namespace WHERE warehouse_id = gen_random_uuid()');

SELECT pgl_test.ok(
    (SELECT count(*) FROM lakekeeper.server WHERE terms_accepted) = 1,
    'the server row records accepted terms');

SELECT pgl_test.ok(
    (SELECT count(*) FROM lakekeeper.project) = 2,
    'both projects are visible');

-- The list endpoint returns active warehouses only; the view shows every row.
SELECT pgl_test.ok(
    (SELECT array_agg(warehouse_name ORDER BY warehouse_name)
     FROM lakekeeper.warehouse WHERE status = 'active')
        = (SELECT array_agg(w->>'name' ORDER BY w->>'name')
           FROM pgl_test.api a, jsonb_array_elements(a.body->'warehouses') w
           WHERE a.name = 'warehouse_list'),
    'the active warehouses match the warehouse list endpoint');

SELECT pgl_test.ok(
    (SELECT count(*) FROM lakekeeper.warehouse WHERE status = 'inactive') = 1,
    'the deactivated warehouse is visible in the view');

SELECT warehouse_name, status, managed_by, protected, storage_type,
       has_storage_credential, tabular_delete_mode, tabular_expiration_seconds,
       allowed_format_versions, default_format_version
FROM lakekeeper.warehouse
ORDER BY warehouse_name;

SELECT pgl_test.ok(
    NOT EXISTS (SELECT 1 FROM lakekeeper.warehouse
                WHERE storage_profile ? 'aws-secret-access-key'
                   OR storage_profile ? 'storage-credential'),
    'the storage profile carries no credential material');

-- The whole namespace path, and the parent derived from it.
SELECT namespace_path, namespace_name, parent_namespace_name, depth, protected,
       namespace_properties
FROM lakekeeper.namespace
ORDER BY namespace_path;

SELECT pgl_test.ok(
    (SELECT parent_namespace_name FROM lakekeeper.namespace
     WHERE namespace_path = 'sales.eu.q1') = ARRAY['sales', 'eu'],
    'a nested namespace reports its parent path');

SELECT pgl_test.ok(
    (SELECT parent_namespace_name FROM lakekeeper.namespace
     WHERE namespace_path = 'sales') IS NULL,
    'a root namespace has no parent path');

-- Names come back under the default collation, so pattern matching works and
-- equality is case-sensitive.
SELECT pgl_test.ok(
    (SELECT count(*) FROM lakekeeper.namespace WHERE namespace_path LIKE 'sales%') = 3,
    'LIKE matches on namespace_path');

SELECT pgl_test.ok(
    (SELECT count(*) FROM lakekeeper.warehouse WHERE warehouse_name = 'WH_HARD') = 0
    AND (SELECT count(*) FROM lakekeeper.warehouse WHERE warehouse_name ILIKE 'WH_HARD') = 1,
    'name equality is case-sensitive and ILIKE is available');
