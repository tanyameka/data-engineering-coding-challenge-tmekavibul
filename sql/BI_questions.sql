--Total Revenue by Month - Show total revenue for each month in 2024
SELECT
    year_month,
    SUM(revenue) AS total_revenue
FROM fact_orders
WHERE year = 2024
GROUP BY year_month
ORDER BY year_month;

--Top 5 Customers by Revenue - Which customers have spent the most?
SELECT
    customer_id,
    first_name,
    last_name,
    SUM(revenue) AS total_revenue
FROM fact_orders
GROUP BY customer_id, first_name, last_name
ORDER BY total_revenue DESC
LIMIT 5;

--Product Performance - List products with their total quantity sold and revenue, ordered by revenue
SELECT
    product_id,
    product_name,
    SUM(quantity) AS total_quantity_sold,
    SUM(revenue) AS total_revenue
FROM fact_orders
GROUP BY product_id, product_name
ORDER BY total_revenue DESC;

--Order Status Analysis - Show count and total value of orders by status (completed, pending, cancelled, shipped)
SELECT
    status,
    COUNT(DISTINCT order_id) AS order_count,
    SUM(revenue) AS total_order_value
FROM fact_orders
GROUP BY status
ORDER BY order_count DESC;
