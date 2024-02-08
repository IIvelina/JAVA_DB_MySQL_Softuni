DELIMITER //
CREATE PROCEDURE udp_happy_hour (type VARCHAR(50))
BEGIN
	UPDATE products  p
    SET p.price = p.price - (p.price * 0.2) 
    WHERE p.type = type AND p.price >= 10;
END;
