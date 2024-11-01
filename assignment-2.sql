


create database assignment;

use assignment;

--1. Create a customer table which comprises of these columns: ‘customer_id’,‘first_name’, ‘last_name’, ‘email’, ‘address’, ‘city’,’state’,’zip’ 

create table customer(customer_id int primary key,
first_name varchar(50),
last_name varchar(50),
email varchar(50),
address varchar(50),
city varchar(50),
state varchar(50),
zip int );

select * from customer;

--2. Insert 5 new records into the table

insert into customer values(10,'JEMMI','SWQ','JEM@GMAIL.COM','2ND FLOOR','LEH','MYSORE','33222'),

	  (20,'JEMMI','AVANTHIKA','JEMMI@GMAIL.COM','2ND FLOOR','LEH','KASHMIR','22222'),

      (30,'JESSICA','VANYA','VANYA@GMAIL.COM','3RD FLOOR','ALLEPPY','KERALA','33333'),

	  (40,'JERUSHA','JERU','JERU@GMAIL.COM','4TH FLOOR','OOTY','BANGLORE','44444'),

	  (50,'GRACE','ZIPPORA','GRACE@GMAIL.COM','5TH FLOOR','SAN JOSE','LA','55555');

--3. Select only the ‘first_name’ and ‘last_name’ columns from the customer table


select first_name,last_name from customer;

--4. Select those records where ‘first_name’ starts with “G” and city is ‘San Jose’.


select *  from customer where first_name like 'g%' and city='san jose';

--5. Select those records where Email has only ‘gmail’.

select * from customer where email like '%gmail%';

--6. Select those records where the ‘last_name’ doesn't end with "A";

select * from customer where last_name not like '%A';

