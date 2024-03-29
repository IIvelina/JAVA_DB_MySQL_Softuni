DELIMITER $$

CREATE PROCEDURE usp_get_holders_with_balance_higher_than(money DECIMAL(12,4))
BEGIN
    SELECT ah.first_name, ah.last_name
    FROM account_holders AS ah
    LEFT JOIN accounts AS a ON ah.id = a.account_holder_id
    GROUP BY ah.id, ah.first_name, ah.last_name
    HAVING SUM(a.balance) > money
    ORDER BY ah.id ASC;
END$$

DELIMITER ;