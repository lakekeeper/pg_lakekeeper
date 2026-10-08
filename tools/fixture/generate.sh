#!/bin/sh
# Regenerates test/fixture from the pinned upstream image.
#
# Requires: docker, curl, jq.
set -eu

root=$(CDPATH='' cd -- "$(dirname -- "$0")/../.." && pwd)
env_file=$root/tools/fixture/upstream.env
# shellcheck source=tools/fixture/upstream.env
. "$env_file"

compose="docker compose -f $root/tools/fixture/docker-compose.yaml --env-file $env_file"
fixture=$root/test/fixture

$compose down -v --remove-orphans
$compose up -d --wait --quiet-pull lakekeeper

rm -rf "$fixture"
mkdir -p "$fixture"

LAKEKEEPER_URL=http://127.0.0.1:${FIXTURE_LK_PORT:-58181} \
    "$root/tools/fixture/populate.sh" "$fixture"

dump() {
    $compose exec -T db pg_dump -U postgres -d postgres \
        --no-owner --no-privileges --quote-all-identifiers "$@"
}

dump --schema-only > "$fixture/schema.sql"
dump --data-only --column-inserts --disable-triggers > "$fixture/data.sql"

printf '%s\n' "$LAKEKEEPER_IMAGE" "$LAKEKEEPER_DIGEST" > "$fixture/UPSTREAM"

$compose down -v

wc -l "$fixture/schema.sql" "$fixture/data.sql"
