SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._tabular()
RETURNS TABLE (
    warehouse_id      uuid,
    tabular_id        uuid,
    namespace_id      uuid,
    namespace_name    text[],
    name              text,
    full_name         text,
    typ               text,
    location          text,
    metadata_location text,
    is_live           boolean,
    protected         boolean,
    deleted_at        timestamptz,
    created_at        timestamptz,
    updated_at        timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT t.warehouse_id,
           t.tabular_id,
           t.namespace_id,
           t.tabular_namespace_name,
           t.name,
           @lk@.concat_namespace_name_tabular_name(t.tabular_namespace_name, t.name),
           t.typ::text,
           t.fs_protocol || '://' || t.fs_location,
           t.metadata_location,
           t.deleted_at IS NULL
               AND (t.metadata_location IS NOT NULL OR t.typ = 'generic-table'),
           t.protected,
           t.deleted_at,
           t.created_at,
           t.updated_at
    FROM @lk@.tabular t
$body$;
$def$);

CREATE VIEW @extschema@.tabular WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._tabular();

COMMENT ON VIEW @extschema@.tabular IS
    'Tables, views and generic tables in one relation. Soft-deleted rows are present with deleted_at set and is_live false.';
