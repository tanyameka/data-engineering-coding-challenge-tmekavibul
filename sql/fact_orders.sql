CREATE OR REPLACE TABLE fact_orders AS
SELECT 
    o.order_id,
    o.customer_id,
    o.status,
    o.payment_method,
    o.order_date,
    o.order_total,
    c.first_name,
    c.last_name,
    d.year,
    d.month,
    d.day,
    d.year_month,
    p.product_name,
    p.category,
    p.supplier_id,
    oi.order_item_id,
    oi.product_id,
    oi.quantity,
    oi.unit_price,
    oi.discount_percent,
    ROUND((oi.quantity * oi.unit_price * (1 - oi.discount_percent/100)),2) AS revenue
FROM clean_order o
JOIN clean_order_items oi
    ON o.order_id = oi.order_id
JOIN dim_products p
    ON oi.product_id = p.product_id
JOIN dim_customers c
    ON o.customer_id = c.customer_id
LEFT JOIN dim_date d
    ON o.order_date = d.order_date;
