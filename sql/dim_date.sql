CREATE OR REPLACE TABLE dim_date AS
SELECT DISTINCT
    order_date,
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    EXTRACT(DAY FROM order_date) AS day,
    TO_CHAR(order_date, 'YYYY-MM') AS year_month
FROM clean_order;
