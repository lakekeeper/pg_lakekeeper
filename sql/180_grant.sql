SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._grant()
RETURNS TABLE (
    grant_id          uuid,
    principal_type    text,
    principal_id      text,
    user_id           text,
    role_id           uuid,
    privilege         text,
    resource_type     text,
    resource_name     text,
    project_id        text,
    warehouse_id      uuid,
    namespace_id      uuid,
    tabular_id        uuid,
    tabular_type      text,
    tag_definition_id uuid,
    created_at        timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT g.grant_id,
           g.principal_type::text,
           coalesce(g.user_id, g.role_id::text),
           g.user_id,
           g.role_id,
           g.privilege,
           g.resource_type::text,
           CASE g.resource_type
               WHEN 'project'   THEN p.project_name
               WHEN 'warehouse' THEN w.warehouse_name::text
               WHEN 'namespace' THEN array_to_string(n.namespace_name, '.')
               WHEN 'tabular'   THEN @lk@.concat_namespace_name_tabular_name(
                                         tb.tabular_namespace_name, tb.name)
               WHEN 'tag'       THEN td.name
           END,
           g.project_id,
           g.warehouse_id,
           g.namespace_id,
           g.tabular_id,
           tb.typ::text,
           g.tag_definition_id,
           g.created_at
    FROM @lk@.grant_assignment g
    LEFT JOIN @lk@.project p ON p.project_id = g.project_id
    LEFT JOIN @lk@.warehouse w ON w.warehouse_id = g.warehouse_id
    LEFT JOIN @lk@.namespace n
        ON n.warehouse_id = g.warehouse_id AND n.namespace_id = g.namespace_id
    LEFT JOIN @lk@.tabular tb
        ON tb.warehouse_id = g.warehouse_id AND tb.tabular_id = g.tabular_id
    LEFT JOIN @lk@.tag_definition td ON td.tag_definition_id = g.tag_definition_id
$body$;
$def$);

CREATE VIEW @extschema@."grant" WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._grant();

COMMENT ON VIEW @extschema@."grant" IS
    'Grant assignments recorded by the catalog. Which resource a row names is given by resource_type; the matching id column is set and the rest are null. These rows are what the catalog stores: an authorizer that keeps its own grant store enforces from there instead, and the allow-all authorizer records grants without enforcing any of them.';
