/* Follow-up: Which segment had the most increase in unique products in
2021 vs 2020? The final output contains these fields,
segment
product_count_2020
product_count_2021
difference*/

with cte as (select p.segment,count(distinct(s.product_code)) as product_count_2020
from dim_product p 
join fact_sales_monthly s
using(product_code)
where fiscal_year =2020
group by segment
),cte2 as 
(select p.segment,count(distinct(s.product_code)) as product_count_2021
from dim_product p
join fact_sales_monthly s 
using(product_code)
where fiscal_year =2021
group by segment)

select *,product_count_2021-product_count_2020 as diff
from cte c1
join cte2 c2
using (segment);

