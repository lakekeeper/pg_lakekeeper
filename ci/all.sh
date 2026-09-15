#!/bin/sh
# Everything CI runs, in the same order, with the same scripts.
set -eu

root=$(CDPATH='' cd -- "$(dirname -- "$0")/.." && pwd)
cd "$root"

ci/lint.sh
ci/check-parity.sh

for pg in 18 17 15; do
    ci/test.sh "$pg"
done

LAKEKEEPER_SCHEMA=lk_catalog ci/test.sh 18

ci/restore-test.sh 18
LAKEKEEPER_SCHEMA=lk_catalog ci/restore-test.sh 18

echo 'all checks passed'
