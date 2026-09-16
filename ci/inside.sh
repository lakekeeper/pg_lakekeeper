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

echo '--- refuses a database whose migrations do not match the pin ---'
dropdb --if-exists pgl_drift
createdb pgl_drift
psql -v ON_ERROR_STOP=1 -q -d pgl_drift -f test/fixture/schema.sql
psql -v ON_ERROR_STOP=1 -q -d pgl_drift -f test/fixture/data.sql
psql -v ON_ERROR_STOP=1 -q -d pgl_drift -c \
    "UPDATE _sqlx_migrations SET checksum = '\\x00'::bytea
      WHERE version = (SELECT max(version) FROM _sqlx_migrations)"

if psql -q -d pgl_drift -c 'CREATE EXTENSION pg_lakekeeper' 2>/dev/null; then
    echo 'the version guard installed against a schema it does not match' >&2
    exit 1
fi

psql -v ON_ERROR_STOP=1 -q -d pgl_drift \
    -c 'SET pg_lakekeeper.allow_unsupported_schema = on' \
    -c 'CREATE EXTENSION pg_lakekeeper'
psql -v ON_ERROR_STOP=1 -t -d pgl_drift \
    -c "SELECT status FROM lakekeeper.check_schema() WHERE check_name = 'migration_digest'" \
    | grep -qw error

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
