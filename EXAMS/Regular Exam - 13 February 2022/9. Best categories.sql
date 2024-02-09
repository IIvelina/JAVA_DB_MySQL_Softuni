SELECT 
    COUNT(p.id) AS items_count,
    c.name,
    SUM(p.quantity_in_stock) AS total_quantity
FROM 
    categories c
LEFT JOIN 
    products p ON c.id = p.category_id
GROUP BY 
    c.id, c.name
ORDER BY 
    items_count DESC, total_quantity ASC
LIMIT 5;