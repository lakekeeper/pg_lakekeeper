-- Each detail view against the matching section of the document the catalog
-- serves, for every table and view whose response is captured. The views and
-- the document functions read the same upstream rows through different
-- expressions, so this checks the views, not the functions.

SELECT 'sales.eu.orders' AS tabular, * FROM pgl_test.table_parity('sales.eu.orders', 'load_table_orders')
UNION ALL
SELECT 'logs.events', * FROM pgl_test.table_parity('logs.events', 'load_table_events')
UNION ALL
SELECT 'sales.eu.orders_v3', * FROM pgl_test.table_parity('sales.eu.orders_v3', 'load_table_orders_v3')
UNION ALL
SELECT 'sales.eu.evolved', * FROM pgl_test.table_parity('sales.eu.evolved', 'load_table_evolved')
ORDER BY 1, 2;

SELECT pgl_test.ok(
    (SELECT bool_and(matches) FROM (
        SELECT matches FROM pgl_test.table_parity('sales.eu.orders', 'load_table_orders')
        UNION ALL SELECT matches FROM pgl_test.table_parity('logs.events', 'load_table_events')
        UNION ALL SELECT matches FROM pgl_test.table_parity('sales.eu.orders_v3', 'load_table_orders_v3')
        UNION ALL SELECT matches FROM pgl_test.table_parity('sales.eu.evolved', 'load_table_evolved')) x),
    'every table detail view matches the section of the document the catalog serves');

SELECT 'sales.eu.eu_orders' AS view, * FROM pgl_test.view_parity('sales.eu.eu_orders', 'load_view_eu_orders')
UNION ALL
SELECT 'sales.eu.eu_orders_cat', * FROM pgl_test.view_parity('sales.eu.eu_orders_cat', 'load_view_eu_orders_cat')
ORDER BY 1, 2;

SELECT pgl_test.ok(
    (SELECT bool_and(matches) FROM (
        SELECT matches FROM pgl_test.view_parity('sales.eu.eu_orders', 'load_view_eu_orders')
        UNION ALL SELECT matches FROM pgl_test.view_parity('sales.eu.eu_orders_cat', 'load_view_eu_orders_cat')) x),
    'every view detail view matches the section of the document the catalog serves');
