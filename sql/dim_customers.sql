CREATE OR REPLACE TABLE dim_customers AS
SELECT DISTINCT
    customer_id AS customer_id,
    INITCAP(first_name) AS first_name,
    INITCAP(last_name) AS last_name,
    LOWER(NULLIF(email, 'NULL')) AS email,
    REGEXP_REPLACE(phone, '[^0-9]', '') AS phone,
    COALESCE(
        TRY_TO_DATE(registration_date),
        TRY_TO_DATE(registration_date, 'Mon DD YYYY'),
        TRY_TO_DATE(registration_date, 'YYYY/MM/DD')
    ) AS registration_date,
    STREET,
    CITY,
    STATE,
    ZIP,
    LOYALTY_STATUS
FROM SOURCES.TEST_DATA.CUSTOMERS



-- SELECT * FROM dim_customers

-- SELECT CUSTOMER_ID, COUNT(*) FROM 
-- dim_customers
-- GROUP BY 
-- CUSTOMER_ID
-- HAVING COUNT(*) > 1
