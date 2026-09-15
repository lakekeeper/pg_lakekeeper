-- What this installation is bound to, and whether the database still matches
-- the upstream build it was written against.

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._migration()
RETURNS TABLE (
    version           bigint,
    description       text,
    installed_on      timestamptz,
    success           boolean,
    execution_time_ms numeric
)
LANGUAGE sql STABLE
AS $body$
    SELECT m.version,
           m.description,
           m.installed_on,
           m.success,
           round(m.execution_time / 1000000.0, 3)
    FROM @lk@._sqlx_migrations m
$body$;
$def$);

CREATE VIEW @extschema@.migration WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._migration();

COMMENT ON VIEW @extschema@.migration IS
    'Upstream schema migrations applied to this database.';

CREATE FUNCTION @extschema@._info()
RETURNS TABLE (
    extension_version text,
    lakekeeper_schema text,
    upstream_sha      text,
    upstream_version  text,
    migration_count   integer,
    latest_version    bigint
)
LANGUAGE sql STABLE
AS $body$
    SELECT e.extversion,
           @extschema@._lakekeeper_schema(),
           p.upstream_sha,
           p.upstream_version,
           p.migration_count,
           p.latest_version
    FROM pg_catalog.pg_extension e,
         @extschema@._pin() p
    WHERE e.extname = 'pg_lakekeeper'
$body$;

CREATE VIEW @extschema@.info WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._info();

COMMENT ON VIEW @extschema@.info IS
    'One row: the bound schema and the upstream build this extension tracks.';

CREATE FUNCTION @extschema@.check_schema()
RETURNS TABLE (check_name text, status text, detail text)
LANGUAGE plpgsql STABLE AS $check$
DECLARE
    bound    text := @extschema@._lakekeeper_schema();
    resolved text := @extschema@._resolve_lakekeeper_schema();
    pin      record;
    seen     record;
BEGIN
    SELECT * INTO pin FROM @extschema@._pin();

    check_name := 'lakekeeper_schema';
    IF resolved IS NULL OR resolved = bound THEN
        status := 'ok';
        detail := format('bound to %I', bound);
    ELSE
        status := 'error';
        detail := format('bound to %I, Lakekeeper migrated %I; reinstall the extension to rebind',
                         bound, resolved);
    END IF;
    RETURN NEXT;

    IF to_regclass(format('%I._sqlx_migrations', bound)) IS NULL THEN
        check_name := 'migrations';
        status := 'notice';
        detail := format('%I._sqlx_migrations is absent; queries resolve once Lakekeeper has migrated',
                         bound);
        RETURN NEXT;
        RETURN;
    END IF;

    EXECUTE format(
        'SELECT count(*)::integer AS migration_count,
                max(version)::bigint AS latest_version,
                md5(string_agg(version::text || '':'' || encode(checksum, ''hex''), '','' ORDER BY version))
                    AS migration_digest
         FROM %I._sqlx_migrations
         WHERE success', bound)
    INTO seen;

    check_name := 'migration_digest';
    IF seen.migration_digest IS NOT DISTINCT FROM pin.migration_digest THEN
        status := 'ok';
        detail := format('%s migrations, latest %s', seen.migration_count, seen.latest_version);
    ELSE
        status := 'error';
        detail := format('written against %s migrations, latest %s (%s); database has %s, latest %s (%s)',
                         pin.migration_count, pin.latest_version, pin.migration_digest,
                         seen.migration_count, seen.latest_version, seen.migration_digest);
    END IF;
    RETURN NEXT;
END
$check$;

COMMENT ON FUNCTION @extschema@.check_schema() IS
    'One row per check: the bound schema, the presence of upstream migrations, and the migration digest.';

DO $guard$
DECLARE
    allow boolean := coalesce(
        nullif(current_setting('pg_lakekeeper.allow_unsupported_schema', true), '')::boolean,
        false);
    r record;
BEGIN
    FOR r IN SELECT * FROM @extschema@.check_schema() LOOP
        IF r.status = 'error' AND NOT allow THEN
            RAISE EXCEPTION 'pg_lakekeeper %: %', r.check_name, r.detail
                USING HINT = 'SET pg_lakekeeper.allow_unsupported_schema = on to install against it anyway.';
        ELSIF r.status = 'error' THEN
            RAISE WARNING 'pg_lakekeeper %: %', r.check_name, r.detail;
        ELSIF r.status = 'notice' THEN
            RAISE NOTICE 'pg_lakekeeper %: %', r.check_name, r.detail;
        END IF;
    END LOOP;
END
$guard$;
