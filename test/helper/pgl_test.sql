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
