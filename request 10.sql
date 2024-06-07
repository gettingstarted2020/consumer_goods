/*  Get the Top 3 products in each division that have a high
total_sold_quantity in the fiscal_year 2021? The final output contains these
fields,
division
product_code
*/
with cte as (select p.division ,s.product_code,p.product,(s.sold_quantity) as total_qty
from fact_sales_monthly s 
join dim_product p 
using(product_code)
where fiscal_year = 2021 
group by p.division,s.product_code), cte2 as (
select *,dense_rank() over(partition by division order by total_qty desc) as rnk 
from cte)
select * 
from cte2 
where rnk <=3;