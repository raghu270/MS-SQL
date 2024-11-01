--multi statement table-valued function
--temporary table
--hide information from which table it is coming
--need to give the structure of the table and also begin and end

use retail2
drop table customer;
drop table orders;
create table Customer(customer_id int primary key,
contactname varchar(50) not null,
city varchar(20));

select * from Customer;

insert into customer
values(1,'Maria Anders','Berlin'),
(2,'Ana Trujillo','London'),
(3,'Antonio Moreno','Lulea'),
(4,'Thomas Hardy','Madrid'),
(5,'Hanna Moos','London'),
(6,'Yang Wang','Bern');

create table Orders(
order_id int primary key,
customer_id int,
order_date date,
country varchar(50));

insert into Orders(order_id,customer_id,order_date,country) 
values(10252,4,'1996-07-09 00:00:00.000','Belgium'),
(10253,3,'1996-07-10 00:00:00.000','Brazil'),
(10254,5,'1996-07-11 00:00:00.000','Switzerland'),
(10255,9,'1996-07-12 00:00:00.000','Switzerland'),
(10256,3,'1996-07-15 00:00:00.000','Brazil'),
(10257,4,'1996-07-16 00:00:00.000','Austria'),
(10258,1,'1996-07-17 00:00:00.000','Austria');

select * from Orders;

--get customers with orders details
CREATE FUNCTION GetCustomersWithOrdersDetails ()
RETURNS @CustomersWithOrders TABLE 
(CustomerID int, ContactName nvarchar(50), 
Orderid int,orderdate date,city varchar(50))
AS
BEGIN
   INSERT INTO @CustomersWithOrders
   SELECT c.customer_id, c.ContactName, 
   order_id ,order_date,city
   FROM Customer c
   JOIN Orders o ON c.customer_id = o.customer_id
  
   RETURN
END

select * from dbo.GetCustomersWithOrdersDetails()

select * from dbo.GetCustomersWithOrdersDetails() order by city


CREATE TABLE EMPLOYEE (  
 emp_id int identity,  
 fullname varchar(65),  
 occupation varchar(45),  
 gender varchar(30),  
 salary int,  
 country varchar(55)  
);  

INSERT INTO EMPLOYEE(fullname, occupation, gender, salary, country)  
VALUES ('John Doe', 'Writer', 'Male', 62000, 'USA'),  
('Mary Greenspan', 'Freelancer', 'Female', 55000, 'India'),  
('Grace Smith', 'Scientist', 'Male', 85000, 'USA'),  
('Mike Johnson', 'Manager', 'Male', 250000, 'India'),  
('Todd Astel', 'Business Analyst', 'Male', 42000, 'India'),  
('Sara Jackson', 'Engineer', 'Female', 65000, 'UK'),  
('Nancy Jackson', 'Writer', 'Female', 55000, 'UK'),  
('Rose Dell', 'Engineer', 'Female', 58000, 'USA'),  
('Elizabeth Smith', 'HR', 'Female', 55000, 'UK'),  
('Peter Bush', 'Engineer', 'Male', 42000, 'USA');  

select * from employee;

--grouping
select country,SUM(salary) from EMPLOYEE group by country;

select gender ,country,SUM(salary) from EMPLOYEE group by gender,country

select gender,SUM(salary) from EMPLOYEE group by gender

--rollup 
--totals and subtotals  u will get

select coalesce(country,'total') as 'country' ,SUM(salary) as 'Total salary'  
from EMPLOYEE group by country with rollup;

--gender wise rollup
select gender ,country,SUM(salary) from EMPLOYEE group by gender,country with rollup;

--country wise rollup
select gender,country,SUM(salary) from EMPLOYEE group by country,gender with rollup;

--by replacing nulls
SELECT coalesce(country,'Total') as 'country', SUM(salary) AS "Total Salary"  
FROM EMPLOYEE  
GROUP BY country WITH ROLLUP;  

SELECT coalesce(gender,'Grand Total') as gender, coalesce(country,'All countries') as country, SUM(salary) AS "Total Salary"  
FROM EMPLOYEE  
GROUP BY gender, country WITH ROLLUP; 



