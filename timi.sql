SELECT p.product_id, p.product_name, count(op.order_id) as total_orders from order_products 
op
join products p on op.product_id = p.product_id
join aisles a on p.aisle_id = a.aisle_id
where a.aisle = "specialty cheeses"
GROUP by p.product_id, p.product_name
ORDER by total_orders DESC