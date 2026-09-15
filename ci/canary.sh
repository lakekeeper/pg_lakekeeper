#!/bin/sh
# Compares the pinned upstream schema against upstream's current main build.
# A failure means the pin is behind: re-pin and regenerate the fixture.
set -eu

root=$(CDPATH='' cd -- "$(dirname -- "$0")/.." && pwd)
env_file=$root/tools/fixture/upstream.env
# shellcheck source=tools/fixture/upstream.env
. "$env_file"

if [ -n "${CANARY_IMAGE:-}" ]; then
    LAKEKEEPER_IMAGE=$CANARY_IMAGE
else
    # Upstream pushes an image tagged with the short commit on every push to
    # main, so the head commit names the build to compare against.
    sha=$(curl -sSf https://api.github.com/repos/lakekeeper/lakekeeper/commits/main \
          | jq -r '.sha[0:8]')
    LAKEKEEPER_IMAGE=quay.io/lakekeeper/catalog:$sha-amd64
fi
export LAKEKEEPER_IMAGE
printf 'canary: comparing against %s\n' "$LAKEKEEPER_IMAGE"

compose="docker compose -f $root/tools/fixture/docker-compose.yaml --env-file $env_file -p pg-lakekeeper-canary"

$compose down -v --remove-orphans
$compose up -d --wait --quiet-pull db
$compose run --rm --quiet-pull migrate

observed=$($compose exec -T db psql -U postgres -d postgres -Atc \
    "SELECT md5(string_agg(version::text || ':' || encode(checksum, 'hex'), ',' ORDER BY version))
     FROM _sqlx_migrations WHERE success")
latest=$($compose exec -T db psql -U postgres -d postgres -Atc \
    "SELECT max(version) FROM _sqlx_migrations WHERE success")

$compose down -v

pinned=$(grep -oE "'[0-9a-f]{32}'::text" "$root/sql/005_pin.sql" | tr -d "'" | sed 's/::text//')

if [ "$observed" = "$pinned" ]; then
    printf 'canary: upstream main still matches the pin (latest %s)\n' "$latest"
    exit 0
fi

printf 'canary: upstream main has moved\n  pinned   %s\n  upstream %s (latest %s)\n' \
    "$pinned" "$observed" "$latest" >&2
printf 'Run tools/repin.sh and tools/fixture/generate.sh, then refresh the expected files.\n' >&2
exit 1
