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

echo '--- standalone script, for a server that cannot install an extension ---'
make standalone
dropdb --if-exists pgl_standalone
createdb pgl_standalone
psql -v ON_ERROR_STOP=1 -q -d pgl_standalone -f test/fixture/schema.sql
psql -v ON_ERROR_STOP=1 -q -d pgl_standalone -f test/fixture/data.sql
psql -v ON_ERROR_STOP=1 -q -d pgl_standalone -f pg_lakekeeper-standalone.sql
psql -v ON_ERROR_STOP=1 -d pgl_standalone -c 'SELECT count(*) FROM lakekeeper.warehouse'

echo '--- regression suite ---'
ci/load-db.sh contrib_regression

if ! make installcheck; then
    [ -f test/regression.diffs ] && cat test/regression.diffs
    exit 1
fi
