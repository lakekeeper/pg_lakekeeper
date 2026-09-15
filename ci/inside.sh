#!/bin/sh
# Build, install and test inside a container that is already running the server.
# Invoked by ci/test.sh; not meant to be run on a developer machine.
set -eu

export PGUSER=postgres
cp -r /src /work
cd /work

make
make install

echo '--- installs into a database Lakekeeper has never touched ---'
dropdb --if-exists pgl_empty
createdb pgl_empty
psql -v ON_ERROR_STOP=1 -d pgl_empty -c 'CREATE EXTENSION pg_lakekeeper'

echo '--- regression suite ---'
dropdb --if-exists contrib_regression
createdb contrib_regression
if [ -n "${LAKEKEEPER_SCHEMA:-}" ]; then
    psql -v ON_ERROR_STOP=1 -d contrib_regression \
        -c "ALTER DATABASE contrib_regression SET pg_lakekeeper.lakekeeper_schema = '$LAKEKEEPER_SCHEMA'"
fi
for f in test/fixture/schema.sql test/fixture/data.sql; do
    [ -f "$f" ] && psql -v ON_ERROR_STOP=1 -q -d contrib_regression -f "$f"
done
psql -v ON_ERROR_STOP=1 -d contrib_regression -c 'CREATE EXTENSION pg_lakekeeper'
psql -v ON_ERROR_STOP=1 -q -d contrib_regression -f test/helper/pgl_test.sql
for f in test/fixture/api/*.json; do
    [ -f "$f" ] || continue
    name=$(basename "$f" .json)
    {
        printf "INSERT INTO pgl_test.api VALUES ('%s', \$json\$" "$name"
        cat "$f"
        printf "\$json\$::jsonb);\n"
    } | psql -v ON_ERROR_STOP=1 -q -d contrib_regression -f -
done

if ! make installcheck; then
    [ -f test/regression.diffs ] && cat test/regression.diffs
    exit 1
fi
