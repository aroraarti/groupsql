/*Query5*/

SELECT p.product_id, p.product_name, sum(op.reordered) as total_reordered
from products p
left join order_products op on p.product_id = op.product_id
GROUP by p.product_id, p.product_name
order by total_reordered DESC
limit 5

/*query6*/

SELECT p.product_id, p.product_name, count(*) as order_count
from order_products
join products p on p.product_id = p.product_id
GROUP by p.product_id, p.product_names
order by order_count DESC
limit 3
