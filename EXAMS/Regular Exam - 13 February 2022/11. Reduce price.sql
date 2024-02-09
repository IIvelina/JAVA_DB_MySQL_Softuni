DELIMITER //

CREATE PROCEDURE udp_reduce_price(
    IN category_name VARCHAR(50)
)
BEGIN
    DECLARE category_id_val INT;
    SELECT id INTO category_id_val FROM categories WHERE name = category_name;
    UPDATE products
    SET price = price * 0.7 
    WHERE category_id = category_id_val 
    AND review_id IN (
        SELECT id FROM reviews WHERE rating < 4
    );
END //

DELIMITER ;
