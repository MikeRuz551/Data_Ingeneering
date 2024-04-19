select*from products p

select product_name, unit_price * (units_in_stock + units_on_order) / 7 from products p

select product_name, unit_price * (units_in_stock + units_on_order) as expexted_revenue from products p

select product_name, unit_price from products p where unit_price > 20 and unit_price < 30

select product_name, unit_price from products p where unit_price >= 20 and unit_price <= 30

select product_name, unit_price from products p where unit_price between 20 and 30 

select * from products p where unit_price between 20 and 30 and units_in_stock > 50 and category_id = 2

select * from products p where (unit_price between 20 and 30 and supplier_id = 2) or (units_in_stock > 100 and supplier_id = 3)

select * from products p where (unit_price between 20 and 30 and supplier_id = 2 or units_in_stock > 100) and supplier_id = 3

select * from products p where (unit_price between 20 and 30 and supplier_id = 2 or units_in_stock > 100) and not supplier_id = 3

select * from employees e

select * from employees e where region is not null

select * from products p where supplier_id in (1, 2, 3)

select * from order_details od where quantity > 40

select distinct product_id from order_details od where quantity > 40

select distinct product_id, quantity, unit_price from order_details od where quantity > 40

select product_id, unit_price from products p where (product_id, unit_price) in (select product_id, unit_price from order_details od where quantity > 40) 

select * from products p order by supplier_id desc

select supplier_id, units_in_stock from products p order by supplier_id desc, units_in_stock desc

select product_name, unit_price * units_in_stock as expected_revenue from products p order by expected_revenue desc

select product_name, unit_price * units_in_stock as expected_revenue from products p where expected_revenue > 1000 order by expected_revenue desc

select product_name, unit_price * units_in_stock as expected_revenue from products p where unit_price * units_in_stock > 1000 order by expected_revenue desc

select * from customers c where company_name like 'D%'

select * from customers c where company_name like 'D_ %'

select 'привет' = 'привет'

select 'привет' = 'ПРИвет'

select 'привет' ilike 'ПРИвет'

select * from customers c where company_name like 'd%'

select * from customers c where company_name ilike 'select 'привет' = 'привет'

select 'привет' = 'ПРИвет'

select 'привет' ilike 'ПРИвет'

select * from customers c where company_name like 'd%'

select * from customers c where company_name ilike 'd%'

select * from customers c where company_name like 'd_ %'

select * from customers c where company_name ilike 'd_ %'

select *,
    case 
    when unit_price > 100 then unit_price
    when unit_price > 50 then unit_price
    else null
    end price_group
from products p

select *
from customers c

select company_name, contact_name,
    case 
    when fax is not null then fax
    when phone is not null then phone
    else null
    end contacts
from customers c

select company_name, contact_name, coalesce (fax, phone) as contacts
from customers c

select coalesce (contact_name, 'Дорогой друг')
from customers c

select units_in_stock::numeric 
from products p

select units_in_stock::date
from products p

select pg_typeof(product_name)
from products p

select 1/2
from products p

select 1::numeric/2
from products p

select 1.0/2 
from products p

select 'Привет!' || ' Как тебя зовут?' 

select contact_name || ': ' || contact_title as info
from customers c

select now()

select current_date

select order_date, extract (year from order_date)
from orders o

select order_date, extract (month from order_date)
from orders o

select order_id, customer_id, shipped_date - order_date as days
from orders o

select o.order_id, c.company_name
from orders o
join customers c
on o.customer_id = c.customer_id

select o.order_id, c.company_name, o.customer_id, c.customer_id
from orders o
join customers c
on o.customer_id = c.customer_id

select o.order_id, c.company_name
from orders o
right join customers c
on o.customer_id = c.customer_id

select o.order_id, c.company_name
from orders o
left join customers c
on o.customer_id = c.customer_id

select o.order_id, c.company_name
from orders o
full join customers c
on o.customer_id = c.customer_id

select o.order_id, o.employee_id, e.employee_id
from orders o
join employees e
on o.employee_id > e.employee_id

select *
from employees e
cross join employees e2

select e.last_name || ' ' || e.first_name as partner_1, e2.last_name || ' ' || e2.first_name as partner_2
from employees e
cross join employees e2

select p.product_name, c.category_name, s.company_name
from products p
join suppliers s
on p.supplier_id = s.supplier_id 
join categories c
on p.category_id = c.category_id

select p.product_name, c.category_name, s.company_name
from products p
join suppliers s
on p.supplier_id = s.supplier_id 
join categories c
on p.category_id = c.category_id
where p.product_name like 'C%'

select order_id, company_name
from orders o
right join customers c
on o.customer_id = c.customer_id

select order_id, company_name
from orders o
right join customers c
on o.customer_id = c.customer_id
where o.order_id is null

select order_date, e.last_name
from orders o
join employees e
on o.employee_id = e.employee_id

select order_date, e.last_name
from orders o
join employees e
on o.employee_id = e.employee_id
where order_date <= '1996-07-10'




