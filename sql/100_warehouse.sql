SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._server()
RETURNS TABLE (
    server_id          uuid,
    terms_accepted     boolean,
    open_for_bootstrap boolean,
    created_at         timestamptz,
    updated_at         timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT s.server_id, s.terms_accepted, s.open_for_bootstrap, s.created_at, s.updated_at
    FROM @lk@.server s
$body$;
$def$);

CREATE VIEW @extschema@.server WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._server();

COMMENT ON VIEW @extschema@.server IS
    'One row: the catalog server''s identity and bootstrap state.';

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._project()
RETURNS TABLE (
    project_id   text,
    project_name text,
    version      bigint,
    created_at   timestamptz,
    updated_at   timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT p.project_id, p.project_name, p.version, p.created_at, p.updated_at
    FROM @lk@.project p
$body$;
$def$);

CREATE VIEW @extschema@.project WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._project();

COMMENT ON VIEW @extschema@.project IS
    'Projects. A project owns warehouses, roles and tag definitions.';

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._warehouse()
RETURNS TABLE (
    warehouse_id               uuid,
    warehouse_name             text,
    project_id                 text,
    status                     text,
    managed_by                 text,
    protected                  boolean,
    storage_type               text,
    storage_profile            jsonb,
    has_storage_credential     boolean,
    tabular_delete_mode        text,
    tabular_expiration_seconds bigint,
    allowed_format_versions    smallint[],
    default_format_version     smallint,
    version                    bigint,
    created_at                 timestamptz,
    updated_at                 timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT w.warehouse_id,
           w.warehouse_name::text,
           w.project_id,
           w.status::text,
           w.managed_by::text,
           w.protected,
           w.storage_profile->>'type',
           w.storage_profile,
           w.storage_secret_id IS NOT NULL,
           w.tabular_delete_mode::text,
           w.tabular_expiration_seconds,
           w.allowed_format_versions,
           w.default_format_version,
           w.version,
           w.created_at,
           w.updated_at
    FROM @lk@.warehouse w
$body$;
$def$);

CREATE VIEW @extschema@.warehouse WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._warehouse();

COMMENT ON VIEW @extschema@.warehouse IS
    'Warehouses. storage_profile carries no credential material; has_storage_credential only reports whether one is stored.';
