DROP PROCEDURE IF EXISTS populate_basic_sales_analytics;

DELIMITER //

CREATE PROCEDURE populate_basic_sales_analytics()
BEGIN
    INSERT INTO basic_sales_analytics (
        order_id,
        customer_id,
        customer_unique_id,
        product_id,
        product_category_name,
        price,
        total_order_value,
        total_items_in_order,
        order_item_id
    )
    SELECT 
        o.order_id,
        o.customer_id,
        c.customer_unique_id,
        oi.product_id,
        p.product_category_name,
        oi.price,
        -- Calculate the total order value for each order
        (SELECT SUM(price) FROM order_items WHERE order_id = o.order_id) AS total_order_value,
        -- Count the total items in each order
        (SELECT COUNT(order_item_id) FROM order_items WHERE order_id = o.order_id) AS total_items_in_order,
        oi.order_item_id
    FROM orders AS o
    JOIN order_items AS oi ON o.order_id = oi.order_id
    JOIN customers AS c ON o.customer_id = c.customer_id
    JOIN products AS p ON oi.product_id = p.product_id
    ON DUPLICATE KEY UPDATE
        customer_unique_id = VALUES(customer_unique_id),
        product_category_name = VALUES(product_category_name),
        price = VALUES(price),
        total_order_value = VALUES(total_order_value),
        total_items_in_order = VALUES(total_items_in_order);
END //

DELIMITER ;


DELIMITER ;
CALL populate_basic_sales_analytics();


DELIMITER //

CREATE TRIGGER after_order_items_insert
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    CALL populate_basic_sales_analytics();
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER after_orders_insert
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    CALL populate_basic_sales_analytics();
END //

DELIMITER ;


