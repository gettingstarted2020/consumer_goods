/*What is the percentage of unique product increase in 2021 vs. 2020? The
final output contains these fields,
unique_products_2020
unique_products_2021
percentage_chg*/


select A.u20 ,B.u21, round(((B.u21-A.u20)/A.u20)*100,2) as percentage_chg
from ((select count(distinct(product_code)) as u20 from fact_sales_monthly where fiscal_year=2020) A , (
select count(distinct(product_code)) as u21 from fact_sales_monthly where fiscal_year=2021) B)

