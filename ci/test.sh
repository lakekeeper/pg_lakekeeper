#!/bin/sh
# Runs the suite against one PostgreSQL major inside a container, so a local run
# and a CI run execute the same steps.
set -eu

pg=${1:-18}
root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
image=pg-lakekeeper-test:$pg
container=pg-lakekeeper-test-$pg

docker build -q -t "$image" --build-arg "PG_MAJOR=$pg" -f "$root/ci/Dockerfile.test" "$root/ci" >/dev/null
docker rm -f "$container" >/dev/null 2>&1 || true
docker run -d --name "$container" -e POSTGRES_PASSWORD=postgres -v "$root:/src:ro" "$image" >/dev/null
trap 'docker rm -f "$container" >/dev/null 2>&1 || true' EXIT INT TERM

waited=0
until docker exec "$container" pg_isready -U postgres -q 2>/dev/null; do
    waited=$((waited + 1))
    if [ "$waited" -ge 60 ]; then
        docker logs "$container" >&2
        echo "ci/test.sh: server did not start" >&2
        exit 1
    fi
    sleep 1
done

status=0
docker exec -e "LAKEKEEPER_SCHEMA=${LAKEKEEPER_SCHEMA:-}" "$container" /src/ci/inside.sh || status=$?

# pg_regress writes its results inside the container; bring them back so a
# failing run can be read, and so expected files can be refreshed from them.
mkdir -p "$root/test/results"
docker cp "$container:/work/test/results/." "$root/test/results/" >/dev/null 2>&1 || true
docker cp "$container:/work/test/regression.diffs" "$root/test/" >/dev/null 2>&1 || true

exit "$status"
