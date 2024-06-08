/* . Provide a report with all the unique product counts for each segment and
sort them in descending order of product counts. The final output contains
2 fields,
segment
product_count
*/
select p.segment,count(distinct(s.product_code)) as product_count
from fact_sales_monthly s 
join dim_product p 
using(product_code)
group by p.segment
order by product_count desc
