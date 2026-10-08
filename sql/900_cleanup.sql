-- The views run as the caller, so reading one still requires the caller's own
-- privileges on Lakekeeper's tables.
GRANT USAGE ON SCHEMA @extschema@ TO PUBLIC;
GRANT SELECT ON ALL TABLES IN SCHEMA @extschema@ TO PUBLIC;

-- _define() has done its work; nothing outside installation may call it.
DROP FUNCTION @extschema@._define(text);
