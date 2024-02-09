SELECT CONCAT(first_name, ' ', last_name) AS full_name,
       address,
       order_datetime
FROM customers
JOIN orders ON customers.id = orders.customer_id
WHERE YEAR(order_datetime) <= 2018
ORDER BY full_name DESC;