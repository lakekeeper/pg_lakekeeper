#!/bin/sh
# Runs the dump and restore check against one PostgreSQL major.
set -eu
root=$(CDPATH='' cd -- "$(dirname -- "$0")/.." && pwd)
exec "$root/ci/test.sh" "${1:-18}" /src/ci/restore-inside.sh
