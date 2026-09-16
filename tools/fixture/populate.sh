#!/bin/sh
# Creates the catalog content the test suite reads back, then captures the REST
# responses the SQL output is compared against.
#
# Usage: populate.sh <output-directory>
# Requires: curl, jq. Reads LAKEKEEPER_URL (default http://127.0.0.1:58181).
set -eu

base=${LAKEKEEPER_URL:-http://127.0.0.1:58181}
mgmt=$base/management/v1
out=${1:?usage: populate.sh <output-directory>}
api=$out/api
mkdir -p "$api"

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

req() {
    method=$1
    url=$2
    body=${3:-}
    if [ -n "$body" ]; then
        code=$(curl -sS -o "$tmp/resp" -w '%{http_code}' -X "$method" "$url" \
                    -H 'Content-Type: application/json' -d "$body")
    else
        code=$(curl -sS -o "$tmp/resp" -w '%{http_code}' -X "$method" "$url")
    fi
    case $code in
        2*) cat "$tmp/resp" ;;
        *)  printf 'populate: %s %s -> %s\n' "$method" "$url" "$code" >&2
            cat "$tmp/resp" >&2
            printf '\n' >&2
            exit 1 ;;
    esac
}

capture() {
    # Vended credentials are short-lived storage tokens, not catalog state.
    req GET "$2" | jq -S 'del(."storage-credentials", .config)' > "$api/$1.json"
}

storage_profile='
    "storage-profile": {
        "type": "s3", "bucket": "warehouse", "key-prefix": "PREFIX",
        "endpoint": "http://minio:9000", "region": "local-01",
        "path-style-access": true, "flavor": "minio", "sts-enabled": true
    },
    "storage-credential": {
        "type": "s3", "credential-type": "access-key",
        "aws-access-key-id": "minio-root-user",
        "aws-secret-access-key": "minio-root-password"
    }'

warehouse() {  # name prefix extra-json
    req POST "$mgmt/warehouse" "{
        \"warehouse-name\": \"$1\",
        \"project-id\": \"$default_project\",
        $(echo "$storage_profile" | sed "s/PREFIX/$2/")
        ${3:+, $3}
    }" | jq -r '."warehouse-id"'
}

default_project=00000000-0000-0000-0000-000000000000

# --- server -----------------------------------------------------------------
req POST "$mgmt/bootstrap" '{"accept-terms-of-use": true}' >/dev/null

# --- identities -------------------------------------------------------------
req POST "$mgmt/user" '{"id": "oidc~alice", "name": "Alice Analyst",
    "email": "alice@example.invalid", "user-type": "human", "update-if-exists": true}' >/dev/null
req POST "$mgmt/user" '{"id": "kubernetes~pipeline", "name": "Nightly Pipeline",
    "user-type": "application", "update-if-exists": true}' >/dev/null

analysts=$(req POST "$mgmt/role" '{"name": "analysts",
    "description": "Reads the sales warehouse"}' | jq -r .id)
juniors=$(req POST "$mgmt/role" '{"name": "juniors"}' | jq -r .id)
req POST "$mgmt/role" '{"name": "robots",
    "provider-id": "oidc", "source-id": "group-robots"}' >/dev/null

req POST "$mgmt/role/$analysts/members" "{\"members\": [
    {\"type\": \"user\", \"id\": \"oidc~alice\"},
    {\"type\": \"role\", \"id\": \"$juniors\"}]}" >/dev/null
req POST "$mgmt/role/$juniors/members" '{"members": [
    {"type": "user", "id": "kubernetes~pipeline"}]}' >/dev/null

# A second project, so project-scoped rows are never the only row.
finance=$(req POST "$mgmt/project" '{"project-name": "finance"}' | jq -r '."project-id"')

# --- warehouses -------------------------------------------------------------
wh_hard=$(warehouse wh_hard hard '"delete-profile": {"type": "hard"}')
wh_soft=$(warehouse wh_soft soft '"delete-profile": {"type": "soft", "expiration-seconds": 86400}')
wh_off=$(warehouse wh_off off)
req POST "$mgmt/warehouse/$wh_off/deactivate" >/dev/null
req POST "$mgmt/warehouse/$wh_soft/protection" '{"protected": true}' >/dev/null

cat="$base/catalog/v1/$wh_hard"
soft="$base/catalog/v1/$wh_soft"

# --- namespaces -------------------------------------------------------------
req POST "$cat/namespaces" '{"namespace": ["sales"],
    "properties": {"owner": "analytics"}}' >/dev/null
req POST "$cat/namespaces" '{"namespace": ["sales", "eu"], "properties": {}}' >/dev/null
req POST "$cat/namespaces" '{"namespace": ["sales", "eu", "q1"],
    "properties": {"retention": "5y"}}' >/dev/null
req POST "$cat/namespaces" '{"namespace": ["logs"], "properties": {}}' >/dev/null
req POST "$soft/namespaces" '{"namespace": ["staging"], "properties": {}}' >/dev/null

eu=sales%1Feu
now_ms=$(( $(date +%s) * 1000 ))

# --- tables -----------------------------------------------------------------
# Nested struct, list and map members, an identifier field, a partition spec and
# a sort order, so every shape the field views must render appears once.
req POST "$cat/namespaces/$eu/tables" '{
    "name": "orders",
    "schema": {
        "type": "struct", "schema-id": 0, "identifier-field-ids": [1],
        "fields": [
            {"id": 1, "name": "order_id", "required": true, "type": "long",
             "doc": "Order number"},
            {"id": 2, "name": "placed_at", "required": true, "type": "timestamptz"},
            {"id": 3, "name": "amount", "required": false, "type": "decimal(12, 2)"},
            {"id": 4, "name": "customer", "required": false, "type": {
                "type": "struct", "fields": [
                    {"id": 5, "name": "customer_id", "required": true, "type": "uuid"},
                    {"id": 6, "name": "display_name", "required": false, "type": "string"}
                ]}},
            {"id": 7, "name": "items", "required": false, "type": {
                "type": "list", "element-id": 8, "element-required": true,
                "element": "string"}},
            {"id": 9, "name": "scores", "required": false, "type": {
                "type": "map", "key-id": 10, "key": "string",
                "value-id": 11, "value-required": false, "value": "double"}}
        ]},
    "partition-spec": {"spec-id": 0, "fields": [
        {"source-id": 2, "field-id": 1000, "transform": "day", "name": "placed_at_day"}]},
    "write-order": {"order-id": 1, "fields": [
        {"source-id": 1, "transform": "identity", "direction": "asc",
         "null-order": "nulls-first"}]},
    "properties": {"owner": "analytics", "write.format.default": "parquet"},
    "stage-create": false}' >/dev/null

orders=$(req GET "$cat/namespaces/$eu/tables/orders" | jq -r '.metadata."table-uuid"')

# Two appends, a branch and a tag, and both statistics kinds, so the snapshot
# graph, the ref set and the log tables all carry more than one row.
snap="s3://warehouse/hard/sales/eu/orders/metadata"
req POST "$cat/namespaces/$eu/tables/orders" "{
    \"identifier\": {\"namespace\": [\"sales\", \"eu\"], \"name\": \"orders\"},
    \"requirements\": [{\"type\": \"assert-table-uuid\", \"uuid\": \"$orders\"}],
    \"updates\": [
        {\"action\": \"add-snapshot\", \"snapshot\": {
            \"snapshot-id\": 3001, \"sequence-number\": 1, \"timestamp-ms\": $now_ms,
            \"manifest-list\": \"$snap/snap-3001.avro\", \"schema-id\": 0,
            \"summary\": {\"operation\": \"append\",
                \"added-data-files\": \"2\", \"added-records\": \"100\",
                \"total-data-files\": \"2\", \"total-delete-files\": \"0\",
                \"total-records\": \"100\", \"total-files-size\": \"2048\"}}},
        {\"action\": \"set-snapshot-ref\", \"ref-name\": \"main\",
         \"type\": \"branch\", \"snapshot-id\": 3001}]}" >/dev/null

req POST "$cat/namespaces/$eu/tables/orders" "{
    \"identifier\": {\"namespace\": [\"sales\", \"eu\"], \"name\": \"orders\"},
    \"requirements\": [{\"type\": \"assert-table-uuid\", \"uuid\": \"$orders\"}],
    \"updates\": [
        {\"action\": \"add-snapshot\", \"snapshot\": {
            \"snapshot-id\": 3002, \"parent-snapshot-id\": 3001,
            \"sequence-number\": 2, \"timestamp-ms\": $(( now_ms + 1000 )),
            \"manifest-list\": \"$snap/snap-3002.avro\", \"schema-id\": 0,
            \"summary\": {\"operation\": \"append\",
                \"added-data-files\": \"1\", \"added-records\": \"50\",
                \"deleted-data-files\": \"0\", \"deleted-records\": \"0\",
                \"total-data-files\": \"3\", \"total-delete-files\": \"0\",
                \"total-records\": \"150\", \"total-files-size\": \"3072\",
                \"removed-files-size\": \"0\"}}},
        {\"action\": \"set-snapshot-ref\", \"ref-name\": \"main\",
         \"type\": \"branch\", \"snapshot-id\": 3002,
         \"min-snapshots-to-keep\": 2, \"max-snapshot-age-ms\": 604800000},
        {\"action\": \"set-snapshot-ref\", \"ref-name\": \"release\",
         \"type\": \"tag\", \"snapshot-id\": 3001, \"max-ref-age-ms\": 2592000000},
        {\"action\": \"set-statistics\", \"statistics\": {
            \"snapshot-id\": 3002, \"statistics-path\": \"$snap/stats-3002.puffin\",
            \"file-size-in-bytes\": 1024, \"file-footer-size-in-bytes\": 64,
            \"blob-metadata\": [{\"type\": \"apache-datasketches-theta-v1\",
                \"snapshot-id\": 3002, \"sequence-number\": 2,
                \"fields\": [1], \"properties\": {}}]}},
        {\"action\": \"set-partition-statistics\", \"partition-statistics\": {
            \"snapshot-id\": 3002,
            \"statistics-path\": \"$snap/part-stats-3002.parquet\",
            \"file-size-in-bytes\": 512}}]}" >/dev/null

req POST "$cat/namespaces/logs/tables" '{
    "name": "events",
    "schema": {"type": "struct", "schema-id": 0, "fields": [
        {"id": 1, "name": "event_id", "required": true, "type": "string"},
        {"id": 2, "name": "payload", "required": false, "type": "binary"}]},
    "stage-create": false}' >/dev/null

# One table per format version the warehouse allows, so the metadata document
# is exercised on each of them.
req POST "$cat/namespaces/$eu/tables" '{
    "name": "orders_v3",
    "schema": {"type": "struct", "schema-id": 0, "fields": [
        {"id": 1, "name": "order_id", "required": true, "type": "long"},
        {"id": 2, "name": "tag", "required": false, "type": "string"}]},
    "properties": {"format-version": "3"},
    "stage-create": false}' >/dev/null

orders_v3=$(req GET "$cat/namespaces/$eu/tables/orders_v3" | jq -r '.metadata."table-uuid"')

# Row lineage, which only format version 3 carries: a snapshot names the range
# of row ids it assigns, and may name the key its data files are encrypted with.
req POST "$cat/namespaces/$eu/tables/orders_v3" "{
    \"identifier\": {\"namespace\": [\"sales\", \"eu\"], \"name\": \"orders_v3\"},
    \"requirements\": [{\"type\": \"assert-table-uuid\", \"uuid\": \"$orders_v3\"}],
    \"updates\": [
        {\"action\": \"add-snapshot\", \"snapshot\": {
            \"snapshot-id\": 4001, \"sequence-number\": 1, \"timestamp-ms\": $now_ms,
            \"manifest-list\": \"s3://warehouse/hard/sales/eu/orders_v3/metadata/snap-4001.avro\",
            \"schema-id\": 0, \"first-row-id\": 0, \"added-rows\": 25,
            \"summary\": {\"operation\": \"append\",
                \"added-data-files\": \"1\", \"added-records\": \"25\",
                \"total-data-files\": \"1\", \"total-delete-files\": \"0\",
                \"total-records\": \"25\", \"total-files-size\": \"512\"}}},
        {\"action\": \"add-snapshot\", \"snapshot\": {
            \"snapshot-id\": 4002, \"parent-snapshot-id\": 4001,
            \"sequence-number\": 2, \"timestamp-ms\": $(( now_ms + 1000 )),
            \"manifest-list\": \"s3://warehouse/hard/sales/eu/orders_v3/metadata/snap-4002.avro\",
            \"schema-id\": 0, \"first-row-id\": 25, \"added-rows\": 10,
            \"key-id\": \"fixture-key-1\",
            \"summary\": {\"operation\": \"append\",
                \"added-data-files\": \"1\", \"added-records\": \"10\",
                \"total-data-files\": \"2\", \"total-delete-files\": \"0\",
                \"total-records\": \"35\", \"total-files-size\": \"1024\"}}},
        {\"action\": \"set-snapshot-ref\", \"ref-name\": \"main\",
         \"type\": \"branch\", \"snapshot-id\": 4002}]}" >/dev/null

# A table whose data files are encrypted: the catalog's document carries the
# wrapped key material, which this extension does not read.
req POST "$cat/namespaces/logs/tables" '{
    "name": "encrypted_v3",
    "schema": {"type": "struct", "schema-id": 0, "fields": [
        {"id": 1, "name": "id", "required": true, "type": "long"}]},
    "properties": {"format-version": "3"},
    "stage-create": false}' >/dev/null

encrypted_v3=$(req GET "$cat/namespaces/logs/tables/encrypted_v3" \
    | jq -r '.metadata."table-uuid"')
req POST "$cat/namespaces/logs/tables/encrypted_v3" "{
    \"identifier\": {\"namespace\": [\"logs\"], \"name\": \"encrypted_v3\"},
    \"requirements\": [{\"type\": \"assert-table-uuid\", \"uuid\": \"$encrypted_v3\"}],
    \"updates\": [{\"action\": \"add-encryption-key\", \"encryption-key\": {
        \"key-id\": \"fixture-dek-1\",
        \"encrypted-key-metadata\": \"$(printf 'fixture-wrapped-key' | base64 | tr -d '\n')\",
        \"encrypted-by-id\": \"fixture-kek-1\"}}]}" >/dev/null

req POST "$cat/namespaces/logs/tables" '{
    "name": "legacy_v1",
    "schema": {"type": "struct", "schema-id": 0, "fields": [
        {"id": 1, "name": "id", "required": true, "type": "long"}]},
    "properties": {"format-version": "1"},
    "stage-create": false}' >/dev/null

# Protected, so the protection flag is non-uniform across rows.
req POST "$cat/namespaces/logs/tables" '{
    "name": "audit",
    "schema": {"type": "struct", "schema-id": 0, "fields": [
        {"id": 1, "name": "at", "required": true, "type": "timestamptz"}]},
    "stage-create": false}' >/dev/null
audit=$(req GET "$cat/namespaces/logs/tables/audit" | jq -r '.metadata."table-uuid"')
req POST "$mgmt/warehouse/$wh_hard/table/$audit/protection" '{"protected": true}' >/dev/null

# Dropped from a hard-delete warehouse: the row goes away entirely.
req POST "$cat/namespaces/logs/tables" '{
    "name": "scratch",
    "schema": {"type": "struct", "schema-id": 0, "fields": [
        {"id": 1, "name": "x", "required": false, "type": "int"}]},
    "stage-create": false}' >/dev/null
req DELETE "$cat/namespaces/logs/tables/scratch" >/dev/null

# Dropped from a soft-delete warehouse: the row stays with deleted_at set.
req POST "$soft/namespaces/staging/tables" '{
    "name": "retired",
    "schema": {"type": "struct", "schema-id": 0, "fields": [
        {"id": 1, "name": "x", "required": false, "type": "int"}]},
    "stage-create": false}' >/dev/null
req DELETE "$soft/namespaces/staging/tables/retired" >/dev/null

# --- a table with a history -------------------------------------------------
# Schema, partition spec and sort order evolution, column defaults, append,
# overwrite and delete snapshots, a removed snapshot, and property changes: the
# shapes a table accumulates once engines have written to it.
req POST "$cat/namespaces/$eu/tables" '{
    "name": "evolved",
    "schema": {"type": "struct", "schema-id": 0, "fields": [
        {"id": 1, "name": "id", "required": true, "type": "long"},
        {"id": 2, "name": "sku", "required": true, "type": "string"},
        {"id": 3, "name": "sold_at", "required": true, "type": "timestamp"},
        {"id": 4, "name": "sold_on", "required": false, "type": "date"},
        {"id": 5, "name": "opened_at", "required": false, "type": "time"},
        {"id": 6, "name": "ratio", "required": false, "type": "float"},
        {"id": 7, "name": "qty", "required": false, "type": "int"},
        {"id": 8, "name": "flag", "required": false, "type": "boolean"},
        {"id": 9, "name": "digest", "required": false, "type": "fixed[16]"},
        {"id": 10, "name": "legacy_note", "required": false, "type": "string"},
        {"id": 11, "name": "lines", "required": false, "type": {
            "type": "list", "element-id": 12, "element-required": false,
            "element": {"type": "struct", "fields": [
                {"id": 13, "name": "line_no", "required": true, "type": "int"},
                {"id": 14, "name": "note", "required": false, "type": "string",
                 "doc": "Free text"}]}}},
        {"id": 15, "name": "attrs", "required": false, "type": {
            "type": "map", "key-id": 16, "key": "string",
            "value-id": 17, "value-required": false,
            "value": {"type": "struct", "fields": [
                {"id": 18, "name": "v", "required": false, "type": "double"}]}}}]},
    "partition-spec": {"spec-id": 0, "fields": [
        {"source-id": 3, "field-id": 1000, "transform": "day", "name": "sold_day"}]},
    "write-order": {"order-id": 1, "fields": [
        {"source-id": 1, "transform": "identity", "direction": "asc",
         "null-order": "nulls-first"}]},
    "properties": {"format-version": "3", "owner": "analytics",
                   "write.target-file-size-bytes": "134217728"},
    "stage-create": false}' >/dev/null

evolved=$(req GET "$cat/namespaces/$eu/tables/evolved" | jq -r '.metadata."table-uuid"')
ev="s3://warehouse/hard/sales/eu/evolved/metadata"

commit_evolved() {  # updates-json
    req POST "$cat/namespaces/$eu/tables/evolved" "{
        \"identifier\": {\"namespace\": [\"sales\", \"eu\"], \"name\": \"evolved\"},
        \"requirements\": [{\"type\": \"assert-table-uuid\", \"uuid\": \"$evolved\"}],
        \"updates\": $1}" >/dev/null
}

commit_evolved "[
    {\"action\": \"add-snapshot\", \"snapshot\": {
        \"snapshot-id\": 5001, \"sequence-number\": 1, \"timestamp-ms\": $now_ms,
        \"manifest-list\": \"$ev/snap-5001.avro\", \"schema-id\": 0,
        \"first-row-id\": 0, \"added-rows\": 100,
        \"summary\": {\"operation\": \"append\",
            \"added-data-files\": \"4\", \"added-records\": \"100\",
            \"total-data-files\": \"4\", \"total-delete-files\": \"0\",
            \"total-records\": \"100\", \"total-files-size\": \"4096\"}}},
    {\"action\": \"set-snapshot-ref\", \"ref-name\": \"main\",
     \"type\": \"branch\", \"snapshot-id\": 5001}]"

# Schema 1 drops legacy_note, renames qty, and adds two columns with defaults.
commit_evolved '[
    {"action": "add-schema", "last-column-id": 20, "schema": {
        "type": "struct", "schema-id": 1, "fields": [
        {"id": 1, "name": "id", "required": true, "type": "long"},
        {"id": 2, "name": "sku", "required": true, "type": "string"},
        {"id": 3, "name": "sold_at", "required": true, "type": "timestamp"},
        {"id": 4, "name": "sold_on", "required": false, "type": "date"},
        {"id": 5, "name": "opened_at", "required": false, "type": "time"},
        {"id": 6, "name": "ratio", "required": false, "type": "float"},
        {"id": 7, "name": "quantity", "required": false, "type": "int"},
        {"id": 8, "name": "flag", "required": false, "type": "boolean"},
        {"id": 9, "name": "digest", "required": false, "type": "fixed[16]"},
        {"id": 11, "name": "lines", "required": false, "type": {
            "type": "list", "element-id": 12, "element-required": false,
            "element": {"type": "struct", "fields": [
                {"id": 13, "name": "line_no", "required": true, "type": "int"},
                {"id": 14, "name": "note", "required": false, "type": "string",
                 "doc": "Free text"}]}}},
        {"id": 15, "name": "attrs", "required": false, "type": {
            "type": "map", "key-id": 16, "key": "string",
            "value-id": 17, "value-required": false,
            "value": {"type": "struct", "fields": [
                {"id": 18, "name": "v", "required": false, "type": "double"}]}}},
        {"id": 19, "name": "region", "required": true, "type": "string",
         "initial-default": "eu", "write-default": "eu"},
        {"id": 20, "name": "priority", "required": false, "type": "int",
         "initial-default": 0, "write-default": 1}]}},
    {"action": "set-current-schema", "schema-id": -1}]'

commit_evolved '[
    {"action": "add-spec", "spec": {"spec-id": 1, "fields": [
        {"source-id": 1, "field-id": 1001, "transform": "bucket[16]", "name": "id_bucket"},
        {"source-id": 2, "field-id": 1002, "transform": "truncate[4]", "name": "sku_prefix"},
        {"source-id": 3, "field-id": 1003, "transform": "month", "name": "sold_month"}]}},
    {"action": "set-default-spec", "spec-id": -1}]'

commit_evolved '[
    {"action": "add-sort-order", "sort-order": {"order-id": 2, "fields": [
        {"source-id": 3, "transform": "identity", "direction": "desc",
         "null-order": "nulls-last"},
        {"source-id": 2, "transform": "identity", "direction": "asc",
         "null-order": "nulls-first"}]}},
    {"action": "set-default-sort-order", "sort-order-id": -1}]'

commit_evolved "[
    {\"action\": \"add-snapshot\", \"snapshot\": {
        \"snapshot-id\": 5002, \"parent-snapshot-id\": 5001, \"sequence-number\": 2,
        \"timestamp-ms\": $(( now_ms + 1000 )), \"manifest-list\": \"$ev/snap-5002.avro\",
        \"schema-id\": 1, \"first-row-id\": 100, \"added-rows\": 40,
        \"summary\": {\"operation\": \"overwrite\",
            \"added-data-files\": \"2\", \"deleted-data-files\": \"1\",
            \"added-records\": \"40\", \"deleted-records\": \"25\",
            \"removed-files-size\": \"1024\", \"added-files-size\": \"2048\",
            \"total-data-files\": \"5\", \"total-delete-files\": \"0\",
            \"total-records\": \"115\", \"total-files-size\": \"5120\"}}},
    {\"action\": \"set-snapshot-ref\", \"ref-name\": \"main\",
     \"type\": \"branch\", \"snapshot-id\": 5002}]"

commit_evolved "[
    {\"action\": \"add-snapshot\", \"snapshot\": {
        \"snapshot-id\": 5003, \"parent-snapshot-id\": 5002, \"sequence-number\": 3,
        \"timestamp-ms\": $(( now_ms + 2000 )), \"manifest-list\": \"$ev/snap-5003.avro\",
        \"schema-id\": 1, \"first-row-id\": 140, \"added-rows\": 0,
        \"summary\": {\"operation\": \"delete\",
            \"added-delete-files\": \"1\", \"added-position-deletes\": \"5\",
            \"deleted-records\": \"5\", \"total-data-files\": \"5\",
            \"total-delete-files\": \"1\", \"total-records\": \"110\",
            \"total-files-size\": \"5376\"}}},
    {\"action\": \"set-snapshot-ref\", \"ref-name\": \"main\",
     \"type\": \"branch\", \"snapshot-id\": 5003}]"

commit_evolved '[{"action": "remove-snapshots", "snapshot-ids": [5001]}]'

commit_evolved '[
    {"action": "set-properties", "updates": {"owner": "platform", "comment": "has a history"}},
    {"action": "remove-properties", "removals": ["write.target-file-size-bytes"]}]'

# --- views ------------------------------------------------------------------
req POST "$cat/namespaces/$eu/views" "{
    \"name\": \"eu_orders\",
    \"schema\": {\"type\": \"struct\", \"schema-id\": 0, \"fields\": [
        {\"id\": 1, \"name\": \"order_id\", \"required\": true, \"type\": \"long\"},
        {\"id\": 2, \"name\": \"amount\", \"required\": false, \"type\": \"decimal(12, 2)\"}]},
    \"view-version\": {
        \"version-id\": 1, \"schema-id\": 0, \"timestamp-ms\": $now_ms,
        \"summary\": {\"engine-name\": \"fixture\"},
        \"representations\": [
            {\"type\": \"sql\", \"sql\": \"SELECT order_id, amount FROM orders\",
             \"dialect\": \"spark\"},
            {\"type\": \"sql\", \"sql\": \"SELECT order_id, amount FROM orders\",
             \"dialect\": \"trino\"}],
        \"default-namespace\": [\"sales\", \"eu\"]},
    \"properties\": {\"owner\": \"analytics\"}}" >/dev/null

# A second version, so the version log has more than one entry.
req POST "$cat/namespaces/$eu/views/eu_orders" "{
    \"requirements\": [],
    \"updates\": [
        {\"action\": \"add-schema\", \"schema\": {
            \"type\": \"struct\", \"schema-id\": 1, \"fields\": [
                {\"id\": 1, \"name\": \"order_id\", \"required\": true, \"type\": \"long\"}]}},
        {\"action\": \"add-view-version\", \"view-version\": {
            \"version-id\": 2, \"schema-id\": 1, \"timestamp-ms\": $now_ms,
            \"summary\": {\"engine-name\": \"fixture\"},
            \"representations\": [
                {\"type\": \"sql\", \"sql\": \"SELECT order_id FROM orders\",
                 \"dialect\": \"spark\"},
                {\"type\": \"sql\", \"sql\": \"SELECT order_id FROM orders\",
                 \"dialect\": \"trino\"}],
            \"default-namespace\": [\"sales\", \"eu\"]}},
        {\"action\": \"set-current-view-version\", \"view-version-id\": 2}]}" >/dev/null

req POST "$cat/namespaces/$eu/views" "{
    \"name\": \"eu_orders_cat\",
    \"schema\": {\"type\": \"struct\", \"schema-id\": 0, \"fields\": [
        {\"id\": 1, \"name\": \"order_id\", \"required\": true, \"type\": \"long\"}]},
    \"view-version\": {
        \"version-id\": 1, \"schema-id\": 0, \"timestamp-ms\": $now_ms,
        \"summary\": {\"engine-name\": \"fixture\"},
        \"representations\": [
            {\"type\": \"sql\", \"sql\": \"SELECT order_id FROM prod.sales.eu.orders\",
             \"dialect\": \"spark\"}],
        \"default-catalog\": \"prod\",
        \"default-namespace\": [\"sales\", \"eu\"]},
    \"properties\": {}}" >/dev/null

# --- generic tables ---------------------------------------------------------
gt=$base/lakekeeper/v1/$wh_hard
req POST "$gt/namespaces/logs/generic-tables" '{
    "name": "delta_events", "format": "delta",
    "doc": "Delta table registered alongside the Iceberg tables",
    "base-location": "s3://warehouse/hard/logs/delta_events",
    "properties": {"owner": "platform"},
    "schema": {"columns": [{"name": "event_id", "type": "string"}]}}' >/dev/null

# --- tags -------------------------------------------------------------------
pii=$(req POST "$mgmt/tag-definition" '{"name": "pii", "value-kind": "marker",
    "description": "Carries personally identifiable information",
    "scope": ["warehouse", "namespace", "table", "view", "generic-table", "column"]}' \
    | jq -r .id)
req POST "$mgmt/tag-definition" '{"name": "owner", "value-kind": "free-text",
    "scope": ["warehouse", "namespace", "table", "view", "generic-table", "column"]}' >/dev/null
req POST "$mgmt/tag-definition" '{"name": "tier", "value-kind": "enumerated",
    "allowed-values": ["bronze", "silver", "gold"],
    "scope": ["warehouse", "namespace", "table", "view", "generic-table", "column"]}' >/dev/null

eu_view=$(req GET "$cat/namespaces/$eu/views/eu_orders" | jq -r '.metadata."view-uuid"')
delta=$(req GET "$gt/namespaces/logs/generic-tables" | jq -r '.identifiers[] | select(.name == "delta_events") | .id')
sales_eu=$(req GET "$cat/namespaces/$eu" | jq -r '.properties.namespace_id')

req PUT "$mgmt/warehouse/$wh_hard/tags/owner" '{"value": "platform"}' >/dev/null
req PUT "$mgmt/warehouse/$wh_hard/namespace/$sales_eu/tags/tier" '{"value": "gold"}' >/dev/null
req PUT "$mgmt/warehouse/$wh_hard/table/$orders/tags/pii" '{}' >/dev/null
req PUT "$mgmt/warehouse/$wh_hard/view/$eu_view/tags/tier" '{"value": "silver"}' >/dev/null
req PUT "$mgmt/warehouse/$wh_hard/generic-table/$delta/tags/owner" '{"value": "platform"}' >/dev/null
req PUT "$mgmt/warehouse/$wh_hard/table/$orders/column/customer.display_name/tags/pii" '{}' >/dev/null

# --- grants -----------------------------------------------------------------
grant() {  # url privilege principal-json
    req POST "$1" "{\"writes\": [{\"privilege\": \"$2\", \"principal\": $3}]}" >/dev/null
}
alice='{"user": "oidc~alice"}'
team="{\"role\": \"$analysts\"}"

grant "$mgmt/server/grants" list_users "$alice"
grant "$mgmt/project/grants" create_warehouse "$team"
grant "$mgmt/warehouse/$wh_hard/grants" use "$team"
grant "$mgmt/warehouse/$wh_hard/namespace/$sales_eu/grants" get_metadata "$alice"
grant "$mgmt/warehouse/$wh_hard/table/$orders/grants" read_data "$alice"
grant "$mgmt/warehouse/$wh_hard/view/$eu_view/grants" select "$team"
grant "$mgmt/warehouse/$wh_hard/generic-table/$delta/grants" read_data "$team"
grant "$mgmt/tag-definition/$pii/grants" apply "$team"

# --- captured REST responses ------------------------------------------------
capture warehouse_list "$mgmt/warehouse?project-id=$default_project"
capture namespace_list "$cat/namespaces"
capture table_list "$cat/namespaces/$eu/tables"
capture view_list "$cat/namespaces/$eu/views"
capture generic_table_list "$gt/namespaces/logs/generic-tables"
capture role_list "$mgmt/role"
capture user_list "$mgmt/user"
capture tag_definition_list "$mgmt/tag-definition"
capture grant_list "$mgmt/warehouse/$wh_hard/grants"
capture load_table_orders "$cat/namespaces/$eu/tables/orders"
capture load_table_events "$cat/namespaces/logs/tables/events"
capture load_table_orders_v3 "$cat/namespaces/$eu/tables/orders_v3"
capture load_table_legacy_v1 "$cat/namespaces/logs/tables/legacy_v1"
capture load_table_evolved "$cat/namespaces/$eu/tables/evolved"
capture load_view_eu_orders_cat "$cat/namespaces/$eu/views/eu_orders_cat"
capture load_view_eu_orders "$cat/namespaces/$eu/views/eu_orders"

printf 'populated: warehouses %s %s %s, project %s\n' "$wh_hard" "$wh_soft" "$wh_off" "$finance"
