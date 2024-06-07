/*  In which quarter of 2020, got the maximum total_sold_quantity? The final
output contains these fields sorted by the total_sold_quantity,
Quarter
total_sold_quantity
*/

with fy_months as (select month(date_add(date,interval 4 month)) as fy_month,sold_quantity
from fact_sales_monthly
where fiscal_year=2020)
select 
case
when ceiling(fy_month/3)=1  then "Q1"
when ceiling(fy_month/3)=2  then "Q2"
when ceiling(fy_month/3)=3  then "Q3"
when ceiling(fy_month/3)=4  then "Q4"
end as quaters,
round(sum(sold_quantity)/1000000,2) as total_qty_in_millions
from fy_months
group by quaters;
