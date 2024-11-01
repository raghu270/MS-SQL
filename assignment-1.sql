create database assignment1;

use assignment1;

--salesman table creation

create table salesman(salesmanid int,
name varchar(50),
commission decimal(10,2),
city varchar(50),
age int);

--salesman table record insertion

insert into salesman values(101, 'Joe', 50, 'California', 17),
    (102, 'Simon', 75, 'Texas', 25),
    (103, 'Jessie', 105, 'Florida', 35),
    (104, 'Danny', 100, 'Texas', 22),
    (105, 'Lia', 65, 'New Jersey', 30);

select * from salesman;

--customer table creation

create table customer(salesmanid int,
customerid int,
customername varchar(250),
purchaseamount int);

--customer table record insertion

insert into customer values (101, 2345, 'Andrew', 550),
    (103, 1575, 'Lucky', 4500),
    (104, 2345, 'Andrew', 4000),
    (107, 3747, 'Remona', 2700),
    (110, 4004, 'Julia', 4545);

select * from customer;

--orders table creation

create table orders(orderid int,
customerid int,
salesmanid int,
orderdate date,
amount money);

--orders table record insertion

insert into orders values(5001,2345,101,'2021-07-01',550),
(5003,1234,105,'2022-02-15',1500)

select * from orders;

--Tasks

--1.Insert a new record in your Orders table.

insert into orders values(5004,1575,104,'2022-03-05',2700);

--2.a.Add Primary key constraint for SalesmanId column in Salesman table.

alter table salesman alter column salesmanid int not null;
alter table salesman add constraint pk_sales primary key(salesmanid);

--2.b.Add default constraint for City column in Salesman table.

alter table salesman add constraint df_city default 'london' for city;

--2.c.Add Foreign key constraint for SalesmanId column in Customer table.

alter table customer add constraint fk_salesmanid foreign key(salesmanid) references salesman(salesmanid);

--2.d.Add not null constraint in Customer_name column for the Customer table.

alter table customer alter column customername varchar(250) not null;

--3.Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase amount value greater than 500.

select * from customer where customername like '%n' and purchaseamount >500;

--4. Using SET operators, retrieve the first result with unique SalesmanId values from two
--tables, and the other result containing SalesmanId with duplicates from two tables.
-- UNIQUE SALESMAN ID FROM CUSTOMER AND SALESMAN TABLES WITHOUT DUPLICATES
SELECT salesmanid from salesman UNION SELECT salesmanid FROM customer

--SALESMAN ID FROM CUSTOMER AND SALESMAN TABLES WITH DUPLICATES
SELECT salesmanid from salesman  UNION ALL SELECT salesmanid FROM customer

--UNIQUE SALESMAN ID FROM SALESMAN AND ORDERS TABLE WITHOUT DUPLICATES
SELECT salesmanId from salesman UNION SELECT salesmanid FROM orders

--SALESMAN ID FROM ORDERS AND SALESMAN TABLES WITH DUPLICATES
SELECT salesmanid from salesman UNION ALL SELECT salesmanid FROM orders


--5.Display the below columns which has the matching data.
--Orderdate, Salesman Name, Customer Name, Commission, and City which has the range of Purchase Amount between 500 to 1500

select orderdate ,name as 'salesman name',customername,commission,city from salesman s
join customer c on s.salesmanid=c.salesmanid
join orders o on c.customerid=o.customerid where purchaseamount between 500 and 1500 ;

--6.Using right join fetch all the results from Salesman and Orders table.

select * from salesman s
right outer join orders o on
s.salesmanid=o.salesmanid ;
