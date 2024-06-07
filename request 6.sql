/*Generate a report which contains the top 5 customers who received an
average high pre_invoice_discount_pct for the fiscal year 2021 and in the
Indian market. The final output contains these fields,
customer_code
customer
average_discount_percentage
*/

select c.customer_code,c.customer,avg(p.pre_invoice_discount_pct) as avg_pre
from dim_customer c
join fact_pre_invoice_deductions p
using (customer_code)
where p.fiscal_year=2021 and c.market="india"
group by c.customer_code
order by avg_pre desc limit 5;


