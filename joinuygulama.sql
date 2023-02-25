-- hangi üründen kaç tane satılmış ?
select p.id,p.product_name, count(*) adet from products p inner join order_details od
on p.id=od.product_id
group by p.id
order by adet

-- en çok satılan 3 ürün ?
select p.id,p.product_name, sum(od.quantity*od.unit_price) as kazanç from products p inner join order_details od
on p.id=od.product_id
group by p.id
order by kazanç desc
limit 3

-- hangi kargo şirketine ne kadar ödeme yapılmış ?
-- orders ile shipper arasında ilişkilendirme yapılacak
select s.company, sum(o.shipping_fee) as total from orders o inner join shippers s
on s.id = o.shipper_id 
group by s.id









