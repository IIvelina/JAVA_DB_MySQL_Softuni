SELECT p.id AS product_id,
       p.name AS product_name,
       COUNT(op.product_id) AS count
FROM orders_products op
JOIN products p ON op.product_id = p.id
GROUP BY p.id, p.name
HAVING COUNT(op.product_id) >= 5
ORDER BY count DESC, product_name ASC;