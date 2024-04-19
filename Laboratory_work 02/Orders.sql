select distinct 
ship_mode 
from public.orders o  

select
count( distinct order_id) as number_orders
from public.orders o 

select distinct 
ship_mode,
count( distinct order_id) as number_orders
from public.orders o  
group by ship_mode
