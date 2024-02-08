SELECT 
    t.id AS table_id,
    t.capacity,
    COUNT(oc.client_id) AS count_clients,
    CASE
        WHEN COUNT(oc.client_id) < t.capacity THEN 'Free seats'
        WHEN COUNT(oc.client_id) = t.capacity THEN 'Full'
        ELSE 'Extra seats'
    END AS availability
FROM 
    tables t
 JOIN 
    orders o ON t.id = o.table_id
 JOIN 
    orders_clients oc ON o.id = oc.order_id
WHERE 
    t.floor = 1
GROUP BY 
    t.id, t.capacity
ORDER BY 
    t.id DESC;