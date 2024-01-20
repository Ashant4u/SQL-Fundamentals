--1) How many unique transactions are there in thetransactions table?

select 
   count(distinct(transaction_id))as unique_transactions
from grocery_db.transactions

--2) How many customers were in each mailer_typecategory for the deliveryclub campaign
select
  mailer_type,
  count(distinct(customer_id)) as customers
  
from grocery_db.campaign_data

where campaign_data.campaign_name = 'delivery_club'

group by mailer_type

--3) Return a list of customers who spent more than$500 and had 5 or more unique transactions in themonth of August 2020

select
    customer_id,
    sum(sales_cost) as total_sales,
    count(distinct(transaction_id)) as total_transactions
from grocery_db.transactions

where transaction_date between '2020-08-01' and '2020-08-31'
group by customer_id 
having sum(sales_cost)>500  and count(distinct(transaction_id)) >=5

--4) Return a list of duplicate credit scores that existin the customer_details table

select
  credit_score,
  count(credit_score)
from grocery_db.customer_details

group by credit_score
having count(credit_score)>1
--5) Return the customer_id(s) for the customer(s) whohas/have the 2nd highest credit score. Make sureyour code would work for the Nth highest creditscore as well

with credit_scores as (
select 
   customer_id,
   credit_score,
   dense_rank() over ( order by credit_score DESC ) as cs_rank
from grocery_db.customer_details
where credit_score is Not NULL
order by credit_score DESC

)

select
   customer_id
from 
  credit_scores

where 
  cs_rank =2
