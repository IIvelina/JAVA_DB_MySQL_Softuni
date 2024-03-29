DELIMITER //
CREATE FUNCTION ufn_count_employees_by_town(town_name VARCHAR(20)) 
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE emp_count INT;
    SET emp_count := (
    SELECT COUNT(e.employee_id) AS count
	FROM employees AS e
	JOIN addresses AS a ON e.address_id = a.address_id
	JOIN towns AS t ON a.town_id = t.town_id
	WHERE t.name = town_name
    );
    RETURN emp_count;
END;    