---------------------------------------------------------
--AGGREGATION OUR DATA 

---------------------------------------------------------


--AGGREGATION FUNCTIONS

select
  sum(sales_cost) as total_cost,
  avg(sales_cost) as avg_cost,
  min(sales_cost) as min_cost,
  max(sales_cost) as max_cost,
  count (*) as num_rows,
  count (distinct transaction_id) as num_transactions
  
from
   grocery_db.transactions;
   


--THE GROUP BY STATMENT

select
  transaction_date,
  sum(sales_cost) as total_sales,
  sum(num_items) as total_items,
  count (distinct transaction_id) as num_transactions
  
from
   grocery_db.transactions
   
group by
   transaction_date
   
order by
   transaction_date;

--THE GROUP BY MULTIPLE VARIABLES

select
  transaction_date,
  product_area_id,
  sum(sales_cost) as total_sales,
  sum(num_items) as total_items,
  count (distinct transaction_id) as num_transactions
  
from
   grocery_db.transactions
   
group by
   transaction_date,
   product_area_id
   
order by
   transaction_date,
   product_area_id;


   

 

--THE HAVING CLAUSE


select
  product_area_id,
  sum(sales_cost) as total_cost
  
from
   grocery_db.transactions
   
group by
  product_area_id

having
  sum(sales_cost) > 200000;
