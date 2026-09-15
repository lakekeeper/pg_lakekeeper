-- The upstream schema this extension was written against. A diff in this file
-- names exactly what changed upstream.

SELECT check_name, status FROM lakekeeper.check_schema() ORDER BY check_name;

SELECT c.relname,
       a.attname,
       replace(format_type(a.atttypid, a.atttypmod),
               (SELECT lakekeeper_schema FROM lakekeeper.info) || '.', '') AS type,
       a.attnotnull AS not_null,
       coalesce(co.collname, '') AS collation
FROM pg_catalog.pg_class c
JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace
JOIN pg_catalog.pg_attribute a ON a.attrelid = c.oid
                              AND a.attnum > 0 AND NOT a.attisdropped
LEFT JOIN pg_catalog.pg_collation co ON co.oid = a.attcollation
                                    AND co.collname <> 'default'
WHERE n.nspname = (SELECT lakekeeper_schema FROM lakekeeper.info)
  AND c.relkind = 'r'
ORDER BY c.relname, a.attnum;

SELECT t.typname, e.enumlabel
FROM pg_catalog.pg_type t
JOIN pg_catalog.pg_enum e ON e.enumtypid = t.oid
JOIN pg_catalog.pg_namespace n ON n.oid = t.typnamespace
WHERE n.nspname = (SELECT lakekeeper_schema FROM lakekeeper.info)
ORDER BY t.typname, e.enumsortorder;
