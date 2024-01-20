-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--BASIC SELECT STATEMENT


-- SELECT STATEMENT

select 
  * 
  
from 
 grocery_db.product_areas;
 
--LIMIT

select 
  * 
  
from 
 grocery_db.product_areas
 
limit
 3;
 
--ORDER BY

select 
  * 
  
from 
 grocery_db.customer_details
 
order by
 distance_from_store,
 credit_score;
 
--DISTINCT

select
  distinct 
  gender 
  
from 
 grocery_db.customer_details;
 
--GIVING COLUMN ALIAS

select
  distance_from_store as distance_to_store, 
  customer_id as customer_number 
  
from 
 grocery_db.customer_details;
 

---CREATING A NEW COLUMNS

select
  distance_from_store as distance_to_store, 
  customer_id as customer_number,
  1 as new_col,
  distance_from_store * 1.5 as distance_in_km
  
from 
 grocery_db.customer_details;
 
