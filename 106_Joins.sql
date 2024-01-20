---------------------------------------------------------
----Joining tables
---------------------------------------------------------

--Inner JOIN

select * from grocery_db.customer_details;
select * from grocery_db.loyalty_scores;

select 
  a.*,
  b.customer_loyalty_score

from
   grocery_db.customer_details a
   inner join grocery_db.loyalty_scores b on a.customer_id = b.customer_id;
   


--Left Join

select 
  a.*,
  b.customer_loyalty_score

from
   grocery_db.customer_details a
   left join grocery_db.loyalty_scores b on a.customer_id = b.customer_id;
   

--Right Join

select 
  a.*,
  b.customer_loyalty_score

from
   grocery_db.customer_details a
   right join grocery_db.loyalty_scores b on a.customer_id = b.customer_id;
   

--Adding logic

select 
  a.*,
  b.customer_loyalty_score

from
   grocery_db.customer_details a
   left join grocery_db.loyalty_scores b on a.customer_id = b.customer_id
 
where customer_loyalty_score > 0.5;


--Joining Multiple Tables
select * from grocery_db.customer_details;
select * from grocery_db.transactions;
select * from grocery_db.product_areas;

select 
  a.*,
  b.customer_loyalty_score,
  c.product_area_name

from
   grocery_db.transactions a
   left join grocery_db.loyalty_scores b on a.customer_id = b.customer_id
   inner join grocery_db.product_areas c on c.product_area_id = a.product_area_id;
   


--Other Join type
Create table table1(
                 id char(1),
                 t1_col1 int,
                 t1_col2 int ); 
                 
Insert into table1 values ('A',1,1)('B',1,1) ;

Select * from table1;

 Create table table1(
                 id char(1),
                 t1_col1 int,
                 t1_col2 int ); 
                 Create table table1(
                 id char(1),
                 t1_col1 int,
                 t1_col2 int ); 
                 
Insert into table1 values ('A',1,1)('B',1,1) ;

Select * from table1;
Insert into table1 values ('A',1,1)('B',1,1) ;

Select * from table1;

Drop table table2

Create table table2(
                 id char(1),
                 t2_col1 int,
                 t2_col2 int );
                 
Insert into table2 values ('A',2,2),('C',2,2);


===================

select
  a.id as id_t1,
  a.t1_col1,
  a.t1_col2,
  b.id as id_t2,
  b.t2_col1,
  b.t2_col2

from 
  table1 a
  inner join table2 b on a.id = b.id;
  


select
  a.id as id_t1,
  a.t1_col1,
  a.t1_col2,
  b.id as id_t2,
  b.t2_col1,
  b.t2_col2

from 
  table1 a
  left join table2 b on a.id = b.id;


select
  a.id as id_t1,
  a.t1_col1,
  a.t1_col2,
  b.id as id_t2,
  b.t2_col1,
  b.t2_col2

from 
  table1 a
  right join table2 b on a.id = b.id;
  
--Outer Join

select
  a.id as id_t1,
  a.t1_col1,
  a.t1_col2,
  b.id as id_t2,
  b.t2_col1,
  b.t2_col2

from 
  table1 a
  full outer join table2 b on a.id = b.id;
  
--CROSS JOIN

select
  a.id as id_t1,
  a.t1_col1,
  a.t1_col2,
  b.id as id_t2,
  b.t2_col1,
  b.t2_col2

from 
  table1 a
  cross join table2 b;
