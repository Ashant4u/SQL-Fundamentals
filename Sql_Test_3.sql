--1) Return a list of customers from the loyalty_scores tablewho have a customer_loyalty_score of 0.77, 0.88, or 0.99

select
   *
from
   grocery_db.loyalty_scores
where
   customer_loyalty_score In ( 0.77,0.88,0.99)
   
--2) Return the average customer_loyalty_score forcustomers, split by gender
select
   avg(customer_loyalty_score) as avg_customer_loyalty_score,
   b.gender
from
   grocery_db.loyalty_scores a
join grocery_db.customer_details b ON b.customer_id = a.customer_id

group by b.gender 
   


--3) Return customer_id, distance_from_store, and a newcolumn called distance_category that tags customers whoare less than 1 mile 
--from store as "Walking Distance", 1 mileor more from store as "Driving Distance" and "Unknown" forcustomers where we do not know their distance from thestore


select
  customer_id,
  distance_from_store,
  case
    when distance_from_store < 1 then 'Walking Distance'
    when distance_from_store > 1 then 'Driving Distance'
    Else 'Unknown'
  End as distance_category
from
  grocery_db.customer_details


--4) For the 400 customers with a customer_loyalty_score,divide them up into 10 deciles, and calculate the averagedistance_from_store for each decile

with customer_score as (
select
  a.customer_id, 
  a.customer_loyalty_score,
  ntile(10) over (order by a.customer_loyalty_score desc) as cs_rank,
  b.distance_from_store
  
from
   grocery_db.loyalty_scores a
   
inner join 
  grocery_db.customer_details b on b.customer_id = a.customer_id where customer_loyalty_score != 0
  
--limit
--  400
  
)

select
  cs_rank,
  avg(distance_from_store)
from 
  customer_score
group by 
  cs_rank

--5) Return data showing, for each product_area_name - thetotal sales, and the percentage of overall sales that each product area makes up
with sales as (
select
  b.product_area_name,
  sum(a.sales_cost) as total_sales
from 
  grocery_db.transactions a
inner join
  grocery_db.product_areas b On b.product_area_id = a.product_area_id
  
group  by 
  product_area_name
  
)
select
   product_area_name,
   total_sales,
   total_sales/(select sum(total_sales) from sales ) as total_sales_pc
   
from
   sales
