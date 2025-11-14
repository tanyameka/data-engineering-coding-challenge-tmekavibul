CREATE OR REPLACE TABLE clean_order AS
SELECT DISTINCT
    c1 AS order_id,
    c2 AS customer_id,
    COALESCE(
        TRY_TO_DATE(c3),
        TRY_TO_DATE(c3, 'Mon DD YYYY'),
        TRY_TO_DATE(c3, 'YYYY/MM/DD'),
        TRY_TO_DATE(c3, 'MM-DD-YYYY')
    ) AS ORDER_DATE, 
    COALESCE(NULLIF(c4, 'NULL'),0)::float AS order_total,
    COALESCE(c5,'UNKNOWN') AS status,
    c6 AS payment_method
FROM SOURCES.TEST_DATA.ORDERS
WHERE c1 <> 'order_id';


-- select * from clean_order

-- SELECT order_id, COUNT(*) FROM 
-- clean_order
-- GROUP BY 
-- order_id
-- HAVING COUNT(*) > 1
