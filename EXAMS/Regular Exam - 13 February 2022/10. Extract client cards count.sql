DELIMITER //
CREATE FUNCTION udf_customer_products_count(customer_first_name VARCHAR(30))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_products_count INT;
    
    SELECT COUNT(op.product_id)
    INTO total_products_count
    FROM customers c
    JOIN orders o ON c.id = o.customer_id
    JOIN orders_products op ON o.id = op.order_id
    WHERE c.first_name = customer_first_name;
    
    RETURN total_products_count;
END ; 