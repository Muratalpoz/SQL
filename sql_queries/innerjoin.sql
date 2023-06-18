select o.id order_id,p.product_name,(od.unit_price * od.quantity) total, CONCAT(c.first_name,c.last_name) customername, o.order_date from orders o 
inner join customers c on o.customer_id = c.id
inner join order_details od on od.order_id = o.id
inner join products p on p.id = od.product_id
order by customername

select o.id order_id,sum(od.unit_price * od.quantity) total, CONCAT(c.first_name,c.last_name) customername, o.order_date from orders o 
inner join customers c on o.customer_id = c.id
inner join order_details od on od.order_id = o.id
inner join products p on p.id = od.product_id
group by o.id