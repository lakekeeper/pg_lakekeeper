SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._namespace()
RETURNS TABLE (
    warehouse_id          uuid,
    namespace_id          uuid,
    namespace_name        text[],
    namespace_path        text,
    parent_namespace_name text[],
    depth                 integer,
    namespace_properties  jsonb,
    protected             boolean,
    version               bigint,
    created_at            timestamptz,
    updated_at            timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT n.warehouse_id,
           n.namespace_id,
           n.namespace_name,
           array_to_string(n.namespace_name, '.'),
           CASE WHEN n.depth > 1 THEN n.namespace_name[1:n.depth - 1] END,
           n.depth,
           n.namespace_properties,
           n.protected,
           n.version,
           n.created_at,
           n.updated_at
    FROM @lk@.namespace n
$body$;
$def$);

CREATE VIEW @extschema@.namespace WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._namespace();

COMMENT ON VIEW @extschema@.namespace IS
    'Namespaces. namespace_name is the full path from the root; namespace_path is the same path dotted.';
