-------------------------------------------------------
-- PART 2 Applying selection technique using where statement
-------------------------------------------------------

--THE WHERE STATEMENT
select 
  * 
  
from 
 grocery_db.customer_details
 
where distance_from_store < 2;

--MULTIPLE CONDITIONS


--and
select 
  * 
  
from 
 grocery_db.customer_details
 
where 
  distance_from_store < 2 and
  gender = 'M'
  

--or

select 
  * 
  
from 
 grocery_db.customer_details
 
where 
  distance_from_store < 2 or
  gender = 'M'
  

--in

select 
  * 
  
from 
 grocery_db.customer_details
 
where 
  distance_from_store < 2 or
  gender = 'M'
  
--OTHER OPERATORS

--EQUAL TO =
--NOT EQUAL TO <>
--GREATER THAN/lESS THAN /EQUAL < > <=

--in

select
  * 

from 
  grocery_db.campaign_data
  
where
 mailer_type in('Mailer1' , 'Mailer2')






--like

select
  * 

from 
  grocery_db.campaign_data
  
where
 mailer_type like('%Mailer')
 --------
select
  * 

from 
  grocery_db.campaign_data
  
where
 mailer_type like('%Mailer%')
 --------
select
  * 

from 
  grocery_db.campaign_data
  
where
 mailer_type like('Mailer%')
