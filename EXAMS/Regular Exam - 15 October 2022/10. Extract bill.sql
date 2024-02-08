DELIMITER //
CREATE FUNCTION udf_client_bill(full_name VARCHAR(50))  
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
	DECLARE total_bill DECIMAL(10,2);
    SET total_bill := (
    SELECT SUM(p.price)
    FROM clients AS c
    JOIN orders_clients AS oc ON c.id = oc.client_id
    JOIN orders AS o ON oc.order_id = o.id
    JOIN orders_products AS op ON o.id = op.order_id
    JOIN products AS p ON op.product_id = p.id
    WHERE CONCAT(c.first_name, ' ', c.last_name) = full_name
    );
    RETURN total_bill;
END;
DELIMITER;