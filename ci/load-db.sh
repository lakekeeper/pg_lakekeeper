#!/bin/sh
# Creates a test database holding Lakekeeper's fixture schema, this extension
# and the assertion helpers. Runs inside the test container.
#
# LAKEKEEPER_SCHEMA, when set, moves the fixture into that schema, so the run
# exercises a deployment where Lakekeeper's tables are not in public.
set -eu

db=${1:?usage: load-db.sh <database>}

dropdb --if-exists "$db"
createdb "$db"

for f in test/fixture/schema.sql test/fixture/data.sql; do
    [ -f "$f" ] && psql -v ON_ERROR_STOP=1 -q -d "$db" -f "$f"
done

if [ -n "${LAKEKEEPER_SCHEMA:-}" ]; then
    psql -v ON_ERROR_STOP=1 -q -d "$db" \
        -c "ALTER SCHEMA public RENAME TO \"$LAKEKEEPER_SCHEMA\"" \
        -c "CREATE SCHEMA public"
fi

psql -v ON_ERROR_STOP=1 -d "$db" -c 'CREATE EXTENSION pg_lakekeeper'
psql -v ON_ERROR_STOP=1 -q -d "$db" -f test/helper/pgl_test.sql

for f in test/fixture/api/*.json; do
    [ -f "$f" ] || continue
    name=$(basename "$f" .json)
    {
        printf "INSERT INTO pgl_test.api VALUES ('%s', \$json\$" "$name"
        cat "$f"
        printf "\$json\$::jsonb);\n"
    } | psql -v ON_ERROR_STOP=1 -q -d "$db" -f -
done
