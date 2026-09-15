-- Resolves the schema holding Lakekeeper's tables and records it in
-- _lakekeeper_schema(). _define() substitutes that name for the @lk@ marker in
-- every definition below, so the installed bodies name the schema literally.

CREATE FUNCTION @extschema@._resolve_lakekeeper_schema() RETURNS text
LANGUAGE plpgsql STABLE AS $resolve$
DECLARE
    src     text := nullif(current_setting('pg_lakekeeper.lakekeeper_schema', true), '');
    matches integer;
BEGIN
    IF src IS NOT NULL THEN
        RETURN src;
    END IF;

    SELECT count(*), min(n.nspname) INTO matches, src
    FROM pg_catalog.pg_class c
    JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace
    WHERE c.relname = '_sqlx_migrations' AND c.relkind = 'r';

    RETURN CASE WHEN matches = 1 THEN src END;
END
$resolve$;

COMMENT ON FUNCTION @extschema@._resolve_lakekeeper_schema() IS
    'The pg_lakekeeper.lakekeeper_schema setting, else the schema holding _sqlx_migrations, else NULL.';

DO $bind$
BEGIN
    EXECUTE format(
        'CREATE FUNCTION @extschema@._lakekeeper_schema() RETURNS text LANGUAGE sql IMMUTABLE AS %L',
        format('SELECT %L::text',
               coalesce(@extschema@._resolve_lakekeeper_schema(), 'public')));
END
$bind$;

COMMENT ON FUNCTION @extschema@._lakekeeper_schema() IS
    'The schema this installation is bound to.';

CREATE FUNCTION @extschema@._define(ddl text) RETURNS void
LANGUAGE plpgsql AS $define$
BEGIN
    EXECUTE replace(ddl, '@lk@', quote_ident(@extschema@._lakekeeper_schema()));
END
$define$;

COMMENT ON FUNCTION @extschema@._define(text) IS
    'Installs a definition with @lk@ replaced by the bound Lakekeeper schema.';
