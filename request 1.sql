/* task-1 Provide the list of markets in which customer "Atliq Exclusive" operates its
business in the APAC region.*/
  
Select distinct market 
from dim_customer
where region ="APAC" and customer ="Atliq exclusive "
