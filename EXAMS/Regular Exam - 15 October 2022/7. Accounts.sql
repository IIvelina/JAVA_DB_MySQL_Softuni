SELECT
    CONCAT_WS('', last_name, first_name, LENGTH(first_name), 'Restaurant') AS username,
    REVERSE(SUBSTRING(email FROM 2 FOR 12)) AS password 
FROM 
    waiters 
WHERE 
    salary IS NOT NULL 
ORDER BY 
    password DESC;