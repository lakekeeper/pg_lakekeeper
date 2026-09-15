SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._iceberg_view()
RETURNS TABLE (
    warehouse_id       uuid,
    view_id            uuid,
    namespace_id       uuid,
    namespace_name     text[],
    name               text,
    full_name          text,
    location           text,
    metadata_location  text,
    format_version     text,
    current_version_id integer,
    current_schema_id  integer,
    is_live            boolean,
    protected          boolean,
    deleted_at         timestamptz,
    created_at         timestamptz,
    updated_at         timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT v.warehouse_id,
           v.view_id,
           tb.namespace_id,
           tb.tabular_namespace_name,
           tb.name,
           @lk@.concat_namespace_name_tabular_name(tb.tabular_namespace_name, tb.name),
           tb.fs_protocol || '://' || tb.fs_location,
           tb.metadata_location,
           v.view_format_version::text,
           cur.version_id,
           ver.schema_id,
           tb.deleted_at IS NULL AND tb.metadata_location IS NOT NULL,
           tb.protected,
           tb.deleted_at,
           v.created_at,
           v.updated_at
    FROM @lk@."view" v
    JOIN @lk@.tabular tb
        ON tb.warehouse_id = v.warehouse_id AND tb.tabular_id = v.view_id
    LEFT JOIN @lk@.current_view_metadata_version cur
        ON cur.warehouse_id = v.warehouse_id AND cur.view_id = v.view_id
    LEFT JOIN @lk@.view_version ver
        ON ver.warehouse_id = v.warehouse_id AND ver.view_id = v.view_id
       AND ver.version_id = cur.version_id
$body$;
$def$);

CREATE VIEW @extschema@.iceberg_view WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._iceberg_view();

COMMENT ON VIEW @extschema@.iceberg_view IS
    'Iceberg views. current_version_id names the version the catalog serves.';

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._view_version()
RETURNS TABLE (
    warehouse_id           uuid,
    view_id                uuid,
    version_id             integer,
    schema_id              integer,
    timestamp_at           timestamptz,
    default_catalog        text,
    default_namespace_id   uuid,
    default_namespace_name text[],
    summary                jsonb,
    created_at             timestamptz,
    updated_at             timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT v.warehouse_id,
           v.view_id,
           v.version_id,
           v.schema_id,
           v."timestamp",
           v.default_catalog,
           v.default_namespace_id,
           n.namespace_name,
           v.summary,
           v.created_at,
           v.updated_at
    FROM @lk@.view_version v
    LEFT JOIN @lk@.namespace n
        ON n.warehouse_id = v.warehouse_id AND n.namespace_id = v.default_namespace_id
$body$;
$def$);

CREATE VIEW @extschema@.view_version WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._view_version();

COMMENT ON VIEW @extschema@.view_version IS
    'View versions. default_namespace_name resolves the namespace unqualified names in the view SQL are read against.';

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._view_representation()
RETURNS TABLE (
    warehouse_id           uuid,
    view_id                uuid,
    version_id             integer,
    view_representation_id uuid,
    typ                    text,
    dialect                text,
    sql                    text,
    created_at             timestamptz,
    updated_at             timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT r.warehouse_id, r.view_id, r.view_version_id, r.view_representation_id,
           r.typ::text, r.dialect, r.sql, r.created_at, r.updated_at
    FROM @lk@.view_representation r
$body$;
$def$);

CREATE VIEW @extschema@.view_representation WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._view_representation();

COMMENT ON VIEW @extschema@.view_representation IS
    'The query behind each view version, one row per dialect.';

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._view_property()
RETURNS TABLE (
    warehouse_id uuid,
    view_id      uuid,
    key          text,
    value        text,
    created_at   timestamptz,
    updated_at   timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT p.warehouse_id, p.view_id, p.key, p.value, p.created_at, p.updated_at
    FROM @lk@.view_properties p
$body$;
$def$);

CREATE VIEW @extschema@.view_property WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._view_property();

COMMENT ON VIEW @extschema@.view_property IS
    'View properties, one row per key.';

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._view_version_log()
RETURNS TABLE (
    warehouse_id uuid,
    view_id      uuid,
    version_id   integer,
    timestamp_at timestamptz,
    created_at   timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT l.warehouse_id, l.view_id, l.version_id, l."timestamp", l.created_at
    FROM @lk@.view_version_log l
$body$;
$def$);

CREATE VIEW @extschema@.view_version_log WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._view_version_log();

COMMENT ON VIEW @extschema@.view_version_log IS
    'The order in which view versions became current.';
