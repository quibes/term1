
DROP TABLE IF EXISTS materialized_data_mart_sales_by_category;
DROP TABLE IF EXISTS materialized_data_mart_customer_analytics;


CREATE TABLE materialized_data_mart_sales_by_category AS
SELECT 
    product_category_name,
    COUNT(order_id) AS total_orders,
    SUM(price) AS total_revenue
FROM 
    basic_sales_analytics
GROUP BY 
    product_category_name;


CREATE TABLE materialized_data_mart_customer_analytics AS
SELECT 
    customer_unique_id,
    COUNT(DISTINCT order_id) AS order_count,
    SUM(total_order_value) AS total_spent
FROM 
    basic_sales_analytics
GROUP BY 
    customer_unique_id
HAVING 
    order_count > 1;
