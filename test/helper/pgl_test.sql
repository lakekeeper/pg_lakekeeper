-- Assertions for the pg_regress suite. Loaded into the test database before
-- the first test file runs.
CREATE SCHEMA IF NOT EXISTS pgl_test;

CREATE OR REPLACE FUNCTION pgl_test.ok(cond boolean, msg text) RETURNS void
LANGUAGE plpgsql AS $$
BEGIN
    IF cond IS NOT TRUE THEN
        RAISE EXCEPTION 'ASSERTION FAILED: %', msg;
    END IF;
END
$$;

COMMENT ON FUNCTION pgl_test.ok(boolean, text) IS
    'Raises when the condition is not true, naming the assertion in the diff.';

CREATE OR REPLACE FUNCTION pgl_test.inlined(query text) RETURNS void
LANGUAGE plpgsql AS $$
DECLARE
    line text;
BEGIN
    FOR line IN EXECUTE 'EXPLAIN (COSTS OFF, VERBOSE) ' || query LOOP
        IF line ~ 'Function Scan on lakekeeper\._' THEN
            RAISE EXCEPTION 'NOT INLINED: %', query;
        END IF;
    END LOOP;
END
$$;

COMMENT ON FUNCTION pgl_test.inlined(text) IS
    'Raises when the planner did not inline the function behind a view.';

CREATE TABLE IF NOT EXISTS pgl_test.api (name text PRIMARY KEY, body jsonb NOT NULL);

COMMENT ON TABLE pgl_test.api IS
    'REST responses captured from the upstream build the fixture was generated on.';

CREATE OR REPLACE FUNCTION pgl_test.json_canonical(j jsonb) RETURNS jsonb
LANGUAGE plpgsql IMMUTABLE AS $$
DECLARE
    out jsonb;
BEGIN
    IF jsonb_typeof(j) = 'array' THEN
        SELECT coalesce(jsonb_agg(e ORDER BY e::text), '[]'::jsonb) INTO out
        FROM (SELECT pgl_test.json_canonical(x) AS e FROM jsonb_array_elements(j) x) s;
        RETURN out;
    ELSIF jsonb_typeof(j) = 'object' THEN
        SELECT coalesce(jsonb_object_agg(k, pgl_test.json_canonical(v)), '{}'::jsonb) INTO out
        FROM jsonb_each(j) AS e(k, v);
        RETURN out;
    END IF;
    RETURN j;
END
$$;

COMMENT ON FUNCTION pgl_test.json_canonical(jsonb) IS
    'Sorts every array in a document, so two documents compare equal when they differ only in array order.';

GRANT USAGE ON SCHEMA pgl_test TO PUBLIC;
