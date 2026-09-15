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
robots=$(req POST "$mgmt/role" '{"name": "robots",
    "provider-id": "oidc", "source-id": "group-robots"}' | jq -r .id)

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
owner=$(req POST "$mgmt/tag-definition" '{"name": "owner", "value-kind": "free-text",
    "scope": ["warehouse", "namespace", "table", "view", "generic-table", "column"]}' \
    | jq -r .id)
tier=$(req POST "$mgmt/tag-definition" '{"name": "tier", "value-kind": "enumerated",
    "allowed-values": ["bronze", "silver", "gold"],
    "scope": ["warehouse", "namespace", "table", "view", "generic-table", "column"]}' \
    | jq -r .id)

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
capture load_view_eu_orders "$cat/namespaces/$eu/views/eu_orders"

printf 'populated: warehouses %s %s %s, project %s\n' "$wh_hard" "$wh_soft" "$wh_off" "$finance"
