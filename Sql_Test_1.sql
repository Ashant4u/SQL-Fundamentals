--How many rows are there in transactions table

select
 count(*) as number_of_rows
 
from
   grocery_db.transactions;
   

--Return the customer_id for the customer wholives farthest from the store

select
  customer_id
  
from
   grocery_db.customer_details

Where distance_from_store IS not NULL
order by distance_from_store DESC limit 1


--Return the number of unique customers in thecustomer_details table, split by gender

select
  count(*) as number_of_unique_customers
from
   grocery_db.customer_details
group by gender




--4) What were the total sales for each productareaname for July 2020.Return these in the order ofhighest sales to lowest sales

select
   sum(sales_cost) as total_sales,
   product_areas.product_area_name
from grocery_db.transactions

inner Join grocery_db.product_areas ON product_areas.product_area_id = transactions.product_area_id 

where transaction_date between '2020-07-01' and '2020-07-31'

group by product_area_name

order by total_sales DESC
--5) Return a list of all customer_id's that do NOT havea loyalty score (i.e. they are in the customer_detailstable, but not in the loyalty_scores table)

select
   a.customer_id
  
from grocery_db.customer_details a
 
Left Join grocery_db.loyalty_scores b on b.customer_id = a.customer_id 

where customer_loyalty_score is  NULL
