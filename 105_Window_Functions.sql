----------------------------------------------------
--WINDOW FUNCTION
----------------------------------------------------


--WiNDOW FUNCTION

select 
   *,
  sum(sales_cost) over(partition by transaction_id) as transaction_sales_cost,
  sales_cost / sum(sales_cost) over(partition by transaction_id) as transaction_sales_percentage
from
   grocery_db.transactions;


-- ROW NUMBER AND RANK


select 
   *,
  row_number() over(partition by customer_id order by transaction_date ,transaction_id) as transaction_number
  
from
   grocery_db.transactions;
2

--RANK
select 
   *,
  rank() over(partition by customer_id order by transaction_date ,transaction_id) as transaction_number
  
from
   grocery_db.transactions;

--DENSE RANK

select 
   *,
  dense_rank() over(partition by customer_id order by transaction_date ,transaction_id) as transaction_number
  
from
   grocery_db.transactions;
   

--NTILE

select
  customer_id,
  customer_loyalty_score,
  ntile(3)over(order by customer_loyalty_score desc) as loyalty_category,
  ntile(10)over(order by customer_loyalty_score desc) as loyalty_category2
from
   grocery_db.loyalty_scores;




