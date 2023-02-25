select * from shopapp.products

-- UPDATE shopapp.products
-- set Name ='Samsung s7',Price = 3000
-- where Id=1

-- set SQL_SAFE_UPDATES=0;
-- UPDATE shopapp.products set Price= Price+1000

UPDATE shopapp.products 
set ImageUrl= 'noproduct.jpg'
WHERE ImageUrl is NULL
