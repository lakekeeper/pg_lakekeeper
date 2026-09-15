-- Reading a view takes the caller's privileges on Lakekeeper's tables, not the
-- extension owner's.

CREATE ROLE pgl_reader;

SET ROLE pgl_reader;
SELECT count(*) FROM lakekeeper.warehouse;
RESET ROLE;

DO $$
DECLARE
    src text := (SELECT lakekeeper_schema FROM lakekeeper.info);
BEGIN
    EXECUTE format('GRANT USAGE ON SCHEMA %I TO pgl_reader', src);
    EXECUTE format('GRANT SELECT ON %I.warehouse TO pgl_reader', src);
END $$;

SET ROLE pgl_reader;

SELECT pgl_test.ok(
    (SELECT count(*) FROM lakekeeper.warehouse) = 3,
    'a role granted the upstream table reads the view');

SELECT count(*) FROM lakekeeper.namespace;

RESET ROLE;
DROP OWNED BY pgl_reader;
DROP ROLE pgl_reader;
