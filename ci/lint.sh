#!/bin/sh
# Static checks: shell scripts, and relation qualification in the SQL.
set -eu

root=$(CDPATH='' cd -- "$(dirname -- "$0")/.." && pwd)
cd "$root"

echo '--- shellcheck ---'
docker run --rm -v "$root:/mnt:ro" -w /mnt koalaman/shellcheck-alpine:v0.10.0 \
    shellcheck -x ci/*.sh tools/*.sh tools/fixture/*.sh

# Every relation an installed definition names must be qualified, so nothing
# resolves through the caller's search_path.
echo '--- relation qualification ---'
unqualified=$(grep -nE '\b(FROM|JOIN)[[:space:]]+[a-zA-Z_"]' sql/*.sql \
    | grep -vE '\b(FROM|JOIN)[[:space:]]+(@lk@|@extschema@|pg_catalog)\.' \
    | grep -vE '\bJOIN[[:space:]]+LATERAL\b' \
    | grep -vE 'DISTINCT[[:space:]]+FROM' \
    | grep -vE '^[^:]*:[0-9]+:[[:space:]]*--' || true)

if [ -n "$unqualified" ]; then
    printf 'unqualified relation reference:\n%s\n' "$unqualified" >&2
    exit 1
fi

echo 'lint ok'
