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
