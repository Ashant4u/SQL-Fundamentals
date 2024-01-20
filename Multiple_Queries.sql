--TEMP Table

select * from grocery_db.transactions where customer_id =1;

Create  temp table  cust_transactions as (

select customer_id,
       transaction_id,
       sum(sales_cost)as total_sales

from
  grocery_db.transactions
  
group by
  customer_id,
  transaction_id
  );
  
select * from cust_transactions

select
  customer_id,
  avg(total_sales)
from
  cust_transactions
  
group by
  customer_id;
  


---COMMON TABLE EXPRESSION

with cust_transactions_cte as (

select customer_id,
       transaction_id,
       sum(sales_cost)as total_sales

from
  grocery_db.transactions
  
group by
  customer_id,
  transaction_id
  )
  

select
  customer_id,
  avg(total_sales)
from
  cust_transactions_cte
  
group by
  customer_id;

