SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._tag_definition()
RETURNS TABLE (
    tag_definition_id uuid,
    project_id        text,
    name              text,
    description       text,
    scope             text[],
    value_kind        text,
    created_at        timestamptz,
    updated_at        timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT d.tag_definition_id, d.project_id, d.name, d.description, d.scope,
           d.value_kind::text, d.created_at, d.updated_at
    FROM @lk@.tag_definition d
$body$;
$def$);

CREATE VIEW @extschema@.tag_definition WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._tag_definition();

COMMENT ON VIEW @extschema@.tag_definition IS
    'Tag definitions. scope lists the target kinds the tag may be applied to; value_kind says how its value is constrained.';

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._tag_allowed_value()
RETURNS TABLE (
    tag_definition_id uuid,
    value             text,
    created_at        timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT v.tag_definition_id, v.value, v.created_at
    FROM @lk@.tag_allowed_value v
$body$;
$def$);

CREATE VIEW @extschema@.tag_allowed_value WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._tag_allowed_value();

COMMENT ON VIEW @extschema@.tag_allowed_value IS
    'The permitted values of an enumerated tag definition.';

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._tag()
RETURNS TABLE (
    tag_id            uuid,
    tag_definition_id uuid,
    tag_name          text,
    target_type       text,
    warehouse_id      uuid,
    namespace_id      uuid,
    tabular_id        uuid,
    field_id          integer,
    value             text,
    source            text,
    created_at        timestamptz,
    updated_at        timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT t.tag_id,
           t.tag_definition_id,
           d.name,
           CASE
               WHEN t.field_id IS NOT NULL THEN 'column'
               WHEN t.tabular_id IS NOT NULL THEN tb.typ::text
               WHEN t.namespace_id IS NOT NULL THEN 'namespace'
               ELSE 'warehouse'
           END,
           t.warehouse_id,
           t.namespace_id,
           t.tabular_id,
           t.field_id,
           t.value,
           t.source::text,
           t.created_at,
           t.updated_at
    FROM @lk@.tag t
    JOIN @lk@.tag_definition d ON d.tag_definition_id = t.tag_definition_id
    LEFT JOIN @lk@.tabular tb
        ON tb.warehouse_id = t.warehouse_id AND tb.tabular_id = t.tabular_id
$body$;
$def$);

CREATE VIEW @extschema@.tag WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._tag();

COMMENT ON VIEW @extschema@.tag IS
    'Tags attached to catalog objects. target_type says what the row is attached to, and the matching id columns are set.';
