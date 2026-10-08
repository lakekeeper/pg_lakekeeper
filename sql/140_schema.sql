CREATE FUNCTION @extschema@.iceberg_type_name(type_kind text, type_params jsonb)
RETURNS text
LANGUAGE sql IMMUTABLE
AS $body$
    SELECT CASE type_kind
        WHEN 'decimal' THEN
            format('decimal(%s, %s)', type_params->>'precision', type_params->>'scale')
        WHEN 'fixed' THEN
            format('fixed[%s]', type_params->>'length')
        ELSE type_kind
    END
$body$;

COMMENT ON FUNCTION @extschema@.iceberg_type_name(text, jsonb) IS
    'The Iceberg type name for a field, parameters included: decimal(12, 2), fixed[16].';

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._tabular_schema()
RETURNS TABLE (
    warehouse_id uuid,
    tabular_id   uuid,
    schema_id    integer,
    typ          text,
    created_at   timestamptz,
    updated_at   timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT s.warehouse_id, s.table_id, s.schema_id, 'table'::text,
           s.created_at, s.updated_at
    FROM @lk@.table_schema s
    UNION ALL
    SELECT s.warehouse_id, s.view_id, s.schema_id, 'view'::text,
           s.created_at, s.updated_at
    FROM @lk@.view_schema s
$body$;
$def$);

CREATE VIEW @extschema@.tabular_schema WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._tabular_schema();

COMMENT ON VIEW @extschema@.tabular_schema IS
    'Every schema of every table and view. The fields are in the field view.';

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._field()
RETURNS TABLE (
    warehouse_id    uuid,
    tabular_id      uuid,
    schema_id       integer,
    field_id        integer,
    parent_field_id integer,
    ordinal         integer,
    node_role       text,
    name            text,
    type_kind       text,
    type_name       text,
    type_params     jsonb,
    required        boolean,
    is_identifier   boolean,
    doc             text,
    initial_default jsonb,
    write_default   jsonb
)
LANGUAGE sql STABLE
AS $body$
    SELECT f.warehouse_id,
           f.tabular_id,
           f.schema_id,
           f.field_id,
           f.parent_field_id,
           f.ordinal,
           CASE
               WHEN f.parent_field_id IS NULL THEN 'field'
               WHEN p.type_kind = 'list' THEN 'element'
               WHEN p.type_kind = 'map' AND f.ordinal = 0 THEN 'key'
               WHEN p.type_kind = 'map' THEN 'value'
               ELSE 'field'
           END,
           f.name,
           f.type_kind::text,
           @extschema@.iceberg_type_name(f.type_kind::text, f.type_params),
           f.type_params,
           f.required,
           f.is_identifier,
           f.doc,
           f.initial_default,
           f.write_default
    FROM @lk@.schema_field f
    LEFT JOIN @lk@.schema_field p
        ON p.warehouse_id = f.warehouse_id
       AND p.tabular_id = f.tabular_id
       AND p.schema_id = f.schema_id
       AND p.field_id = f.parent_field_id
$body$;
$def$);

CREATE VIEW @extschema@.field WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._field();

COMMENT ON VIEW @extschema@.field IS
    'Schema fields, nested members included. node_role says what the row is to its parent: a struct field, a list element, or a map key or value.';
