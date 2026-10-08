SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._generic_table()
RETURNS TABLE (
    warehouse_id     uuid,
    generic_table_id uuid,
    namespace_id     uuid,
    namespace_name   text[],
    name             text,
    full_name        text,
    format           text,
    location         text,
    doc              text,
    schema_info      jsonb,
    statistics       jsonb,
    version          bigint,
    is_live          boolean,
    protected        boolean,
    deleted_at       timestamptz,
    created_at       timestamptz,
    updated_at       timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT g.warehouse_id,
           g.generic_table_id,
           tb.namespace_id,
           tb.tabular_namespace_name,
           tb.name,
           @lk@.concat_namespace_name_tabular_name(tb.tabular_namespace_name, tb.name),
           g.format,
           tb.fs_protocol || '://' || tb.fs_location,
           g.doc,
           g.schema_info,
           g.statistics,
           g.version,
           tb.deleted_at IS NULL,
           tb.protected,
           tb.deleted_at,
           g.created_at,
           g.updated_at
    FROM @lk@.generic_table g
    JOIN @lk@.tabular tb
        ON tb.warehouse_id = g.warehouse_id AND tb.tabular_id = g.generic_table_id
$body$;
$def$);

CREATE VIEW @extschema@.generic_table WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._generic_table();

COMMENT ON VIEW @extschema@.generic_table IS
    'Non-Iceberg tables registered in the catalog. format names the table format; schema_info is whatever the writer recorded.';

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._generic_table_property()
RETURNS TABLE (
    warehouse_id     uuid,
    generic_table_id uuid,
    key              text,
    value            text,
    created_at       timestamptz,
    updated_at       timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT p.warehouse_id, p.generic_table_id, p.key, p.value,
           p.created_at, p.updated_at
    FROM @lk@.generic_table_properties p
$body$;
$def$);

CREATE VIEW @extschema@.generic_table_property WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._generic_table_property();

COMMENT ON VIEW @extschema@.generic_table_property IS
    'Generic table properties, one row per key.';
