/*Sales department is making a recommendation that frozen products should be placed next to bakery products. Write 1-2 SQL queries to get the data that would support/oppose this recommendation. */
--Query to find orders containing both frozen and bakery products 
SELECT COUNT(DISTINCT op.order_id) AS orders_with_both 
FROM order_products op 
JOIN products p ON op.product_id = p.product_id 
JOIN aisles a ON p.aisle_id = a.aisle_id 
WHERE a.aisle = 'frozen' 
AND op.order_id IN ( 
    SELECT op2.order_id 
    FROM order_products op2 
    JOIN products p2 ON op2.product_id = p2.product_id 
    JOIN aisles a2 ON p2.aisle_id = a2.aisle_id 
    WHERE a2.aisle = 'bakery' 
); 
--Query to find total orders for context 
SELECT COUNT(DISTINCT order_id) AS total_orders 
FROM orders; 
