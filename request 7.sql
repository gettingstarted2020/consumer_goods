/* Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month. This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
Month
Year
Gross sales Amount*/

select monthname(s.date) as m,s.fiscal_year,round(sum(s.sold_quantity*g.gross_price)/1000000,2) as gross_sales_amount_in_millions
from fact_sales_monthly s
join fact_gross_price g
using (fiscal_year,product_code)
join dim_customer c
using(customer_code)
where c.customer ='Atliq Exclusive'
group by monthname(s.date),s.fiscal_year
order by s.fiscal_year,date;


