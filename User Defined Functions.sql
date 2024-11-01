create database retail2
use retail2

--scalar valued function
create table order_items(
order_id int not null,
prod_id varchar(10),
quantity int,list_price decimal(10,2),
discount decimal(10,2),
primary key(order_id));

insert into order_items values(1,'p001',100,50,2.5);
insert into order_items values(2,'p002',50,40,4.0);
insert into order_items values(3,'p003',1000,25,0);
insert into order_items values(4,'p001',200,50,2.5);

select * from order_items;

create function udfnetsale(
@quantity int,
@list_price dec(10,2),
@discount dec(4,2)
)
returns dec(10,2)
as begin
return @quantity*@list_price*((100-@discount)/100)
end;

select dbo.udfnetsale(10,100,5) netsale;

select order_id,prod_id,quantity,list_price,discount,dbo.udfnetsale(quantity,list_price,discount) net_amount 
from order_items;

--inline table valued function
create table student(
id int not null,
name varchar(50) not null,
marks int not null,
primary key(id));


insert into student values(1,'tushar',60),(2,'kunal',80),(3,'shivam',30),
(4,'rushi',45);

select * from student;

--find all the students who having marks greater than 50
create function getnamebymarks(@mark int)
returns table 
as
return
(select id,name,marks from student where marks>=@mark)

select * from dbo.getnamebymarks(50)