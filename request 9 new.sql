/*. Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields,
channel
gross_sales_mln
percentage
*/

with cte as (select c.channel,sum(s.sold_quantity*g.gross_price) as total_sales
from fact_sales_monthly s 
join fact_gross_price g
using(product_code,fiscal_year)
join dim_customer c 
using(customer_code)
where fiscal_year=2021
group by c.channel)
select channel, 
     round((total_sales/1000000),2) as total_sales_in_millions,
     round((total_sales/(select sum(total_sales)from cte))*100,2) as pct
from cte
group by channel
order by total_sales
