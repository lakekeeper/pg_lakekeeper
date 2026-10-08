#!/bin/sh
# Dumps a database holding Lakekeeper's schema and this extension, restores it
# into an empty one, and runs the suite against the restored copy.
# Invoked by ci/restore-test.sh.
set -eu

export PGUSER=postgres
cp -r /src /work
cd /work

make
make install

ci/load-db.sh pgl_source

# A named-schema deployment carries its binding in a setting the restoring
# session reads at connection time, the same way the server is configured.
if [ -n "${LAKEKEEPER_SCHEMA:-}" ]; then
    psql -v ON_ERROR_STOP=1 -q -d pgl_source \
        -c "ALTER ROLE postgres SET pg_lakekeeper.lakekeeper_schema = '$LAKEKEEPER_SCHEMA'"
fi

echo '--- dump and restore ---'
pg_dump -Fc -d pgl_source -f /tmp/pgl.dump
dropdb --if-exists contrib_regression
createdb contrib_regression
pg_restore --exit-on-error --no-owner -d contrib_regression /tmp/pgl.dump

echo '--- regression suite against the restored database ---'
if ! make installcheck; then
    [ -f test/regression.diffs ] && cat test/regression.diffs
    exit 1
fi
