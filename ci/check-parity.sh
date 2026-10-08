#!/bin/sh
# Every step the workflow runs must be a script in ci/, so a local run and a CI
# run cannot drift apart.
set -eu

root=$(CDPATH='' cd -- "$(dirname -- "$0")/.." && pwd)
workflow=$root/.github/workflows/ci.yml

stray=$(grep -nE '^\s*(-\s*)?run:' "$workflow" \
    | grep -vE 'run:\s*(ci/[a-z-]+\.sh|true)\b' || true)

if [ -n "$stray" ]; then
    printf 'workflow step is not a ci/ script:\n%s\n' "$stray" >&2
    exit 1
fi

echo 'parity ok'
