-- join ile update
update employees e inner join employee_performans ep
on e.id = ep.employee_id
set e.email_address = ep.email
where ep.email like '%updated%'

-- join ile delete 
-- siparişi olmayan müşterileri siliniz.

select c.id, c.first_name from customers c left join orders o 
on c.id = o.customer_id
where o.customer_id is null


delete customers 
from customers left join orders
on orders.customer_id = customers.id
where orders.customer_id is null and customers.id=13
