-- Grant assignments.

SELECT pgl_test.inlined('SELECT * FROM lakekeeper."grant"');

SELECT resource_type, resource_name, privilege, principal_type,
       CASE principal_type
           WHEN 'user' THEN principal_id
           ELSE (SELECT r.name FROM lakekeeper.role r WHERE r.role_id::text = principal_id)
       END AS principal,
       tabular_type
FROM lakekeeper."grant"
ORDER BY resource_type, privilege;

SELECT pgl_test.ok(
    (SELECT count(*) FROM lakekeeper."grant"
     WHERE principal_type = 'user' AND (user_id IS NULL OR role_id IS NOT NULL)) = 0
    AND (SELECT count(*) FROM lakekeeper."grant"
         WHERE principal_type = 'role' AND (role_id IS NULL OR user_id IS NOT NULL)) = 0,
    'exactly one principal column is set per row');

SELECT pgl_test.ok(
    (SELECT count(*) FROM lakekeeper."grant" WHERE resource_type = 'server'
                                               AND resource_name IS NOT NULL) = 0,
    'a server grant names no resource');

SELECT pgl_test.ok(
    (SELECT count(*) FROM lakekeeper."grant"
     WHERE resource_type <> 'server' AND resource_name IS NULL) = 0,
    'every other grant resolves a resource name');

SELECT pgl_test.ok(
    (SELECT count(*) FROM lakekeeper."grant")
        = (SELECT jsonb_array_length(body->'grants')
           FROM pgl_test.api WHERE name = 'grant_list')
          + (SELECT count(*) FROM lakekeeper."grant" WHERE resource_type <> 'warehouse'),
    'the warehouse grants match the warehouse grant endpoint');
