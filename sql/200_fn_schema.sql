SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._field_members(
    p_warehouse_id uuid,
    p_tabular_id uuid,
    p_schema_id integer,
    p_parent_field_id integer
)
RETURNS jsonb
LANGUAGE plpgsql STABLE AS $members$
DECLARE
    members jsonb := '[]'::jsonb;
    f       record;
BEGIN
    FOR f IN
        SELECT s.field_id, s.name, s.required, s.doc, s.type_kind::text AS type_kind,
               s.type_params, s.initial_default, s.write_default
        FROM @lk@.schema_field s
        WHERE s.warehouse_id = p_warehouse_id
          AND s.tabular_id = p_tabular_id
          AND s.schema_id = p_schema_id
          AND s.parent_field_id IS NOT DISTINCT FROM p_parent_field_id
        ORDER BY s.ordinal
    LOOP
        members := members || jsonb_build_array(
            jsonb_build_object(
                'id', f.field_id,
                'name', f.name,
                'required', f.required,
                'type', @extschema@._field_type(p_warehouse_id, p_tabular_id, p_schema_id,
                                                f.field_id, f.type_kind, f.type_params))
            || CASE WHEN f.doc IS NULL THEN '{}'::jsonb
                    ELSE jsonb_build_object('doc', f.doc) END
            || CASE WHEN f.initial_default IS NULL THEN '{}'::jsonb
                    ELSE jsonb_build_object('initial-default', f.initial_default) END
            || CASE WHEN f.write_default IS NULL THEN '{}'::jsonb
                    ELSE jsonb_build_object('write-default', f.write_default) END);
    END LOOP;

    RETURN members;
END
$members$;
$def$);

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._field_type(
    p_warehouse_id uuid,
    p_tabular_id uuid,
    p_schema_id integer,
    p_field_id integer,
    p_type_kind text,
    p_type_params jsonb
)
RETURNS jsonb
LANGUAGE plpgsql STABLE AS $type$
DECLARE
    child record;
    val   record;
BEGIN
    IF p_type_kind = 'struct' THEN
        RETURN jsonb_build_object(
            'type', 'struct',
            'fields', @extschema@._field_members(p_warehouse_id, p_tabular_id,
                                                 p_schema_id, p_field_id));
    END IF;

    IF p_type_kind = 'list' THEN
        SELECT s.field_id, s.required, s.type_kind::text AS type_kind, s.type_params
          INTO child
          FROM @lk@.schema_field s
         WHERE s.warehouse_id = p_warehouse_id
           AND s.tabular_id = p_tabular_id
           AND s.schema_id = p_schema_id
           AND s.parent_field_id = p_field_id;

        RETURN jsonb_build_object(
            'type', 'list',
            'element-id', child.field_id,
            'element-required', child.required,
            'element', @extschema@._field_type(p_warehouse_id, p_tabular_id, p_schema_id,
                                               child.field_id, child.type_kind,
                                               child.type_params));
    END IF;

    IF p_type_kind = 'map' THEN
        SELECT s.field_id, s.required, s.type_kind::text AS type_kind, s.type_params
          INTO child
          FROM @lk@.schema_field s
         WHERE s.warehouse_id = p_warehouse_id
           AND s.tabular_id = p_tabular_id
           AND s.schema_id = p_schema_id
           AND s.parent_field_id = p_field_id
           AND s.ordinal = 0;

        SELECT s.field_id, s.required, s.type_kind::text AS type_kind, s.type_params
          INTO val
          FROM @lk@.schema_field s
         WHERE s.warehouse_id = p_warehouse_id
           AND s.tabular_id = p_tabular_id
           AND s.schema_id = p_schema_id
           AND s.parent_field_id = p_field_id
           AND s.ordinal = 1;

        RETURN jsonb_build_object(
            'type', 'map',
            'key-id', child.field_id,
            'key', @extschema@._field_type(p_warehouse_id, p_tabular_id, p_schema_id,
                                           child.field_id, child.type_kind, child.type_params),
            'value-id', val.field_id,
            'value-required', val.required,
            'value', @extschema@._field_type(p_warehouse_id, p_tabular_id, p_schema_id,
                                             val.field_id, val.type_kind, val.type_params));
    END IF;

    RETURN to_jsonb(@extschema@.iceberg_type_name(p_type_kind, p_type_params));
END
$type$;
$def$);

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@.schema_json(warehouse_id uuid, tabular_id uuid, schema_id integer)
RETURNS jsonb
LANGUAGE plpgsql STABLE AS $schema$
DECLARE
    doc jsonb;
    ids jsonb;
BEGIN
    doc := jsonb_build_object(
        'type', 'struct',
        'schema-id', schema_json.schema_id,
        'fields', @extschema@._field_members(schema_json.warehouse_id, schema_json.tabular_id,
                                             schema_json.schema_id, NULL));

    SELECT jsonb_agg(s.field_id ORDER BY s.field_id) INTO ids
    FROM @lk@.schema_field s
    WHERE s.warehouse_id = schema_json.warehouse_id
      AND s.tabular_id = schema_json.tabular_id
      AND s.schema_id = schema_json.schema_id
      AND s.is_identifier;

    IF ids IS NOT NULL THEN
        doc := doc || jsonb_build_object('identifier-field-ids', ids);
    END IF;

    RETURN doc;
END
$schema$;
$def$);

COMMENT ON FUNCTION @extschema@.schema_json(uuid, uuid, integer) IS
    'The Iceberg schema document for one schema of a table or view.';
