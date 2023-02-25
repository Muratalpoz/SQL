-- union ile çalışma
select email from employee_performans
union all
select email_address from employees

select city,country_region from employees
union all
select city,country_region from customers