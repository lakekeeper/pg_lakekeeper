--
-- PostgreSQL database dump
--

\restrict Z03fpMvbSYvdD0o5MPO5oOhQuniNBytBQcX5cszHtzshmkg2sYrosyXVqpyaA64

-- Dumped from database version 15.19 (Debian 15.19-1.pgdg13+2)
-- Dumped by pg_dump version 15.19 (Debian 15.19-1.pgdg13+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: SCHEMA "public"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA "public" IS 'standard public schema';


--
-- Name: case_insensitive; Type: COLLATION; Schema: public; Owner: -
--

CREATE COLLATION "public"."case_insensitive" (provider = icu, deterministic = false, locale = 'und-u-ks-level2');


--
-- Name: btree_gin; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "btree_gin" WITH SCHEMA "public";


--
-- Name: EXTENSION "btree_gin"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "btree_gin" IS 'support for indexing common datatypes in GIN';


--
-- Name: btree_gist; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "btree_gist" WITH SCHEMA "public";


--
-- Name: EXTENSION "btree_gist"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "btree_gist" IS 'support for indexing common datatypes in GiST';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "pg_trgm" WITH SCHEMA "public";


--
-- Name: EXTENSION "pg_trgm"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "pg_trgm" IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "public";


--
-- Name: EXTENSION "pgcrypto"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "pgcrypto" IS 'cryptographic functions';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "public";


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: api_endpoints; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."api_endpoints" AS ENUM (
    'sign-s3-request-global',
    'sign-s3-request-prefix',
    'catalog-v1-get-config',
    'catalog-v1-list-namespaces',
    'catalog-v1-create-namespace',
    'catalog-v1-load-namespace-metadata',
    'catalog-v1-namespace-exists',
    'catalog-v1-fetch-scan-tasks',
    'catalog-v1-drop-namespace',
    'catalog-v1-update-namespace-properties',
    'catalog-v1-list-tables',
    'catalog-v1-create-table',
    'catalog-v1-load-table',
    'catalog-v1-update-table',
    'catalog-v1-drop-table',
    'catalog-v1-table-exists',
    'catalog-v1-load-credentials',
    'catalog-v1-rename-table',
    'catalog-v1-register-table',
    'catalog-v1-report-metrics',
    'catalog-v1-commit-transaction',
    'catalog-v1-create-view',
    'catalog-v1-list-views',
    'catalog-v1-load-view',
    'catalog-v1-replace-view',
    'catalog-v1-drop-view',
    'catalog-v1-view-exists',
    'catalog-v1-rename-view',
    'management-v1-server-info',
    'management-v1-bootstrap',
    'management-v1-create-role',
    'management-v1-list-role',
    'management-v1-update-role',
    'management-v1-get-role',
    'management-v1-delete-role',
    'management-v1-search-role',
    'management-v1-whoami',
    'management-v1-search-user',
    'management-v1-update-user',
    'management-v1-get-user',
    'management-v1-delete-user',
    'management-v1-create-user',
    'management-v1-list-user',
    'management-v1-create-project',
    'management-v1-get-project',
    'management-v1-delete-project',
    'management-v1-rename-project',
    'management-v1-get-project-by-id-deprecated',
    'management-v1-load-endpoint-statistics',
    'management-v1-delete-project-by-id-deprecated',
    'management-v1-create-warehouse',
    'management-v1-list-warehouses',
    'management-v1-list-projects',
    'management-v1-get-warehouse',
    'management-v1-delete-warehouse',
    'management-v1-rename-warehouse',
    'management-v1-deactivate-warehouse',
    'management-v1-activate-warehouse',
    'management-v1-update-storage-profile',
    'management-v1-update-storage-credential',
    'management-v1-get-warehouse-statistics',
    'management-v1-list-deleted-tabulars',
    'management-v1-undrop-tabulars-deprecated',
    'management-v1-undrop-tabulars',
    'management-v1-update-warehouse-delete-profile',
    'permission-v1-get',
    'permission-v1-post',
    'permission-v1-head',
    'permission-v1-delete',
    'management-v1-set-warehouse-protection',
    'management-v1-set-namespace-protection',
    'management-v1-set-table-protection',
    'management-v1-set-view-protection',
    'catalog-v1-cancel-planning',
    'catalog-v1-fetch-planning-result',
    'catalog-v1-plan-table-scan',
    'management-v1-get-view-protection',
    'management-v1-get-table-protection',
    'management-v1-get-namespace-protection',
    'management-v1-rename-default-project-deprecated',
    'management-v1-get-default-project-deprecated',
    'management-v1-delete-default-project-deprecated',
    'permission-v1-put',
    'management-v1-rename-project-by-id-deprecated',
    'sign-s3-request-tabular',
    'management-v1-set-task-queue-config',
    'management-v1-get-task-queue-config',
    'management-v1-control-tasks',
    'management-v1-get-task-details',
    'management-v1-list-tasks',
    'management-v1-search-tabular',
    'management-v1-get-server-actions',
    'management-v1-get-user-actions',
    'management-v1-get-role-actions',
    'management-v1-get-warehouse-actions',
    'management-v1-get-project-actions',
    'management-v1-get-namespace-actions',
    'management-v1-get-table-actions',
    'management-v1-get-view-actions',
    'management-v1-batch-check-actions',
    'management-v1-get-role-metadata',
    'management-v1-update-role-source-system',
    'management-v1-set-project-task-queue-config',
    'management-v1-get-project-task-queue-config',
    'management-v1-control-project-tasks',
    'management-v1-get-project-task-details',
    'management-v1-list-project-tasks',
    'management-v1-schedule-task',
    'generic-table-v1-create-generic-table',
    'generic-table-v1-list-generic-tables',
    'generic-table-v1-load-generic-table',
    'generic-table-v1-drop-generic-table',
    'generic-table-v1-rename-generic-table',
    'generic-table-v1-load-generic-table-credentials',
    'management-v1-get-generic-table-actions',
    'management-v1-get-generic-table-protection',
    'management-v1-set-generic-table-protection',
    'management-v1-update-warehouse-format-version-policy',
    'management-v1-set-warehouse-managed-by',
    'management-v1-list-role-members',
    'management-v1-add-role-members',
    'management-v1-remove-role-member',
    'management-v1-list-role-member-of',
    'management-v1-list-user-roles',
    'management-v1-list-role-transitive-members',
    'management-v1-list-user-transitive-roles',
    'management-v1-list-role-transitive-member-of',
    'management-v1-create-tag-definition',
    'management-v1-list-tag-definitions',
    'management-v1-get-tag-definition',
    'management-v1-update-tag-definition',
    'management-v1-delete-tag-definition',
    'management-v1-list-tag-attachments',
    'management-v1-set-warehouse-tag',
    'management-v1-delete-warehouse-tag',
    'management-v1-list-warehouse-tags',
    'management-v1-set-namespace-tag',
    'management-v1-delete-namespace-tag',
    'management-v1-list-namespace-tags',
    'management-v1-set-table-tag',
    'management-v1-delete-table-tag',
    'management-v1-list-table-tags',
    'management-v1-set-table-column-tag',
    'management-v1-delete-table-column-tag',
    'management-v1-list-table-column-tags',
    'management-v1-list-column-tags',
    'management-v1-set-view-tag',
    'management-v1-delete-view-tag',
    'management-v1-list-view-tags',
    'management-v1-set-generic-table-tag',
    'management-v1-delete-generic-table-tag',
    'management-v1-list-generic-table-tags',
    'management-v1-validate-warehouse',
    'management-v1-validate-storage-profile',
    'management-v1-validate-storage-credential',
    'management-v1-validate-storage-access',
    'management-v1-list-grants',
    'management-v1-get-grantable-privileges',
    'management-v1-list-warehouse-grants',
    'management-v1-apply-warehouse-grants',
    'management-v1-list-server-grants',
    'management-v1-apply-server-grants',
    'management-v1-list-project-grants',
    'management-v1-apply-project-grants',
    'management-v1-list-namespace-grants',
    'management-v1-apply-namespace-grants',
    'management-v1-list-tag-grants',
    'management-v1-apply-tag-grants',
    'management-v1-list-table-grants',
    'management-v1-apply-table-grants',
    'management-v1-list-view-grants',
    'management-v1-apply-view-grants',
    'management-v1-list-generic-table-grants',
    'management-v1-apply-generic-table-grants',
    'management-v1-get-tag-actions',
    'management-v1-get-server-grantable-privileges',
    'management-v1-get-project-grantable-privileges',
    'management-v1-get-warehouse-grantable-privileges',
    'management-v1-get-namespace-grantable-privileges',
    'management-v1-get-table-grantable-privileges',
    'management-v1-get-view-grantable-privileges',
    'management-v1-get-generic-table-grantable-privileges',
    'management-v1-get-tag-grantable-privileges',
    'management-v1-move-namespace',
    'sign-s3-request-by-table-name',
    'management-v1-list-namespace-subtree-grants',
    'management-v1-revoke-namespace-subtree-grants',
    'management-v1-list-warehouse-subtree-grants',
    'management-v1-revoke-warehouse-subtree-grants'
);


--
-- Name: deletion_kind; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."deletion_kind" AS ENUM (
    'default',
    'purge'
);


--
-- Name: entity_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."entity_type" AS ENUM (
    'table',
    'view',
    'project',
    'warehouse',
    'namespace',
    'role',
    'user',
    'server',
    'generic-table'
);


--
-- Name: grant_principal_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."grant_principal_type" AS ENUM (
    'user',
    'role'
);


--
-- Name: grant_resource_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."grant_resource_type" AS ENUM (
    'server',
    'project',
    'warehouse',
    'namespace',
    'tabular',
    'tag'
);


--
-- Name: iceberg_type_kind; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."iceberg_type_kind" AS ENUM (
    'boolean',
    'int',
    'long',
    'float',
    'double',
    'decimal',
    'date',
    'time',
    'timestamp',
    'timestamptz',
    'timestamp_ns',
    'timestamptz_ns',
    'string',
    'uuid',
    'fixed',
    'binary',
    'geometry',
    'geography',
    'unknown',
    'variant',
    'struct',
    'list',
    'map'
);


--
-- Name: managed_by; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."managed_by" AS ENUM (
    'self-managed',
    'instance-admin'
);


--
-- Name: table_format_version; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."table_format_version" AS ENUM (
    '1',
    '2',
    '3'
);


--
-- Name: tabular_delete_mode; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."tabular_delete_mode" AS ENUM (
    'soft',
    'hard'
);


--
-- Name: tabular_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."tabular_type" AS ENUM (
    'table',
    'view',
    'generic-table'
);


--
-- Name: tag_source; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."tag_source" AS ENUM (
    'manual'
);


--
-- Name: tag_value_kind; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."tag_value_kind" AS ENUM (
    'marker',
    'free_text',
    'enumerated'
);


--
-- Name: task_final_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."task_final_status" AS ENUM (
    'failed',
    'cancelled',
    'success'
);


--
-- Name: task_intermediate_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."task_intermediate_status" AS ENUM (
    'running',
    'scheduled',
    'should-stop'
);


--
-- Name: user_last_updated_with; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."user_last_updated_with" AS ENUM (
    'create-endpoint',
    'config-call-creation',
    'update-endpoint',
    'role-provider'
);


--
-- Name: user_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."user_type" AS ENUM (
    'application',
    'human'
);


--
-- Name: view_format_version; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."view_format_version" AS ENUM (
    'v1'
);


--
-- Name: view_representation_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."view_representation_type" AS ENUM (
    'sql'
);


--
-- Name: warehouse_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."warehouse_status" AS ENUM (
    'active',
    'inactive'
);


--
-- Name: add_time_columns("regclass"); Type: PROCEDURE; Schema: public; Owner: -
--

CREATE PROCEDURE "public"."add_time_columns"(IN "tablename" "regclass")
    LANGUAGE "plpgsql"
    AS $$
begin
    execute format(
            'alter table %s
            add column if not exists created_at timestamptz not null default now(),
            add column if not exists updated_at timestamptz;',
            tablename
            );
end;
$$;


--
-- Name: concat_namespace_name_tabular_name("text"[], "text"); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "public"."concat_namespace_name_tabular_name"("nsn" "text"[], "tn" "text") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE
    AS $$
    SELECT CASE
        WHEN nsn IS NULL OR cardinality(nsn) = 0 THEN tn
        ELSE array_to_string(nsn, '.') || '.' || tn
    END;
$$;


--
-- Name: gc_orphaned_columns(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "public"."gc_orphaned_columns"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
    -- Lock candidates in PK order to avoid deadlocks if two GC statements ever touch the same
    -- tabular concurrently.
    PERFORM 1 FROM tabular_field c
      WHERE (c.warehouse_id, c.tabular_id, c.field_id) IN
            (SELECT warehouse_id, tabular_id, field_id FROM removed)
      ORDER BY c.warehouse_id, c.tabular_id, c.field_id
      FOR UPDATE;
    DELETE FROM tabular_field c
      WHERE (c.warehouse_id, c.tabular_id, c.field_id) IN
            (SELECT warehouse_id, tabular_id, field_id FROM removed)
        AND NOT EXISTS (
            SELECT 1 FROM schema_field f
            WHERE f.warehouse_id = c.warehouse_id
              AND f.tabular_id = c.tabular_id
              AND f.field_id = c.field_id);
    RETURN NULL;
END $$;


--
-- Name: get_stats_date_default(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "public"."get_stats_date_default"() RETURNS timestamp with time zone
    LANGUAGE "plpgsql"
    AS $$
BEGIN
    RETURN date_trunc(get_stats_interval_unit(), now()) + get_stats_interval();
END;
$$;


--
-- Name: get_stats_interval(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "public"."get_stats_interval"() RETURNS interval
    LANGUAGE "plpgsql"
    AS $$
BEGIN
    RETURN interval '1 ' || get_stats_interval_unit();
END;
$$;


--
-- Name: get_stats_interval_unit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "public"."get_stats_interval_unit"() RETURNS "text"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
    RETURN 'hour';
END;
$$;


--
-- Name: prohibit_updates_of_metadata_blob(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "public"."prohibit_updates_of_metadata_blob"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
    IF NEW.metadata IS NOT NULL THEN
        RAISE EXCEPTION 'Insert or Update failed: metadata must be null';
    END IF;
    RETURN NEW;
END;
$$;


--
-- Name: reject_schema_write(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "public"."reject_schema_write"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
           BEGIN
             IF (TG_OP = 'INSERT' AND NEW.schema IS NOT NULL)
                OR (TG_OP = 'UPDATE' AND NEW.schema IS NOT NULL
                    AND NEW.schema IS DISTINCT FROM OLD.schema) THEN
               RAISE EXCEPTION 'schema JSONB writes are frozen after the normalized-schema migration'
                 USING ERRCODE = 'object_not_in_prerequisite_state';
             END IF;
             RETURN NEW;
           END $$;


--
-- Name: set_updated_at(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "public"."set_updated_at"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$ begin NEW.updated_at = now();
return NEW;
end;
$$;


--
-- Name: set_updated_at_and_increment_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "public"."set_updated_at_and_increment_version"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
    NEW.updated_at = NOW();
    NEW.version = OLD.version + 1;
    RETURN NEW;
END;
$$;


--
-- Name: trigger_updated_at("regclass"); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "public"."trigger_updated_at"("tablename" "regclass") RETURNS "void"
    LANGUAGE "plpgsql"
    AS $$ begin execute format(
        'CREATE TRIGGER set_updated_at
        BEFORE UPDATE
        ON %s
        FOR EACH ROW
        WHEN (OLD is distinct from NEW)
    EXECUTE FUNCTION set_updated_at();',
        tablename
    );
end;
$$;


--
-- Name: trigger_updated_at_and_version_if_distinct("regclass"); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "public"."trigger_updated_at_and_version_if_distinct"("tablename" "regclass") RETURNS "void"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
    EXECUTE FORMAT(
        'CREATE TRIGGER set_updated_at_and_increment_version
        BEFORE UPDATE
        ON %s
        FOR EACH ROW
        WHEN (OLD IS DISTINCT FROM NEW)
        EXECUTE FUNCTION set_updated_at_and_increment_version();',
        tablename
    );
END;
$$;


--
-- Name: update_counts(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "public"."update_counts"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
declare
    delta_view             integer;
    delta_table            integer;
    coalesced_namespace_id uuid;
    coalesced_type         tabular_type;
    truncated_date         timestamptz;
    old_views              integer;
    old_tables             integer;
    old_ts                 timestamptz;
    target_wh              uuid;
begin
    -- COALESCE here is to handle the case when the row is being deleted and NEW is null
    coalesced_type := COALESCE(NEW.typ, OLD.typ);
    coalesced_namespace_id := COALESCE(NEW.namespace_id, OLD.namespace_id);
    truncated_date := get_stats_date_default();

    delta_view := CASE
                      WHEN coalesced_type = 'view' THEN
                          CASE
                              WHEN TG_OP = 'INSERT' THEN 1
                              WHEN TG_OP = 'DELETE' THEN -1
                              ELSE 0
                              END
                      ELSE 0
        END;
    delta_table := CASE
                       WHEN coalesced_type = 'table' THEN
                           CASE
                               WHEN TG_OP = 'INSERT' THEN 1
                               WHEN TG_OP = 'DELETE' THEN -1
                               ELSE 0 END
                       ELSE 0
        END;

    if delta_view = 0 and delta_table = 0 then
        return null;
    end if;

    WITH old_data AS (SELECT timestamp, number_of_views, number_of_tables, warehouse_id
                      FROM warehouse_statistics
                      WHERE warehouse_id =
                            (SELECT warehouse_id FROM namespace WHERE namespace_id = coalesced_namespace_id))
    UPDATE warehouse_statistics ws
    SET number_of_views  = GREATEST(number_of_views + delta_view, 0),
        number_of_tables = GREATEST(number_of_tables + delta_table, 0),
        timestamp        = truncated_date
    WHERE ws.warehouse_id = (SELECT warehouse_id FROM namespace WHERE namespace_id = coalesced_namespace_id)
    RETURNING (SELECT timestamp FROM old_data) AS old_timestamp,
            (SELECT number_of_views FROM old_data) AS old_views,
            (SELECT number_of_tables FROM old_data) AS old_tables,
            (SELECT warehouse_id FROM old_data) AS warehouse_id
        INTO old_ts, old_views, old_tables, target_wh;

    if old_ts < truncated_date then
        INSERT INTO warehouse_statistics_history (number_of_views,
                                                  number_of_tables,
                                                  warehouse_id,
                                                  timestamp)
        SELECT old_views,
               old_tables,
               target_wh,
               old_ts
        ON CONFLICT DO NOTHING;
    end if;

    RETURN NULL;
end;
$$;


SET default_tablespace = '';

SET default_table_access_method = "heap";

--
-- Name: _sqlx_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."_sqlx_migrations" (
    "version" bigint NOT NULL,
    "description" "text" NOT NULL,
    "installed_on" timestamp with time zone DEFAULT "now"() NOT NULL,
    "success" boolean NOT NULL,
    "checksum" "bytea" NOT NULL,
    "execution_time" bigint NOT NULL
);


--
-- Name: tabular; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."tabular" (
    "tabular_id" "uuid" NOT NULL,
    "namespace_id" "uuid" NOT NULL,
    "name" "text" NOT NULL COLLATE "public"."case_insensitive",
    "typ" "public"."tabular_type" NOT NULL,
    "metadata_location" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "deleted_at" timestamp with time zone,
    "fs_protocol" "text" NOT NULL,
    "fs_location" "text" NOT NULL,
    "protected" boolean DEFAULT false NOT NULL,
    "warehouse_id" "uuid" NOT NULL,
    "tabular_namespace_name" "text"[] NOT NULL COLLATE "public"."case_insensitive",
    CONSTRAINT "tabular_fs_location_no_trailing_slash" CHECK (("fs_location" !~~ '%/'::"text")),
    CONSTRAINT "tabular_metadata_location_check" CHECK (((("typ" = 'view'::"public"."tabular_type") AND ("metadata_location" IS NOT NULL)) OR ("typ" = ANY (ARRAY['table'::"public"."tabular_type", 'generic-table'::"public"."tabular_type"]))))
);


--
-- Name: warehouse; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."warehouse" (
    "warehouse_id" "uuid" DEFAULT "public"."uuid_generate_v1mc"() NOT NULL,
    "warehouse_name" "text" NOT NULL COLLATE "public"."case_insensitive",
    "storage_profile" "jsonb" DEFAULT '{}'::"jsonb" NOT NULL,
    "storage_secret_id" "uuid",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "status" "public"."warehouse_status" NOT NULL,
    "tabular_expiration_seconds" bigint,
    "tabular_delete_mode" "public"."tabular_delete_mode" NOT NULL,
    "project_id" "text" NOT NULL,
    "protected" boolean DEFAULT false NOT NULL,
    "version" bigint DEFAULT 0 NOT NULL,
    "allowed_format_versions" smallint[] DEFAULT '{1,2,3}'::smallint[] NOT NULL,
    "default_format_version" smallint,
    "managed_by" "public"."managed_by" DEFAULT 'self-managed'::"public"."managed_by" NOT NULL,
    CONSTRAINT "warehouse_allowed_format_versions_nonempty" CHECK (("cardinality"("allowed_format_versions") > 0)),
    CONSTRAINT "warehouse_check" CHECK (((("tabular_expiration_seconds" IS NOT NULL) AND ("tabular_delete_mode" = 'soft'::"public"."tabular_delete_mode")) OR (("tabular_expiration_seconds" IS NULL) AND ("tabular_delete_mode" = 'hard'::"public"."tabular_delete_mode")))),
    CONSTRAINT "warehouse_default_format_version_in_allowed" CHECK ((("default_format_version" IS NULL) OR ("default_format_version" = ANY ("allowed_format_versions"))))
);


--
-- Name: active_tabulars; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW "public"."active_tabulars" AS
 SELECT "t"."tabular_id",
    "t"."namespace_id",
    "t"."name",
    "t"."typ",
    "t"."metadata_location",
    "t"."fs_protocol",
    "t"."fs_location",
    "t"."warehouse_id",
    "t"."tabular_namespace_name" AS "namespace_name"
   FROM ("public"."tabular" "t"
     JOIN "public"."warehouse" "w" ON ((("t"."warehouse_id" = "w"."warehouse_id") AND ("w"."status" = 'active'::"public"."warehouse_status"))));


--
-- Name: active_tables; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW "public"."active_tables" AS
 SELECT "t"."tabular_id" AS "table_id",
    "t"."namespace_id",
    "t"."warehouse_id",
    "t"."name",
    "t"."metadata_location",
    "t"."fs_protocol",
    "t"."fs_location"
   FROM "public"."active_tabulars" "t"
  WHERE ("t"."typ" = 'table'::"public"."tabular_type");


--
-- Name: active_views; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW "public"."active_views" AS
 SELECT "t"."tabular_id" AS "view_id",
    "t"."namespace_id",
    "t"."warehouse_id",
    "t"."name",
    "t"."metadata_location",
    "t"."fs_protocol",
    "t"."fs_location"
   FROM "public"."active_tabulars" "t"
  WHERE ("t"."typ" = 'view'::"public"."tabular_type");


--
-- Name: current_view_metadata_version; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."current_view_metadata_version" (
    "view_id" "uuid" NOT NULL,
    "version_id" integer NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "warehouse_id" "uuid" NOT NULL
);


--
-- Name: endpoint_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."endpoint_statistics" (
    "endpoint_statistics_id" "uuid" DEFAULT "public"."uuid_generate_v1mc"() NOT NULL,
    "warehouse_id" "uuid",
    "project_id" "text" NOT NULL,
    "matched_path" "public"."api_endpoints" NOT NULL,
    "status_code" integer NOT NULL,
    "count" bigint DEFAULT 0 NOT NULL,
    "timestamp" timestamp with time zone DEFAULT "public"."get_stats_date_default"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone
);


--
-- Name: generic_table; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."generic_table" (
    "warehouse_id" "uuid" NOT NULL,
    "generic_table_id" "uuid" NOT NULL,
    "format" "text" NOT NULL,
    "doc" "text",
    "schema_info" "jsonb",
    "statistics" "jsonb",
    "version" bigint DEFAULT 0 NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    CONSTRAINT "generic_table_format_check" CHECK (("format" ~ '^[a-z][a-z0-9_-]{0,63}$'::"text")),
    CONSTRAINT "generic_table_schema_info_check" CHECK ((("schema_info" IS NULL) OR ("octet_length"(("schema_info")::"text") <= 1048576))),
    CONSTRAINT "generic_table_statistics_check" CHECK ((("statistics" IS NULL) OR ("octet_length"(("statistics")::"text") <= 1048576)))
);


--
-- Name: generic_table_properties; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."generic_table_properties" (
    "warehouse_id" "uuid" NOT NULL,
    "generic_table_id" "uuid" NOT NULL,
    "key" "text" NOT NULL,
    "value" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone
);


--
-- Name: grant_assignment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."grant_assignment" (
    "grant_id" "uuid" DEFAULT "public"."uuid_generate_v1mc"() NOT NULL,
    "principal_type" "public"."grant_principal_type" NOT NULL,
    "user_id" "text",
    "role_id" "uuid",
    "privilege" "text" NOT NULL,
    "resource_type" "public"."grant_resource_type" NOT NULL,
    "project_id" "text",
    "warehouse_id" "uuid",
    "namespace_id" "uuid",
    "tabular_id" "uuid",
    "tag_definition_id" "uuid",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "grant_principal_shape" CHECK (((("principal_type" = 'user'::"public"."grant_principal_type") AND ("user_id" IS NOT NULL) AND ("role_id" IS NULL)) OR (("principal_type" = 'role'::"public"."grant_principal_type") AND ("role_id" IS NOT NULL) AND ("user_id" IS NULL)))),
    CONSTRAINT "grant_privilege_length" CHECK ((("char_length"("privilege") >= 1) AND ("char_length"("privilege") <= 256))),
    CONSTRAINT "grant_resource_target" CHECK (((("resource_type" = 'server'::"public"."grant_resource_type") AND ("num_nonnulls"("project_id", "warehouse_id", "namespace_id", "tabular_id", "tag_definition_id") = 0)) OR (("resource_type" = 'project'::"public"."grant_resource_type") AND ("project_id" IS NOT NULL) AND ("num_nonnulls"("warehouse_id", "namespace_id", "tabular_id", "tag_definition_id") = 0)) OR (("resource_type" = 'warehouse'::"public"."grant_resource_type") AND ("warehouse_id" IS NOT NULL) AND ("num_nonnulls"("project_id", "namespace_id", "tabular_id", "tag_definition_id") = 0)) OR (("resource_type" = 'namespace'::"public"."grant_resource_type") AND ("warehouse_id" IS NOT NULL) AND ("namespace_id" IS NOT NULL) AND ("num_nonnulls"("project_id", "tabular_id", "tag_definition_id") = 0)) OR (("resource_type" = 'tabular'::"public"."grant_resource_type") AND ("warehouse_id" IS NOT NULL) AND ("tabular_id" IS NOT NULL) AND ("num_nonnulls"("project_id", "namespace_id", "tag_definition_id") = 0)) OR (("resource_type" = 'tag'::"public"."grant_resource_type") AND ("tag_definition_id" IS NOT NULL) AND ("num_nonnulls"("project_id", "warehouse_id", "namespace_id", "tabular_id") = 0))))
);


--
-- Name: idempotency_record; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."idempotency_record" (
    "idempotency_key" "uuid" NOT NULL,
    "warehouse_id" "uuid" NOT NULL,
    "operation" "public"."api_endpoints" NOT NULL,
    "http_status" integer NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "idempotency_operation_check" CHECK ((("operation")::"text" = ANY (ARRAY['catalog-v1-create-namespace'::"text", 'catalog-v1-update-namespace-properties'::"text", 'catalog-v1-drop-namespace'::"text", 'catalog-v1-create-table'::"text", 'catalog-v1-update-table'::"text", 'catalog-v1-drop-table'::"text", 'catalog-v1-rename-table'::"text", 'catalog-v1-register-table'::"text", 'catalog-v1-create-view'::"text", 'catalog-v1-replace-view'::"text", 'catalog-v1-drop-view'::"text", 'catalog-v1-rename-view'::"text", 'catalog-v1-commit-transaction'::"text", 'generic-table-v1-create-generic-table'::"text", 'generic-table-v1-drop-generic-table'::"text", 'generic-table-v1-rename-generic-table'::"text"])))
);


--
-- Name: namespace; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."namespace" (
    "namespace_id" "uuid" DEFAULT "public"."uuid_generate_v1mc"() NOT NULL,
    "warehouse_id" "uuid" NOT NULL,
    "namespace_name" "text"[] NOT NULL COLLATE "public"."case_insensitive",
    "namespace_properties" "jsonb" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "protected" boolean DEFAULT false NOT NULL,
    "version" bigint DEFAULT 0 NOT NULL,
    "depth" integer GENERATED ALWAYS AS ("array_length"("namespace_name", 1)) STORED
);


--
-- Name: partition_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."partition_statistics" (
    "snapshot_id" bigint NOT NULL,
    "table_id" "uuid" NOT NULL,
    "statistics_path" "text" NOT NULL,
    "file_size_in_bytes" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "warehouse_id" "uuid" NOT NULL
);


--
-- Name: project; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."project" (
    "project_name" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "project_id" "text" NOT NULL,
    "version" bigint DEFAULT 0 NOT NULL
);


--
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."role" (
    "id" "uuid" NOT NULL,
    "name" "text" NOT NULL,
    "description" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "project_id" "text" NOT NULL,
    "source_id" "text" NOT NULL,
    "provider_id" "text" DEFAULT 'lakekeeper'::"text" NOT NULL,
    "version" bigint DEFAULT 0 NOT NULL
);


--
-- Name: role_assignment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."role_assignment" (
    "role_id" "uuid" NOT NULL,
    "user_id" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


--
-- Name: role_assignment_sync; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."role_assignment_sync" (
    "user_id" "text" NOT NULL,
    "project_id" "text" NOT NULL,
    "provider_id" "text" NOT NULL,
    "synced_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


--
-- Name: role_members_sync; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."role_members_sync" (
    "role_id" "uuid" NOT NULL,
    "synced_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


--
-- Name: role_membership; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."role_membership" (
    "parent_role_id" "uuid" NOT NULL,
    "member_role_id" "uuid" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "role_membership_no_self" CHECK (("parent_role_id" <> "member_role_id"))
);


--
-- Name: schema_field; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."schema_field" (
    "warehouse_id" "uuid" NOT NULL,
    "tabular_id" "uuid" NOT NULL,
    "schema_id" integer NOT NULL,
    "field_id" integer NOT NULL,
    "parent_field_id" integer,
    "ordinal" integer NOT NULL,
    "name" "text" NOT NULL,
    "required" boolean NOT NULL,
    "doc" "text",
    "type_kind" "public"."iceberg_type_kind" NOT NULL,
    "type_params" "jsonb",
    "initial_default" "jsonb",
    "write_default" "jsonb",
    "is_identifier" boolean NOT NULL
);


--
-- Name: secret; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."secret" (
    "secret_id" "uuid" DEFAULT "public"."uuid_generate_v1mc"() NOT NULL,
    "secret" "bytea" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone
);


--
-- Name: server; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."server" (
    "single_row" boolean DEFAULT true NOT NULL,
    "server_id" "uuid" NOT NULL,
    "terms_accepted" boolean NOT NULL,
    "open_for_bootstrap" boolean NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    CONSTRAINT "single_row" CHECK ("single_row")
);


--
-- Name: table; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."table" (
    "table_id" "uuid" DEFAULT "public"."uuid_generate_v1mc"() NOT NULL,
    "metadata" "jsonb",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "table_format_version" "public"."table_format_version" NOT NULL,
    "last_column_id" integer NOT NULL,
    "last_sequence_number" bigint NOT NULL,
    "last_updated_ms" bigint NOT NULL,
    "last_partition_id" integer NOT NULL,
    "warehouse_id" "uuid" NOT NULL,
    "next_row_id" bigint NOT NULL,
    CONSTRAINT "table_next_row_id_check" CHECK (("next_row_id" >= 0))
);


--
-- Name: table_current_schema; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."table_current_schema" (
    "table_id" "uuid" NOT NULL,
    "schema_id" integer NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "warehouse_id" "uuid" NOT NULL
);


--
-- Name: table_default_partition_spec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."table_default_partition_spec" (
    "table_id" "uuid" NOT NULL,
    "partition_spec_id" integer NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "warehouse_id" "uuid" NOT NULL
);


--
-- Name: table_default_sort_order; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."table_default_sort_order" (
    "table_id" "uuid" NOT NULL,
    "sort_order_id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "warehouse_id" "uuid" NOT NULL
);


--
-- Name: table_encryption_keys; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."table_encryption_keys" (
    "warehouse_id" "uuid" NOT NULL,
    "table_id" "uuid" NOT NULL,
    "key_id" "text" NOT NULL,
    "encrypted_key_metadata" "bytea" NOT NULL,
    "encrypted_by_id" "text",
    "properties" "jsonb",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone
);


--
-- Name: table_metadata_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."table_metadata_log" (
    "sequence_number" bigint NOT NULL,
    "table_id" "uuid" NOT NULL,
    "timestamp" bigint NOT NULL,
    "metadata_file" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "warehouse_id" "uuid" NOT NULL
);


--
-- Name: table_metadata_log_sequence_number_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."table_metadata_log_sequence_number_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: table_metadata_log_sequence_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."table_metadata_log_sequence_number_seq" OWNED BY "public"."table_metadata_log"."sequence_number";


--
-- Name: table_partition_spec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."table_partition_spec" (
    "partition_spec_id" integer NOT NULL,
    "table_id" "uuid" NOT NULL,
    "partition_spec" "jsonb" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "warehouse_id" "uuid" NOT NULL
);


--
-- Name: table_properties; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."table_properties" (
    "table_id" "uuid" NOT NULL,
    "key" "text" NOT NULL,
    "value" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "warehouse_id" "uuid" NOT NULL
);


--
-- Name: table_refs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."table_refs" (
    "table_id" "uuid" NOT NULL,
    "table_ref_name" "text" NOT NULL,
    "snapshot_id" bigint NOT NULL,
    "retention" "jsonb" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "warehouse_id" "uuid" NOT NULL
);


--
-- Name: table_schema; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."table_schema" (
    "schema_id" integer NOT NULL,
    "table_id" "uuid" NOT NULL,
    "schema" "jsonb",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "warehouse_id" "uuid" NOT NULL
);


--
-- Name: table_snapshot; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."table_snapshot" (
    "snapshot_id" bigint NOT NULL,
    "table_id" "uuid" NOT NULL,
    "parent_snapshot_id" bigint,
    "sequence_number" bigint NOT NULL,
    "manifest_list" "text" NOT NULL,
    "summary" "jsonb" NOT NULL,
    "schema_id" integer,
    "timestamp_ms" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "warehouse_id" "uuid" NOT NULL,
    "first_row_id" bigint,
    "assigned_rows" bigint,
    "key_id" "text"
);


--
-- Name: table_snapshot_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."table_snapshot_log" (
    "sequence_number" bigint NOT NULL,
    "table_id" "uuid" NOT NULL,
    "snapshot_id" bigint NOT NULL,
    "timestamp" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "warehouse_id" "uuid" NOT NULL
);


--
-- Name: table_snapshot_log_sequence_number_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."table_snapshot_log_sequence_number_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: table_snapshot_log_sequence_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."table_snapshot_log_sequence_number_seq" OWNED BY "public"."table_snapshot_log"."sequence_number";


--
-- Name: table_sort_order; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."table_sort_order" (
    "sort_order_id" bigint NOT NULL,
    "table_id" "uuid" NOT NULL,
    "sort_order" "jsonb" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "warehouse_id" "uuid" NOT NULL
);


--
-- Name: table_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."table_statistics" (
    "snapshot_id" bigint NOT NULL,
    "table_id" "uuid" NOT NULL,
    "statistics_path" "text" NOT NULL,
    "file_size_in_bytes" bigint NOT NULL,
    "file_footer_size_in_bytes" bigint NOT NULL,
    "key_metadata" "text",
    "blob_metadata" "jsonb" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "warehouse_id" "uuid" NOT NULL
);


--
-- Name: tabular_field; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."tabular_field" (
    "warehouse_id" "uuid" NOT NULL,
    "tabular_id" "uuid" NOT NULL,
    "field_id" integer NOT NULL
);


--
-- Name: tag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."tag" (
    "tag_id" "uuid" DEFAULT "public"."uuid_generate_v1mc"() NOT NULL,
    "tag_definition_id" "uuid" NOT NULL,
    "warehouse_id" "uuid" NOT NULL,
    "namespace_id" "uuid",
    "tabular_id" "uuid",
    "field_id" integer,
    "value" "text",
    "source" "public"."tag_source" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    CONSTRAINT "tag_field_requires_tabular" CHECK ((("field_id" IS NULL) OR ("tabular_id" IS NOT NULL))),
    CONSTRAINT "tag_single_target" CHECK ((((("namespace_id" IS NOT NULL))::integer + (("tabular_id" IS NOT NULL))::integer) <= 1))
);


--
-- Name: tag_allowed_value; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."tag_allowed_value" (
    "tag_definition_id" "uuid" NOT NULL,
    "value" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


--
-- Name: tag_definition; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."tag_definition" (
    "tag_definition_id" "uuid" DEFAULT "public"."uuid_generate_v1mc"() NOT NULL,
    "project_id" "text" NOT NULL,
    "name" "text" NOT NULL,
    "description" "text",
    "scope" "text"[] NOT NULL,
    "value_kind" "public"."tag_value_kind" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    CONSTRAINT "tag_definition_scope_not_empty" CHECK (("cardinality"("scope") > 0))
);


--
-- Name: task; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."task" (
    "task_id" "uuid" NOT NULL,
    "warehouse_id" "uuid",
    "queue_name" "text" NOT NULL,
    "status" "public"."task_intermediate_status" NOT NULL,
    "picked_up_at" timestamp with time zone,
    "scheduled_for" timestamp with time zone DEFAULT "now"() NOT NULL,
    "attempt" integer DEFAULT 0 NOT NULL,
    "parent_task_id" "uuid",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "task_data" "jsonb" NOT NULL,
    "entity_id" "uuid",
    "last_heartbeat_at" timestamp with time zone,
    "progress" real DEFAULT 0.0 NOT NULL,
    "execution_details" "jsonb",
    "entity_name" "text"[] COLLATE "public"."case_insensitive",
    "entity_type" "public"."entity_type" NOT NULL,
    "project_id" "text" NOT NULL,
    CONSTRAINT "task_entity_check" CHECK (((("entity_type" = ANY (ARRAY['project'::"public"."entity_type", 'warehouse'::"public"."entity_type"])) AND ("entity_id" IS NULL) AND ("entity_name" IS NULL)) OR (("entity_type" = ANY (ARRAY['table'::"public"."entity_type", 'view'::"public"."entity_type", 'generic-table'::"public"."entity_type"])) AND ("entity_id" IS NOT NULL) AND ("entity_name" IS NOT NULL)))),
    CONSTRAINT "task_warehouse_id_check" CHECK (((("entity_type" = 'project'::"public"."entity_type") AND ("warehouse_id" IS NULL)) OR (("entity_type" = ANY (ARRAY['warehouse'::"public"."entity_type", 'table'::"public"."entity_type", 'view'::"public"."entity_type", 'generic-table'::"public"."entity_type"])) AND ("warehouse_id" IS NOT NULL))))
);


--
-- Name: task_config; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."task_config" (
    "warehouse_id" "uuid",
    "queue_name" "text" NOT NULL,
    "config" "jsonb" NOT NULL,
    "max_time_since_last_heartbeat" interval,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "project_id" "text" NOT NULL,
    "task_config_id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL
);


--
-- Name: task_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."task_log" (
    "task_id" "uuid" NOT NULL,
    "attempt" integer NOT NULL,
    "warehouse_id" "uuid",
    "queue_name" "text" NOT NULL,
    "task_data" "jsonb" NOT NULL,
    "status" "public"."task_final_status" NOT NULL,
    "entity_id" "uuid",
    "started_at" timestamp with time zone,
    "duration" interval,
    "message" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "progress" real DEFAULT 0.0 NOT NULL,
    "execution_details" "jsonb",
    "attempt_scheduled_for" timestamp with time zone NOT NULL,
    "last_heartbeat_at" timestamp with time zone,
    "parent_task_id" "uuid",
    "task_created_at" timestamp with time zone NOT NULL,
    "entity_name" "text"[] COLLATE "public"."case_insensitive",
    "entity_type" "public"."entity_type" NOT NULL,
    "project_id" "text" NOT NULL,
    CONSTRAINT "task_log_entity_check" CHECK (((("entity_type" = ANY (ARRAY['project'::"public"."entity_type", 'warehouse'::"public"."entity_type"])) AND ("entity_id" IS NULL) AND ("entity_name" IS NULL)) OR (("entity_type" = ANY (ARRAY['table'::"public"."entity_type", 'view'::"public"."entity_type", 'generic-table'::"public"."entity_type"])) AND ("entity_id" IS NOT NULL) AND ("entity_name" IS NOT NULL)))),
    CONSTRAINT "task_log_warehouse_id_check" CHECK (((("entity_type" = 'project'::"public"."entity_type") AND ("warehouse_id" IS NULL)) OR (("entity_type" = ANY (ARRAY['warehouse'::"public"."entity_type", 'table'::"public"."entity_type", 'view'::"public"."entity_type", 'generic-table'::"public"."entity_type"])) AND ("warehouse_id" IS NOT NULL))))
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."users" (
    "id" "text" NOT NULL,
    "name" "text",
    "email" "text",
    "user_type" "public"."user_type" NOT NULL,
    "last_updated_with" "public"."user_last_updated_with" NOT NULL,
    "deleted_at" timestamp with time zone,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone
);


--
-- Name: view; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."view" (
    "view_id" "uuid" DEFAULT "public"."uuid_generate_v1mc"() NOT NULL,
    "view_format_version" "public"."view_format_version" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "warehouse_id" "uuid" NOT NULL
);


--
-- Name: view_properties; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."view_properties" (
    "view_id" "uuid" NOT NULL,
    "key" "text" NOT NULL,
    "value" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "warehouse_id" "uuid" NOT NULL
);


--
-- Name: view_representation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."view_representation" (
    "view_representation_id" "uuid" DEFAULT "public"."uuid_generate_v1mc"() NOT NULL,
    "view_version_id" integer NOT NULL,
    "view_id" "uuid" NOT NULL,
    "typ" "public"."view_representation_type" NOT NULL,
    "sql" "text" NOT NULL,
    "dialect" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "warehouse_id" "uuid" NOT NULL
);


--
-- Name: view_schema; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."view_schema" (
    "schema_id" integer NOT NULL,
    "view_id" "uuid" NOT NULL,
    "schema" "jsonb",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "warehouse_id" "uuid" NOT NULL
);


--
-- Name: view_version; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."view_version" (
    "view_id" "uuid" NOT NULL,
    "version_id" integer NOT NULL,
    "schema_id" integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    "default_namespace_id" "uuid",
    "default_catalog" "text",
    "summary" "jsonb" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "warehouse_id" "uuid" NOT NULL
);


--
-- Name: view_version_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."view_version_log" (
    "view_id" "uuid" NOT NULL,
    "version_id" integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT "now"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "warehouse_id" "uuid" NOT NULL
);


--
-- Name: warehouse_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."warehouse_statistics" (
    "warehouse_id" "uuid" NOT NULL,
    "number_of_views" bigint NOT NULL,
    "number_of_tables" bigint NOT NULL,
    "timestamp" timestamp with time zone DEFAULT "public"."get_stats_date_default"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone
);


--
-- Name: warehouse_statistics_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."warehouse_statistics_history" (
    "number_of_views" bigint NOT NULL,
    "number_of_tables" bigint NOT NULL,
    "warehouse_id" "uuid" NOT NULL,
    "timestamp" timestamp with time zone DEFAULT "public"."get_stats_date_default"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone
);


--
-- Name: table_metadata_log sequence_number; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_metadata_log" ALTER COLUMN "sequence_number" SET DEFAULT "nextval"('"public"."table_metadata_log_sequence_number_seq"'::"regclass");


--
-- Name: table_snapshot_log sequence_number; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_snapshot_log" ALTER COLUMN "sequence_number" SET DEFAULT "nextval"('"public"."table_snapshot_log_sequence_number_seq"'::"regclass");


--
-- Name: _sqlx_migrations _sqlx_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."_sqlx_migrations"
    ADD CONSTRAINT "_sqlx_migrations_pkey" PRIMARY KEY ("version");


--
-- Name: current_view_metadata_version current_view_metadata_version_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."current_view_metadata_version"
    ADD CONSTRAINT "current_view_metadata_version_pkey" PRIMARY KEY ("warehouse_id", "view_id");


--
-- Name: endpoint_statistics endpoint_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."endpoint_statistics"
    ADD CONSTRAINT "endpoint_statistics_pkey" PRIMARY KEY ("endpoint_statistics_id");


--
-- Name: endpoint_statistics endpoint_statistics_project_id_warehouse_id_matched_path_st_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."endpoint_statistics"
    ADD CONSTRAINT "endpoint_statistics_project_id_warehouse_id_matched_path_st_key" UNIQUE NULLS NOT DISTINCT ("project_id", "warehouse_id", "matched_path", "status_code", "timestamp");


--
-- Name: generic_table generic_table_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."generic_table"
    ADD CONSTRAINT "generic_table_pkey" PRIMARY KEY ("warehouse_id", "generic_table_id");


--
-- Name: generic_table_properties generic_table_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."generic_table_properties"
    ADD CONSTRAINT "generic_table_properties_pkey" PRIMARY KEY ("warehouse_id", "generic_table_id", "key");


--
-- Name: grant_assignment grant_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."grant_assignment"
    ADD CONSTRAINT "grant_assignment_pkey" PRIMARY KEY ("grant_id");


--
-- Name: grant_assignment grant_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."grant_assignment"
    ADD CONSTRAINT "grant_unique" UNIQUE NULLS NOT DISTINCT ("principal_type", "user_id", "role_id", "resource_type", "privilege", "project_id", "warehouse_id", "namespace_id", "tabular_id", "tag_definition_id");


--
-- Name: idempotency_record idempotency_record_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."idempotency_record"
    ADD CONSTRAINT "idempotency_record_pkey" PRIMARY KEY ("warehouse_id", "idempotency_key");


--
-- Name: namespace namespace_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."namespace"
    ADD CONSTRAINT "namespace_pkey" PRIMARY KEY ("namespace_id");


--
-- Name: partition_statistics partition_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."partition_statistics"
    ADD CONSTRAINT "partition_statistics_pkey" PRIMARY KEY ("warehouse_id", "table_id", "snapshot_id");


--
-- Name: project project_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."project"
    ADD CONSTRAINT "project_pkey" PRIMARY KEY ("project_id");


--
-- Name: role_assignment role_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."role_assignment"
    ADD CONSTRAINT "role_assignment_pkey" PRIMARY KEY ("user_id", "role_id");


--
-- Name: role_assignment_sync role_assignment_sync_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."role_assignment_sync"
    ADD CONSTRAINT "role_assignment_sync_pkey" PRIMARY KEY ("user_id", "project_id", "provider_id");


--
-- Name: role_members_sync role_members_sync_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."role_members_sync"
    ADD CONSTRAINT "role_members_sync_pkey" PRIMARY KEY ("role_id");


--
-- Name: role_membership role_membership_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."role_membership"
    ADD CONSTRAINT "role_membership_pkey" PRIMARY KEY ("parent_role_id", "member_role_id");


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."role"
    ADD CONSTRAINT "role_pkey" PRIMARY KEY ("id");


--
-- Name: schema_field schema_field_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."schema_field"
    ADD CONSTRAINT "schema_field_pkey" PRIMARY KEY ("warehouse_id", "tabular_id", "schema_id", "field_id");


--
-- Name: secret secret_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."secret"
    ADD CONSTRAINT "secret_pkey" PRIMARY KEY ("secret_id");


--
-- Name: server server_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."server"
    ADD CONSTRAINT "server_pkey" PRIMARY KEY ("single_row");


--
-- Name: table_current_schema table_current_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_current_schema"
    ADD CONSTRAINT "table_current_schema_pkey" PRIMARY KEY ("warehouse_id", "table_id");


--
-- Name: table_default_partition_spec table_default_partition_spec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_default_partition_spec"
    ADD CONSTRAINT "table_default_partition_spec_pkey" PRIMARY KEY ("warehouse_id", "table_id");


--
-- Name: table_default_sort_order table_default_sort_order_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_default_sort_order"
    ADD CONSTRAINT "table_default_sort_order_pkey" PRIMARY KEY ("warehouse_id", "table_id");


--
-- Name: table_encryption_keys table_encryption_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_encryption_keys"
    ADD CONSTRAINT "table_encryption_keys_pkey" PRIMARY KEY ("warehouse_id", "table_id", "key_id");


--
-- Name: table_metadata_log table_metadata_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_metadata_log"
    ADD CONSTRAINT "table_metadata_log_pkey" PRIMARY KEY ("warehouse_id", "table_id", "sequence_number");


--
-- Name: table_partition_spec table_partition_spec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_partition_spec"
    ADD CONSTRAINT "table_partition_spec_pkey" PRIMARY KEY ("warehouse_id", "table_id", "partition_spec_id");


--
-- Name: table table_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table"
    ADD CONSTRAINT "table_pkey" PRIMARY KEY ("warehouse_id", "table_id");


--
-- Name: table_properties table_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_properties"
    ADD CONSTRAINT "table_properties_pkey" PRIMARY KEY ("warehouse_id", "table_id", "key");


--
-- Name: table_refs table_refs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_refs"
    ADD CONSTRAINT "table_refs_pkey" PRIMARY KEY ("warehouse_id", "table_id", "table_ref_name");


--
-- Name: table_schema table_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_schema"
    ADD CONSTRAINT "table_schema_pkey" PRIMARY KEY ("warehouse_id", "table_id", "schema_id");


--
-- Name: table_snapshot_log table_snapshot_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_snapshot_log"
    ADD CONSTRAINT "table_snapshot_log_pkey" PRIMARY KEY ("warehouse_id", "table_id", "sequence_number");


--
-- Name: table_snapshot table_snapshot_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_snapshot"
    ADD CONSTRAINT "table_snapshot_pkey" PRIMARY KEY ("warehouse_id", "table_id", "snapshot_id");


--
-- Name: table_sort_order table_sort_order_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_sort_order"
    ADD CONSTRAINT "table_sort_order_pkey" PRIMARY KEY ("warehouse_id", "table_id", "sort_order_id");


--
-- Name: table_statistics table_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_statistics"
    ADD CONSTRAINT "table_statistics_pkey" PRIMARY KEY ("warehouse_id", "table_id", "snapshot_id");


--
-- Name: tabular_field tabular_field_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."tabular_field"
    ADD CONSTRAINT "tabular_field_pkey" PRIMARY KEY ("warehouse_id", "tabular_id", "field_id");


--
-- Name: tabular tabular_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."tabular"
    ADD CONSTRAINT "tabular_pkey" PRIMARY KEY ("warehouse_id", "tabular_id");


--
-- Name: tag_allowed_value tag_allowed_value_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."tag_allowed_value"
    ADD CONSTRAINT "tag_allowed_value_pkey" PRIMARY KEY ("tag_definition_id", "value");


--
-- Name: tag_definition tag_definition_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."tag_definition"
    ADD CONSTRAINT "tag_definition_pkey" PRIMARY KEY ("tag_definition_id");


--
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."tag"
    ADD CONSTRAINT "tag_pkey" PRIMARY KEY ("tag_id");


--
-- Name: tag tag_unique_target_definition_source; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."tag"
    ADD CONSTRAINT "tag_unique_target_definition_source" UNIQUE NULLS NOT DISTINCT ("warehouse_id", "namespace_id", "tabular_id", "field_id", "tag_definition_id", "source");


--
-- Name: task_config task_config_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."task_config"
    ADD CONSTRAINT "task_config_pkey" PRIMARY KEY ("task_config_id");


--
-- Name: task_config task_config_project_id_warehouse_id_queue_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."task_config"
    ADD CONSTRAINT "task_config_project_id_warehouse_id_queue_name_key" UNIQUE NULLS NOT DISTINCT ("project_id", "warehouse_id", "queue_name");


--
-- Name: task_log task_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."task_log"
    ADD CONSTRAINT "task_log_pkey" PRIMARY KEY ("task_id", "attempt");


--
-- Name: task task_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."task"
    ADD CONSTRAINT "task_pkey" PRIMARY KEY ("task_id");


--
-- Name: task task_project_warehouse_id_entity_type_entity_id_queue_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."task"
    ADD CONSTRAINT "task_project_warehouse_id_entity_type_entity_id_queue_name_key" UNIQUE NULLS NOT DISTINCT ("project_id", "warehouse_id", "entity_type", "entity_id", "queue_name");


--
-- Name: tabular unique_name_per_namespace_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."tabular"
    ADD CONSTRAINT "unique_name_per_namespace_id" UNIQUE NULLS NOT DISTINCT ("warehouse_id", "namespace_id", "name", "deleted_at");


--
-- Name: namespace unique_namespace_id_per_warehouse; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."namespace"
    ADD CONSTRAINT "unique_namespace_id_per_warehouse" UNIQUE ("warehouse_id", "namespace_id");


--
-- Name: namespace unique_namespace_per_warehouse; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."namespace"
    ADD CONSTRAINT "unique_namespace_per_warehouse" UNIQUE ("warehouse_id", "namespace_name");


--
-- Name: role unique_role_provider_source_in_project; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."role"
    ADD CONSTRAINT "unique_role_provider_source_in_project" UNIQUE ("project_id", "provider_id", "source_id");


--
-- Name: view_schema unique_schema_per_view; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."view_schema"
    ADD CONSTRAINT "unique_schema_per_view" PRIMARY KEY ("warehouse_id", "view_id", "schema_id");


--
-- Name: view_version unique_version_per_metadata; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."view_version"
    ADD CONSTRAINT "unique_version_per_metadata" PRIMARY KEY ("warehouse_id", "view_id", "version_id");


--
-- Name: namespace unique_warehouse_id_namespace_id_namespace_name; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."namespace"
    ADD CONSTRAINT "unique_warehouse_id_namespace_id_namespace_name" UNIQUE ("warehouse_id", "namespace_id", "namespace_name");


--
-- Name: warehouse unique_warehouse_name_in_project; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."warehouse"
    ADD CONSTRAINT "unique_warehouse_name_in_project" UNIQUE ("project_id", "warehouse_name");


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");


--
-- Name: view view_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."view"
    ADD CONSTRAINT "view_pkey" PRIMARY KEY ("warehouse_id", "view_id");


--
-- Name: view_properties view_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."view_properties"
    ADD CONSTRAINT "view_properties_pkey" PRIMARY KEY ("warehouse_id", "view_id", "key");


--
-- Name: view_representation view_representation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."view_representation"
    ADD CONSTRAINT "view_representation_pkey" PRIMARY KEY ("warehouse_id", "view_representation_id");


--
-- Name: view_version_log view_version_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."view_version_log"
    ADD CONSTRAINT "view_version_log_pkey" PRIMARY KEY ("warehouse_id", "view_id", "version_id", "timestamp");


--
-- Name: warehouse warehouse_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."warehouse"
    ADD CONSTRAINT "warehouse_pkey" PRIMARY KEY ("warehouse_id");


--
-- Name: warehouse_statistics_history warehouse_statistics_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."warehouse_statistics_history"
    ADD CONSTRAINT "warehouse_statistics_history_pkey" PRIMARY KEY ("warehouse_id", "timestamp");


--
-- Name: warehouse_statistics warehouse_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."warehouse_statistics"
    ADD CONSTRAINT "warehouse_statistics_pkey" PRIMARY KEY ("warehouse_id");


--
-- Name: grant_namespace_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "grant_namespace_idx" ON "public"."grant_assignment" USING "btree" ("warehouse_id", "namespace_id", "resource_type", "created_at", "grant_id") WHERE ("namespace_id" IS NOT NULL);


--
-- Name: grant_project_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "grant_project_idx" ON "public"."grant_assignment" USING "btree" ("project_id", "resource_type", "created_at", "grant_id") WHERE ("project_id" IS NOT NULL);


--
-- Name: grant_role_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "grant_role_idx" ON "public"."grant_assignment" USING "btree" ("role_id", "created_at", "grant_id") WHERE ("role_id" IS NOT NULL);


--
-- Name: grant_server_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "grant_server_idx" ON "public"."grant_assignment" USING "btree" ("created_at", "grant_id") WHERE ("resource_type" = 'server'::"public"."grant_resource_type");


--
-- Name: grant_tabular_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "grant_tabular_idx" ON "public"."grant_assignment" USING "btree" ("warehouse_id", "tabular_id", "resource_type", "created_at", "grant_id") WHERE ("tabular_id" IS NOT NULL);


--
-- Name: grant_tag_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "grant_tag_idx" ON "public"."grant_assignment" USING "btree" ("tag_definition_id", "resource_type", "created_at", "grant_id") WHERE ("tag_definition_id" IS NOT NULL);


--
-- Name: grant_user_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "grant_user_idx" ON "public"."grant_assignment" USING "btree" ("user_id", "created_at", "grant_id") WHERE ("user_id" IS NOT NULL);


--
-- Name: grant_warehouse_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "grant_warehouse_idx" ON "public"."grant_assignment" USING "btree" ("warehouse_id", "created_at", "grant_id") WHERE ("resource_type" = 'warehouse'::"public"."grant_resource_type");


--
-- Name: grant_warehouse_level_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "grant_warehouse_level_idx" ON "public"."grant_assignment" USING "btree" ("warehouse_id", "resource_type", "created_at", "grant_id") WHERE ("warehouse_id" IS NOT NULL);


--
-- Name: idx_endpoint_stats_project_status_time; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_endpoint_stats_project_status_time" ON "public"."endpoint_statistics" USING "btree" ("project_id", "status_code", "timestamp" DESC);


--
-- Name: idx_endpoint_stats_project_timestamp; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_endpoint_stats_project_timestamp" ON "public"."endpoint_statistics" USING "btree" ("project_id", "timestamp" DESC);


--
-- Name: idx_endpoint_stats_project_warehouse_time; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_endpoint_stats_project_warehouse_time" ON "public"."endpoint_statistics" USING "btree" ("project_id", "warehouse_id", "timestamp" DESC);


--
-- Name: idx_idempotency_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_idempotency_created_at" ON "public"."idempotency_record" USING "btree" ("created_at");


--
-- Name: idx_warehouse_stats_history_time; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "idx_warehouse_stats_history_time" ON "public"."warehouse_statistics_history" USING "btree" ("warehouse_id", "timestamp" DESC);


--
-- Name: namespace_namespace_name_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "namespace_namespace_name_idx" ON "public"."namespace" USING "btree" ("namespace_name");


--
-- Name: namespace_warehouse_depth_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "namespace_warehouse_depth_created_at_idx" ON "public"."namespace" USING "btree" ("warehouse_id", "depth", "created_at", "namespace_id");


--
-- Name: namespace_warehouse_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "namespace_warehouse_id_idx" ON "public"."namespace" USING "btree" ("warehouse_id");


--
-- Name: role_assignment_role_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "role_assignment_role_id_idx" ON "public"."role_assignment" USING "btree" ("role_id", "user_id");


--
-- Name: role_membership_member_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "role_membership_member_idx" ON "public"."role_membership" USING "btree" ("member_role_id", "parent_role_id");


--
-- Name: role_project_created_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "role_project_created_id_idx" ON "public"."role" USING "btree" ("project_id", "created_at", "id");


--
-- Name: role_project_name_gist_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "role_project_name_gist_idx" ON "public"."role" USING "gist" ("project_id", "name" "public"."gist_trgm_ops" ("siglen"='256'));


--
-- Name: schema_field_assembly; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "schema_field_assembly" ON "public"."schema_field" USING "btree" ("warehouse_id", "tabular_id", "schema_id", "parent_field_id", "ordinal");


--
-- Name: schema_field_by_field; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "schema_field_by_field" ON "public"."schema_field" USING "btree" ("warehouse_id", "tabular_id", "field_id");


--
-- Name: tabular_name_namespace_name_gist_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "tabular_name_namespace_name_gist_index" ON "public"."tabular" USING "gist" ("warehouse_id", "public"."concat_namespace_name_tabular_name"("tabular_namespace_name", "name") "public"."gist_trgm_ops" ("siglen"='256')) WHERE (("deleted_at" IS NULL) AND ("metadata_location" IS NOT NULL));


--
-- Name: tabular_warehouse_fs_location_pattern_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "tabular_warehouse_fs_location_pattern_idx" ON "public"."tabular" USING "btree" ("warehouse_id", "fs_location" "text_pattern_ops");


--
-- Name: tabular_warehouse_id_location_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "tabular_warehouse_id_location_idx" ON "public"."tabular" USING "btree" ("warehouse_id", "fs_location");


--
-- Name: tabular_warehouse_namespace_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "tabular_warehouse_namespace_created_at_idx" ON "public"."tabular" USING "btree" ("warehouse_id", "namespace_id", "created_at", "tabular_id") WHERE (("deleted_at" IS NULL) AND (("metadata_location" IS NOT NULL) OR ("typ" = 'generic-table'::"public"."tabular_type")));


--
-- Name: tag_definition_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "tag_definition_idx" ON "public"."tag" USING "btree" ("tag_definition_id", "value");


--
-- Name: tag_definition_name_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "tag_definition_name_idx" ON "public"."tag_definition" USING "btree" ("project_id", "lower"("name"));


--
-- Name: tag_reverse_lookup_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "tag_reverse_lookup_idx" ON "public"."tag" USING "btree" ("tag_definition_id", "created_at", "tag_id");


--
-- Name: tag_tabular_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "tag_tabular_idx" ON "public"."tag" USING "btree" ("warehouse_id", "tabular_id") WHERE ("tabular_id" IS NOT NULL);


--
-- Name: task_log_warehouse_created_at_id_attempt_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "task_log_warehouse_created_at_id_attempt_idx" ON "public"."task_log" USING "btree" ("warehouse_id", "task_created_at" DESC);


--
-- Name: task_log_warehouse_id_entity_type_entity_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "task_log_warehouse_id_entity_type_entity_id_idx" ON "public"."task_log" USING "btree" ("warehouse_id", "entity_type", "entity_id", "task_created_at" DESC);


--
-- Name: task_log_warehouse_queue_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "task_log_warehouse_queue_created_at_idx" ON "public"."task_log" USING "btree" ("warehouse_id", "queue_name", "task_created_at" DESC);


--
-- Name: task_project_warehouse_created_at_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "task_project_warehouse_created_at_id_idx" ON "public"."task" USING "btree" ("project_id", "warehouse_id", "created_at" DESC);


--
-- Name: task_project_warehouse_id_entity_type_entity_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "task_project_warehouse_id_entity_type_entity_id_idx" ON "public"."task" USING "btree" ("project_id", "warehouse_id", "entity_type", "entity_id", "created_at" DESC);


--
-- Name: task_project_warehouse_queue_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "task_project_warehouse_queue_created_at_idx" ON "public"."task" USING "btree" ("project_id", "warehouse_id", "queue_name", "created_at" DESC);


--
-- Name: task_queue_name_status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "task_queue_name_status_idx" ON "public"."task" USING "btree" ("queue_name", "status", "scheduled_for");


--
-- Name: task_warehouse_entity_id_queue_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "task_warehouse_entity_id_queue_idx" ON "public"."task" USING "btree" ("warehouse_id", "entity_id", "queue_name") WHERE ("entity_type" = ANY (ARRAY['table'::"public"."entity_type", 'view'::"public"."entity_type", 'generic-table'::"public"."entity_type"]));


--
-- Name: task_warehouse_queue_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "task_warehouse_queue_created_at_idx" ON "public"."task" USING "btree" ("warehouse_id", "queue_name", "created_at" DESC);


--
-- Name: unique_role_name_in_project; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "unique_role_name_in_project" ON "public"."role" USING "btree" ("project_id", "lower"("name"));


--
-- Name: users_created_at_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "users_created_at_id_idx" ON "public"."users" USING "btree" ("created_at", "id") WHERE ("deleted_at" IS NULL);


--
-- Name: users_name_email_coalesce_gist_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "users_name_email_coalesce_gist_idx" ON "public"."users" USING "gist" ((((COALESCE("name", ''::"text") || ' '::"text") || COALESCE("email", ''::"text"))) "public"."gist_trgm_ops" ("siglen"='256'));


--
-- Name: users_name_gist_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "users_name_gist_idx" ON "public"."users" USING "gist" ("name" "public"."gist_trgm_ops" ("siglen"='256'));


--
-- Name: view_representation_view_id_version_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "view_representation_view_id_version_id_idx" ON "public"."view_representation" USING "btree" ("warehouse_id", "view_id", "view_version_id");


--
-- Name: warehouse_project_id_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "warehouse_project_id_name" ON "public"."warehouse" USING "btree" ("project_id", "warehouse_name");


--
-- Name: warehouse_status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "warehouse_status_idx" ON "public"."warehouse" USING "btree" ("status");


--
-- Name: table before_insert_check_metadata; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "before_insert_check_metadata" BEFORE INSERT OR UPDATE ON "public"."table" FOR EACH ROW EXECUTE FUNCTION "public"."prohibit_updates_of_metadata_blob"();


--
-- Name: schema_field schema_field_gc; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "schema_field_gc" AFTER DELETE ON "public"."schema_field" REFERENCING OLD TABLE AS "removed" FOR EACH STATEMENT EXECUTE FUNCTION "public"."gc_orphaned_columns"();


--
-- Name: current_view_metadata_version set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."current_view_metadata_version" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: endpoint_statistics set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."endpoint_statistics" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: generic_table_properties set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."generic_table_properties" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: partition_statistics set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."partition_statistics" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: secret set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."secret" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: server set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."server" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: table set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."table" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: table_current_schema set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."table_current_schema" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: table_default_partition_spec set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."table_default_partition_spec" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: table_default_sort_order set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."table_default_sort_order" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: table_encryption_keys set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."table_encryption_keys" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: table_metadata_log set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."table_metadata_log" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: table_partition_spec set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."table_partition_spec" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: table_properties set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."table_properties" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: table_refs set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."table_refs" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: table_schema set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."table_schema" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: table_snapshot set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."table_snapshot" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: table_snapshot_log set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."table_snapshot_log" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: table_sort_order set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."table_sort_order" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: table_statistics set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."table_statistics" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: tabular set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."tabular" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: tag set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."tag" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: tag_definition set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."tag_definition" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: task set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."task" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: task_config set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."task_config" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: users set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."users" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: view set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."view" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: view_properties set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."view_properties" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: view_representation set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."view_representation" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: view_schema set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."view_schema" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: view_version set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."view_version" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: warehouse_statistics set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."warehouse_statistics" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: warehouse_statistics_history set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at" BEFORE UPDATE ON "public"."warehouse_statistics_history" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at"();


--
-- Name: generic_table set_updated_at_and_increment_version; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at_and_increment_version" BEFORE UPDATE ON "public"."generic_table" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at_and_increment_version"();


--
-- Name: namespace set_updated_at_and_increment_version; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at_and_increment_version" BEFORE UPDATE ON "public"."namespace" FOR EACH ROW WHEN ((("old"."namespace_name" IS DISTINCT FROM "new"."namespace_name") OR ("old"."namespace_properties" IS DISTINCT FROM "new"."namespace_properties") OR ("old"."protected" IS DISTINCT FROM "new"."protected") OR ("old"."warehouse_id" IS DISTINCT FROM "new"."warehouse_id"))) EXECUTE FUNCTION "public"."set_updated_at_and_increment_version"();


--
-- Name: project set_updated_at_and_increment_version; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at_and_increment_version" BEFORE UPDATE ON "public"."project" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at_and_increment_version"();


--
-- Name: role set_updated_at_and_increment_version; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at_and_increment_version" BEFORE UPDATE ON "public"."role" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at_and_increment_version"();


--
-- Name: warehouse set_updated_at_and_increment_version; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "set_updated_at_and_increment_version" BEFORE UPDATE ON "public"."warehouse" FOR EACH ROW WHEN (("old".* IS DISTINCT FROM "new".*)) EXECUTE FUNCTION "public"."set_updated_at_and_increment_version"();


--
-- Name: table_schema table_schema_freeze_jsonb; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "table_schema_freeze_jsonb" BEFORE INSERT OR UPDATE ON "public"."table_schema" FOR EACH ROW EXECUTE FUNCTION "public"."reject_schema_write"();


--
-- Name: tabular update_counts; Type: TRIGGER; Schema: public; Owner: -
--

CREATE CONSTRAINT TRIGGER "update_counts" AFTER INSERT OR DELETE ON "public"."tabular" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "public"."update_counts"();


--
-- Name: tabular update_counts_trunc; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "update_counts_trunc" AFTER TRUNCATE ON "public"."tabular" FOR EACH STATEMENT EXECUTE FUNCTION "public"."update_counts"();


--
-- Name: view_schema view_schema_freeze_jsonb; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER "view_schema_freeze_jsonb" BEFORE INSERT OR UPDATE ON "public"."view_schema" FOR EACH ROW EXECUTE FUNCTION "public"."reject_schema_write"();


--
-- Name: current_view_metadata_version current_view_metadata_version_view_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."current_view_metadata_version"
    ADD CONSTRAINT "current_view_metadata_version_view_id_fkey" FOREIGN KEY ("warehouse_id", "view_id") REFERENCES "public"."view"("warehouse_id", "view_id") ON DELETE CASCADE;


--
-- Name: current_view_metadata_version current_view_metadata_version_view_id_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."current_view_metadata_version"
    ADD CONSTRAINT "current_view_metadata_version_view_id_version_id_fkey" FOREIGN KEY ("warehouse_id", "view_id", "version_id") REFERENCES "public"."view_version"("warehouse_id", "view_id", "version_id") ON DELETE CASCADE;


--
-- Name: endpoint_statistics endpoint_statistics_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."endpoint_statistics"
    ADD CONSTRAINT "endpoint_statistics_project_id_fkey" FOREIGN KEY ("project_id") REFERENCES "public"."project"("project_id") ON DELETE CASCADE;


--
-- Name: generic_table_properties generic_table_properties_warehouse_id_generic_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."generic_table_properties"
    ADD CONSTRAINT "generic_table_properties_warehouse_id_generic_table_id_fkey" FOREIGN KEY ("warehouse_id", "generic_table_id") REFERENCES "public"."generic_table"("warehouse_id", "generic_table_id") ON DELETE CASCADE;


--
-- Name: generic_table generic_table_warehouse_id_generic_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."generic_table"
    ADD CONSTRAINT "generic_table_warehouse_id_generic_table_id_fkey" FOREIGN KEY ("warehouse_id", "generic_table_id") REFERENCES "public"."tabular"("warehouse_id", "tabular_id") ON DELETE CASCADE;


--
-- Name: grant_assignment grant_namespace_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."grant_assignment"
    ADD CONSTRAINT "grant_namespace_fkey" FOREIGN KEY ("warehouse_id", "namespace_id") REFERENCES "public"."namespace"("warehouse_id", "namespace_id") ON DELETE CASCADE;


--
-- Name: grant_assignment grant_project_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."grant_assignment"
    ADD CONSTRAINT "grant_project_fkey" FOREIGN KEY ("project_id") REFERENCES "public"."project"("project_id") ON DELETE CASCADE;


--
-- Name: grant_assignment grant_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."grant_assignment"
    ADD CONSTRAINT "grant_role_fkey" FOREIGN KEY ("role_id") REFERENCES "public"."role"("id") ON DELETE CASCADE;


--
-- Name: grant_assignment grant_tabular_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."grant_assignment"
    ADD CONSTRAINT "grant_tabular_fkey" FOREIGN KEY ("warehouse_id", "tabular_id") REFERENCES "public"."tabular"("warehouse_id", "tabular_id") ON DELETE CASCADE;


--
-- Name: grant_assignment grant_tag_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."grant_assignment"
    ADD CONSTRAINT "grant_tag_fkey" FOREIGN KEY ("tag_definition_id") REFERENCES "public"."tag_definition"("tag_definition_id") ON DELETE CASCADE;


--
-- Name: grant_assignment grant_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."grant_assignment"
    ADD CONSTRAINT "grant_user_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE CASCADE;


--
-- Name: grant_assignment grant_warehouse_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."grant_assignment"
    ADD CONSTRAINT "grant_warehouse_fkey" FOREIGN KEY ("warehouse_id") REFERENCES "public"."warehouse"("warehouse_id") ON DELETE CASCADE;


--
-- Name: idempotency_record idempotency_record_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."idempotency_record"
    ADD CONSTRAINT "idempotency_record_warehouse_id_fkey" FOREIGN KEY ("warehouse_id") REFERENCES "public"."warehouse"("warehouse_id") ON DELETE CASCADE;


--
-- Name: namespace namespace_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."namespace"
    ADD CONSTRAINT "namespace_warehouse_id_fkey" FOREIGN KEY ("warehouse_id") REFERENCES "public"."warehouse"("warehouse_id");


--
-- Name: partition_statistics partition_statistics_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."partition_statistics"
    ADD CONSTRAINT "partition_statistics_table_id_fkey" FOREIGN KEY ("warehouse_id", "table_id") REFERENCES "public"."table"("warehouse_id", "table_id") ON DELETE CASCADE;


--
-- Name: partition_statistics partition_statistics_table_id_snapshot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."partition_statistics"
    ADD CONSTRAINT "partition_statistics_table_id_snapshot_id_fkey" FOREIGN KEY ("warehouse_id", "table_id", "snapshot_id") REFERENCES "public"."table_snapshot"("warehouse_id", "table_id", "snapshot_id") ON DELETE CASCADE;


--
-- Name: role_assignment role_assignment_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."role_assignment"
    ADD CONSTRAINT "role_assignment_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "public"."role"("id") ON DELETE CASCADE;


--
-- Name: role_assignment_sync role_assignment_sync_project_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."role_assignment_sync"
    ADD CONSTRAINT "role_assignment_sync_project_fkey" FOREIGN KEY ("project_id") REFERENCES "public"."project"("project_id") ON DELETE CASCADE;


--
-- Name: role_assignment_sync role_assignment_sync_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."role_assignment_sync"
    ADD CONSTRAINT "role_assignment_sync_user_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE CASCADE;


--
-- Name: role_assignment role_assignment_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."role_assignment"
    ADD CONSTRAINT "role_assignment_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE CASCADE;


--
-- Name: role_members_sync role_members_sync_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."role_members_sync"
    ADD CONSTRAINT "role_members_sync_role_fkey" FOREIGN KEY ("role_id") REFERENCES "public"."role"("id") ON DELETE CASCADE;


--
-- Name: role_membership role_membership_member_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."role_membership"
    ADD CONSTRAINT "role_membership_member_fkey" FOREIGN KEY ("member_role_id") REFERENCES "public"."role"("id") ON DELETE CASCADE;


--
-- Name: role_membership role_membership_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."role_membership"
    ADD CONSTRAINT "role_membership_parent_fkey" FOREIGN KEY ("parent_role_id") REFERENCES "public"."role"("id") ON DELETE CASCADE;


--
-- Name: role role_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."role"
    ADD CONSTRAINT "role_project_id_fkey" FOREIGN KEY ("project_id") REFERENCES "public"."project"("project_id");


--
-- Name: schema_field schema_field_warehouse_id_tabular_id_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."schema_field"
    ADD CONSTRAINT "schema_field_warehouse_id_tabular_id_field_id_fkey" FOREIGN KEY ("warehouse_id", "tabular_id", "field_id") REFERENCES "public"."tabular_field"("warehouse_id", "tabular_id", "field_id");


--
-- Name: schema_field schema_field_warehouse_id_tabular_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."schema_field"
    ADD CONSTRAINT "schema_field_warehouse_id_tabular_id_fkey" FOREIGN KEY ("warehouse_id", "tabular_id") REFERENCES "public"."tabular"("warehouse_id", "tabular_id") ON DELETE CASCADE;


--
-- Name: table_current_schema table_current_schema_table_id_schema_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_current_schema"
    ADD CONSTRAINT "table_current_schema_table_id_schema_id_fkey" FOREIGN KEY ("warehouse_id", "table_id", "schema_id") REFERENCES "public"."table_schema"("warehouse_id", "table_id", "schema_id") ON DELETE CASCADE;


--
-- Name: table_default_partition_spec table_default_partition_spec_table_id_partition_spec_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_default_partition_spec"
    ADD CONSTRAINT "table_default_partition_spec_table_id_partition_spec_id_fkey" FOREIGN KEY ("warehouse_id", "table_id", "partition_spec_id") REFERENCES "public"."table_partition_spec"("warehouse_id", "table_id", "partition_spec_id") ON DELETE CASCADE;


--
-- Name: table_default_sort_order table_default_sort_order_table_id_sort_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_default_sort_order"
    ADD CONSTRAINT "table_default_sort_order_table_id_sort_order_id_fkey" FOREIGN KEY ("warehouse_id", "table_id", "sort_order_id") REFERENCES "public"."table_sort_order"("warehouse_id", "table_id", "sort_order_id") ON DELETE CASCADE;


--
-- Name: table_encryption_keys table_encryption_keys_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_encryption_keys"
    ADD CONSTRAINT "table_encryption_keys_table_id_fkey" FOREIGN KEY ("warehouse_id", "table_id") REFERENCES "public"."table"("warehouse_id", "table_id") ON DELETE CASCADE;


--
-- Name: table_metadata_log table_metadata_log_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_metadata_log"
    ADD CONSTRAINT "table_metadata_log_table_id_fkey" FOREIGN KEY ("warehouse_id", "table_id") REFERENCES "public"."table"("warehouse_id", "table_id") ON DELETE CASCADE;


--
-- Name: table_partition_spec table_partition_spec_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_partition_spec"
    ADD CONSTRAINT "table_partition_spec_table_id_fkey" FOREIGN KEY ("warehouse_id", "table_id") REFERENCES "public"."table"("warehouse_id", "table_id") ON DELETE CASCADE;


--
-- Name: table_properties table_properties_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_properties"
    ADD CONSTRAINT "table_properties_table_id_fkey" FOREIGN KEY ("warehouse_id", "table_id") REFERENCES "public"."table"("warehouse_id", "table_id") ON DELETE CASCADE;


--
-- Name: table_refs table_refs_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_refs"
    ADD CONSTRAINT "table_refs_table_id_fkey" FOREIGN KEY ("warehouse_id", "table_id") REFERENCES "public"."table"("warehouse_id", "table_id") ON DELETE CASCADE;


--
-- Name: table_refs table_refs_table_id_snapshot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_refs"
    ADD CONSTRAINT "table_refs_table_id_snapshot_id_fkey" FOREIGN KEY ("warehouse_id", "table_id", "snapshot_id") REFERENCES "public"."table_snapshot"("warehouse_id", "table_id", "snapshot_id") ON DELETE CASCADE;


--
-- Name: table_schema table_schema_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_schema"
    ADD CONSTRAINT "table_schema_table_id_fkey" FOREIGN KEY ("warehouse_id", "table_id") REFERENCES "public"."table"("warehouse_id", "table_id") ON DELETE CASCADE;


--
-- Name: table_snapshot_log table_snapshot_log_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_snapshot_log"
    ADD CONSTRAINT "table_snapshot_log_table_id_fkey" FOREIGN KEY ("warehouse_id", "table_id") REFERENCES "public"."table"("warehouse_id", "table_id") ON DELETE CASCADE;


--
-- Name: table_snapshot table_snapshot_table_id_schema_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_snapshot"
    ADD CONSTRAINT "table_snapshot_table_id_schema_id_fkey" FOREIGN KEY ("warehouse_id", "table_id", "schema_id") REFERENCES "public"."table_schema"("warehouse_id", "table_id", "schema_id") ON DELETE CASCADE;


--
-- Name: table_sort_order table_sort_order_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_sort_order"
    ADD CONSTRAINT "table_sort_order_table_id_fkey" FOREIGN KEY ("warehouse_id", "table_id") REFERENCES "public"."table"("warehouse_id", "table_id") ON DELETE CASCADE;


--
-- Name: table_statistics table_statistics_table_id_snapshot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table_statistics"
    ADD CONSTRAINT "table_statistics_table_id_snapshot_id_fkey" FOREIGN KEY ("warehouse_id", "table_id", "snapshot_id") REFERENCES "public"."table_snapshot"("warehouse_id", "table_id", "snapshot_id") ON DELETE CASCADE;


--
-- Name: tabular_field tabular_field_warehouse_id_tabular_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."tabular_field"
    ADD CONSTRAINT "tabular_field_warehouse_id_tabular_id_fkey" FOREIGN KEY ("warehouse_id", "tabular_id") REFERENCES "public"."tabular"("warehouse_id", "tabular_id") ON DELETE CASCADE;


--
-- Name: table tabular_ident_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."table"
    ADD CONSTRAINT "tabular_ident_fk" FOREIGN KEY ("warehouse_id", "table_id") REFERENCES "public"."tabular"("warehouse_id", "tabular_id") ON DELETE CASCADE;


--
-- Name: view tabular_ident_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."view"
    ADD CONSTRAINT "tabular_ident_fk" FOREIGN KEY ("warehouse_id", "view_id") REFERENCES "public"."tabular"("warehouse_id", "tabular_id") ON DELETE CASCADE;


--
-- Name: tabular tabular_warehouse_id_namespace_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."tabular"
    ADD CONSTRAINT "tabular_warehouse_id_namespace_id_fkey" FOREIGN KEY ("warehouse_id", "namespace_id") REFERENCES "public"."namespace"("warehouse_id", "namespace_id") ON DELETE CASCADE;


--
-- Name: tabular tabular_warehouse_id_namespace_id_namespace_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."tabular"
    ADD CONSTRAINT "tabular_warehouse_id_namespace_id_namespace_name_fkey" FOREIGN KEY ("warehouse_id", "namespace_id", "tabular_namespace_name") REFERENCES "public"."namespace"("warehouse_id", "namespace_id", "namespace_name") ON UPDATE CASCADE;


--
-- Name: tag_allowed_value tag_allowed_value_definition_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."tag_allowed_value"
    ADD CONSTRAINT "tag_allowed_value_definition_fkey" FOREIGN KEY ("tag_definition_id") REFERENCES "public"."tag_definition"("tag_definition_id") ON DELETE CASCADE;


--
-- Name: tag tag_definition_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."tag"
    ADD CONSTRAINT "tag_definition_id_fkey" FOREIGN KEY ("tag_definition_id") REFERENCES "public"."tag_definition"("tag_definition_id") ON DELETE RESTRICT;


--
-- Name: tag_definition tag_definition_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."tag_definition"
    ADD CONSTRAINT "tag_definition_project_id_fkey" FOREIGN KEY ("project_id") REFERENCES "public"."project"("project_id") ON DELETE CASCADE;


--
-- Name: tag tag_field_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."tag"
    ADD CONSTRAINT "tag_field_fkey" FOREIGN KEY ("warehouse_id", "tabular_id", "field_id") REFERENCES "public"."tabular_field"("warehouse_id", "tabular_id", "field_id") ON DELETE CASCADE;


--
-- Name: tag tag_namespace_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."tag"
    ADD CONSTRAINT "tag_namespace_fkey" FOREIGN KEY ("warehouse_id", "namespace_id") REFERENCES "public"."namespace"("warehouse_id", "namespace_id") ON DELETE CASCADE;


--
-- Name: tag tag_tabular_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."tag"
    ADD CONSTRAINT "tag_tabular_fkey" FOREIGN KEY ("warehouse_id", "tabular_id") REFERENCES "public"."tabular"("warehouse_id", "tabular_id") ON DELETE CASCADE;


--
-- Name: tag tag_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."tag"
    ADD CONSTRAINT "tag_warehouse_id_fkey" FOREIGN KEY ("warehouse_id") REFERENCES "public"."warehouse"("warehouse_id") ON DELETE CASCADE;


--
-- Name: task_config task_config_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."task_config"
    ADD CONSTRAINT "task_config_project_id_fkey" FOREIGN KEY ("project_id") REFERENCES "public"."project"("project_id") ON DELETE CASCADE;


--
-- Name: task_config task_config_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."task_config"
    ADD CONSTRAINT "task_config_warehouse_id_fkey" FOREIGN KEY ("warehouse_id") REFERENCES "public"."warehouse"("warehouse_id") ON DELETE CASCADE;


--
-- Name: task_log task_log_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."task_log"
    ADD CONSTRAINT "task_log_project_id_fkey" FOREIGN KEY ("project_id") REFERENCES "public"."project"("project_id") ON DELETE CASCADE;


--
-- Name: task_log task_log_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."task_log"
    ADD CONSTRAINT "task_log_warehouse_id_fkey" FOREIGN KEY ("warehouse_id") REFERENCES "public"."warehouse"("warehouse_id") ON DELETE CASCADE;


--
-- Name: task task_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."task"
    ADD CONSTRAINT "task_project_id_fkey" FOREIGN KEY ("project_id") REFERENCES "public"."project"("project_id") ON DELETE CASCADE;


--
-- Name: task task_warehouse_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."task"
    ADD CONSTRAINT "task_warehouse_id_fk" FOREIGN KEY ("warehouse_id") REFERENCES "public"."warehouse"("warehouse_id");


--
-- Name: view_properties view_properties_view_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."view_properties"
    ADD CONSTRAINT "view_properties_view_id_fkey" FOREIGN KEY ("warehouse_id", "view_id") REFERENCES "public"."view"("warehouse_id", "view_id") ON DELETE CASCADE;


--
-- Name: view_representation view_representation_view_id_view_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."view_representation"
    ADD CONSTRAINT "view_representation_view_id_view_version_id_fkey" FOREIGN KEY ("warehouse_id", "view_id", "view_version_id") REFERENCES "public"."view_version"("warehouse_id", "view_id", "version_id") ON DELETE CASCADE;


--
-- Name: view_schema view_schema_view_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."view_schema"
    ADD CONSTRAINT "view_schema_view_id_fkey" FOREIGN KEY ("warehouse_id", "view_id") REFERENCES "public"."view"("warehouse_id", "view_id") ON DELETE CASCADE;


--
-- Name: view_version view_version_default_namespace_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."view_version"
    ADD CONSTRAINT "view_version_default_namespace_id_fkey" FOREIGN KEY ("default_namespace_id") REFERENCES "public"."namespace"("namespace_id");


--
-- Name: view_version_log view_version_log_view_id_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."view_version_log"
    ADD CONSTRAINT "view_version_log_view_id_version_id_fkey" FOREIGN KEY ("warehouse_id", "view_id", "version_id") REFERENCES "public"."view_version"("warehouse_id", "view_id", "version_id") ON DELETE CASCADE;


--
-- Name: view_version view_version_view_id_schema_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."view_version"
    ADD CONSTRAINT "view_version_view_id_schema_id_fkey" FOREIGN KEY ("warehouse_id", "view_id", "schema_id") REFERENCES "public"."view_schema"("warehouse_id", "view_id", "schema_id") ON DELETE CASCADE;


--
-- Name: warehouse warehouse_project_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."warehouse"
    ADD CONSTRAINT "warehouse_project_id_fk" FOREIGN KEY ("project_id") REFERENCES "public"."project"("project_id") ON UPDATE CASCADE;


--
-- Name: warehouse_statistics_history warehouse_statistics_history_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."warehouse_statistics_history"
    ADD CONSTRAINT "warehouse_statistics_history_warehouse_id_fkey" FOREIGN KEY ("warehouse_id") REFERENCES "public"."warehouse"("warehouse_id") ON DELETE CASCADE;


--
-- Name: warehouse_statistics warehouse_statistics_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."warehouse_statistics"
    ADD CONSTRAINT "warehouse_statistics_warehouse_id_fkey" FOREIGN KEY ("warehouse_id") REFERENCES "public"."warehouse"("warehouse_id") ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict Z03fpMvbSYvdD0o5MPO5oOhQuniNBytBQcX5cszHtzshmkg2sYrosyXVqpyaA64

