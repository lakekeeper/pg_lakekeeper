SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._iceberg_table()
RETURNS TABLE (
    warehouse_id              uuid,
    table_id                  uuid,
    namespace_id              uuid,
    namespace_name            text[],
    name                      text,
    full_name                 text,
    location                  text,
    metadata_location         text,
    format_version            integer,
    current_schema_id         integer,
    default_partition_spec_id integer,
    default_sort_order_id     bigint,
    current_snapshot_id       bigint,
    last_column_id            integer,
    last_partition_id         integer,
    last_sequence_number      bigint,
    last_updated_ms           bigint,
    next_row_id               bigint,
    is_live                   boolean,
    protected                 boolean,
    deleted_at                timestamptz,
    created_at                timestamptz,
    updated_at                timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT t.warehouse_id,
           t.table_id,
           tb.namespace_id,
           tb.tabular_namespace_name,
           tb.name,
           @lk@.concat_namespace_name_tabular_name(tb.tabular_namespace_name, tb.name),
           tb.fs_protocol || '://' || tb.fs_location,
           tb.metadata_location,
           t.table_format_version::text::integer,
           cs.schema_id,
           dps.partition_spec_id,
           dso.sort_order_id,
           main.snapshot_id,
           t.last_column_id,
           t.last_partition_id,
           t.last_sequence_number,
           t.last_updated_ms,
           t.next_row_id,
           tb.deleted_at IS NULL AND tb.metadata_location IS NOT NULL,
           tb.protected,
           tb.deleted_at,
           t.created_at,
           t.updated_at
    FROM @lk@."table" t
    JOIN @lk@.tabular tb
        ON tb.warehouse_id = t.warehouse_id AND tb.tabular_id = t.table_id
    LEFT JOIN @lk@.table_current_schema cs
        ON cs.warehouse_id = t.warehouse_id AND cs.table_id = t.table_id
    LEFT JOIN @lk@.table_default_partition_spec dps
        ON dps.warehouse_id = t.warehouse_id AND dps.table_id = t.table_id
    LEFT JOIN @lk@.table_default_sort_order dso
        ON dso.warehouse_id = t.warehouse_id AND dso.table_id = t.table_id
    LEFT JOIN @lk@.table_refs main
        ON main.warehouse_id = t.warehouse_id AND main.table_id = t.table_id
       AND main.table_ref_name = 'main'
$body$;
$def$);

CREATE VIEW @extschema@.iceberg_table WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._iceberg_table();

COMMENT ON VIEW @extschema@.iceberg_table IS
    'Iceberg tables with their current pointers. current_snapshot_id is the snapshot the main branch names.';

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._table_property()
RETURNS TABLE (
    warehouse_id uuid,
    table_id     uuid,
    key          text,
    value        text,
    created_at   timestamptz,
    updated_at   timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT p.warehouse_id, p.table_id, p.key, p.value, p.created_at, p.updated_at
    FROM @lk@.table_properties p
$body$;
$def$);

CREATE VIEW @extschema@.table_property WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._table_property();

COMMENT ON VIEW @extschema@.table_property IS
    'Table properties, one row per key.';

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._table_snapshot()
RETURNS TABLE (
    warehouse_id       uuid,
    table_id           uuid,
    snapshot_id        bigint,
    parent_snapshot_id bigint,
    sequence_number    bigint,
    schema_id          integer,
    timestamp_ms       bigint,
    manifest_list      text,
    operation          text,
    added_data_files   bigint,
    deleted_data_files bigint,
    total_data_files   bigint,
    total_delete_files bigint,
    added_records      bigint,
    deleted_records    bigint,
    total_records      bigint,
    added_files_size   bigint,
    removed_files_size bigint,
    total_files_size   bigint,
    first_row_id       bigint,
    assigned_rows      bigint,
    summary            jsonb,
    created_at         timestamptz,
    updated_at         timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT s.warehouse_id,
           s.table_id,
           s.snapshot_id,
           s.parent_snapshot_id,
           s.sequence_number,
           s.schema_id,
           s.timestamp_ms,
           s.manifest_list,
           s.summary->>'operation',
           (s.summary->>'added-data-files')::bigint,
           (s.summary->>'deleted-data-files')::bigint,
           (s.summary->>'total-data-files')::bigint,
           (s.summary->>'total-delete-files')::bigint,
           (s.summary->>'added-records')::bigint,
           (s.summary->>'deleted-records')::bigint,
           (s.summary->>'total-records')::bigint,
           (s.summary->>'added-files-size')::bigint,
           (s.summary->>'removed-files-size')::bigint,
           (s.summary->>'total-files-size')::bigint,
           s.first_row_id,
           s.assigned_rows,
           s.summary,
           s.created_at,
           s.updated_at
    FROM @lk@.table_snapshot s
$body$;
$def$);

CREATE VIEW @extschema@.table_snapshot WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._table_snapshot();

COMMENT ON VIEW @extschema@.table_snapshot IS
    'Snapshots. The standard summary counters are typed columns; summary keeps every key the writer set.';

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._table_ref()
RETURNS TABLE (
    warehouse_id          uuid,
    table_id              uuid,
    ref_name              text,
    ref_type              text,
    snapshot_id           bigint,
    min_snapshots_to_keep integer,
    max_snapshot_age_ms   bigint,
    max_ref_age_ms        bigint,
    created_at            timestamptz,
    updated_at            timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT r.warehouse_id,
           r.table_id,
           r.table_ref_name,
           r.retention->>'type',
           r.snapshot_id,
           (r.retention->>'min-snapshots-to-keep')::integer,
           (r.retention->>'max-snapshot-age-ms')::bigint,
           (r.retention->>'max-ref-age-ms')::bigint,
           r.created_at,
           r.updated_at
    FROM @lk@.table_refs r
$body$;
$def$);

CREATE VIEW @extschema@.table_ref WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._table_ref();

COMMENT ON VIEW @extschema@.table_ref IS
    'Branches and tags, with their retention settings.';

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._table_snapshot_log()
RETURNS TABLE (
    warehouse_id    uuid,
    table_id        uuid,
    sequence_number bigint,
    snapshot_id     bigint,
    timestamp_ms    bigint,
    created_at      timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT l.warehouse_id, l.table_id, l.sequence_number, l.snapshot_id,
           l."timestamp", l.created_at
    FROM @lk@.table_snapshot_log l
$body$;
$def$);

CREATE VIEW @extschema@.table_snapshot_log WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._table_snapshot_log();

COMMENT ON VIEW @extschema@.table_snapshot_log IS
    'The order in which snapshots became current.';

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._table_metadata_log()
RETURNS TABLE (
    warehouse_id    uuid,
    table_id        uuid,
    sequence_number bigint,
    timestamp_ms    bigint,
    metadata_file   text,
    created_at      timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT l.warehouse_id, l.table_id, l.sequence_number, l."timestamp",
           l.metadata_file, l.created_at
    FROM @lk@.table_metadata_log l
$body$;
$def$);

CREATE VIEW @extschema@.table_metadata_log WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._table_metadata_log();

COMMENT ON VIEW @extschema@.table_metadata_log IS
    'Previous metadata files, in the order they were replaced.';

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._table_partition_field()
RETURNS TABLE (
    warehouse_id      uuid,
    table_id          uuid,
    partition_spec_id integer,
    ordinal           integer,
    field_id          integer,
    source_id         integer,
    name              text,
    transform         text
)
LANGUAGE sql STABLE
AS $body$
    SELECT s.warehouse_id,
           s.table_id,
           s.partition_spec_id,
           f.ordinality::integer,
           (f.value->>'field-id')::integer,
           (f.value->>'source-id')::integer,
           f.value->>'name',
           f.value->>'transform'
    FROM @lk@.table_partition_spec s
    LEFT JOIN LATERAL jsonb_array_elements(s.partition_spec->'fields')
        WITH ORDINALITY AS f(value, ordinality) ON true
$body$;
$def$);

CREATE VIEW @extschema@.table_partition_field WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._table_partition_field();

COMMENT ON VIEW @extschema@.table_partition_field IS
    'Partition fields, one row per field. A spec with no fields keeps one row with the field columns null.';

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._table_sort_field()
RETURNS TABLE (
    warehouse_id  uuid,
    table_id      uuid,
    sort_order_id bigint,
    ordinal       integer,
    source_id     integer,
    transform     text,
    direction     text,
    null_order    text
)
LANGUAGE sql STABLE
AS $body$
    SELECT o.warehouse_id,
           o.table_id,
           o.sort_order_id,
           f.ordinality::integer,
           (f.value->>'source-id')::integer,
           f.value->>'transform',
           f.value->>'direction',
           f.value->>'null-order'
    FROM @lk@.table_sort_order o
    LEFT JOIN LATERAL jsonb_array_elements(o.sort_order->'fields')
        WITH ORDINALITY AS f(value, ordinality) ON true
$body$;
$def$);

CREATE VIEW @extschema@.table_sort_field WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._table_sort_field();

COMMENT ON VIEW @extschema@.table_sort_field IS
    'Sort order fields, one row per field. An unsorted order keeps one row with the field columns null.';

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._table_statistics()
RETURNS TABLE (
    warehouse_id              uuid,
    table_id                  uuid,
    snapshot_id               bigint,
    statistics_path           text,
    file_size_in_bytes        bigint,
    file_footer_size_in_bytes bigint,
    blob_metadata             jsonb,
    created_at                timestamptz,
    updated_at                timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT s.warehouse_id, s.table_id, s.snapshot_id, s.statistics_path,
           s.file_size_in_bytes, s.file_footer_size_in_bytes, s.blob_metadata,
           s.created_at, s.updated_at
    FROM @lk@.table_statistics s
$body$;
$def$);

CREATE VIEW @extschema@.table_statistics WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._table_statistics();

COMMENT ON VIEW @extschema@.table_statistics IS
    'Puffin statistics files, one row per snapshot they describe.';

SELECT @extschema@._define($def$
CREATE FUNCTION @extschema@._partition_statistics()
RETURNS TABLE (
    warehouse_id       uuid,
    table_id           uuid,
    snapshot_id        bigint,
    statistics_path    text,
    file_size_in_bytes bigint,
    created_at         timestamptz,
    updated_at         timestamptz
)
LANGUAGE sql STABLE
AS $body$
    SELECT s.warehouse_id, s.table_id, s.snapshot_id, s.statistics_path,
           s.file_size_in_bytes, s.created_at, s.updated_at
    FROM @lk@.partition_statistics s
$body$;
$def$);

CREATE VIEW @extschema@.partition_statistics WITH (security_invoker = true) AS
    SELECT * FROM @extschema@._partition_statistics();

COMMENT ON VIEW @extschema@.partition_statistics IS
    'Partition statistics files, one row per snapshot they describe.';
