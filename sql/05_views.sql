DROP VIEW IF EXISTS data_mart_sales_by_category;
CREATE VIEW data_mart_sales_by_category AS
SELECT 
    product_category_name,
    COUNT(order_id) AS total_orders,
    SUM(price) AS total_revenue,
    AVG(total_order_value) AS avg_order_value,
    SUM(price) / (SELECT SUM(price) FROM basic_sales_analytics) * 100 AS category_revenue_percentage
FROM 
    basic_sales_analytics
GROUP BY 
    product_category_name;

DROP VIEW IF EXISTS data_mart_customer_analytics;
CREATE VIEW data_mart_customer_analytics AS
SELECT 
    customer_unique_id,
    COUNT(DISTINCT order_id) AS order_count,
    SUM(total_order_value) AS total_spent,
    AVG(total_order_value) AS avg_order_value_per_customer,
    CASE WHEN COUNT(DISTINCT order_id) > 1 THEN 1 ELSE 0 END AS is_repeat_customer
FROM 
    basic_sales_analytics
GROUP BY 
    customer_unique_id
HAVING 
    order_count > 1;
