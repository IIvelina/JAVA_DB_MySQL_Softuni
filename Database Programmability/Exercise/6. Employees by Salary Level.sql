DELIMITER && 
CREATE FUNCTION ufn_get_salary_level(salary DECIMAL(19, 4))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE salary_level VARCHAR(10);
    IF salary < 30000 THEN SET salary_level := 'Low';
    ELSEIF salary <= 50000 THEN SET salary_level := 'Average';
    ELSE SET salary_level := 'High';
    END IF;
    RETURN salary_level;
END &&  
DELIMITER ;

DELIMITER &&
CREATE PROCEDURE usp_get_employees_by_salary_level(salary_level VARCHAR(10)) 
BEGIN
    SELECT first_name, last_name
    FROM employees AS e
    WHERE ufn_get_salary_level(e.salary) = salary_level
    ORDER BY first_name DESC, last_name DESC;
END &&  
DELIMITER ;
