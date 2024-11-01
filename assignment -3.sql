use assignment;

--1. Create an ‘Orders’ table which comprises of these columns: ‘order_id’,‘order_date’, ‘amount’, ‘customer_id’.

create table orders(order_id int primary key,
order_date date,
amount int,
customer_id int foreign key references customer(customer_id));

select * from orders;

--2. Insert 5 new records

insert into orders values(101,'2024-02-14',4000,10),(102,'2024-02-15',5000,20),
(103,'2024-02-16',6000,30),(104,'2024-02-17',7000,40),(105,'2024-02-18',8000,50);

--3. Make an inner join on ‘Customer’ and ‘Orders’ tables on the ‘customer_id’ column

select * from customer c inner join orders o
on c.customer_id=o.customer_id ;

--4.Make left and right joins on ‘Customer’ and ‘Orders’ tables on the ‘customer_id’ column

select * from customer  c left outer join orders o 
on c.customer_id=o.customer_id;

select * from customer  c right outer  join orders o 
on c.customer_id=o.customer_id;

--5. Make a full outer join on ‘Customer’ and ‘Orders’ table on the ‘customer_id’ column

select * from customer  c full outer join orders o 
on c.customer_id=o.customer_id;

--6. Update the ‘Orders’ table and set the amount to be 100 where ‘customer_id’ is 30.

update orders 
set amount=100 where
customer_id=30;








