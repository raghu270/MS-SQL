use retail;
select * from customer;

--print the count of customers in entire table
select count(cnum) as 'count of customer' from customer;

--group by (segregate the data from a single table)clause
--print the count of customer in each city
select city,count(cnum) as 'count of customer' from customer group by city;

--display the distinct city from customer
select distinct city from customer;

select * from salespeople;

--print the count of cistomers for each rating
select rating,count(cnum) as 'count of customer' from customer group by rating;

--print the count of customer for each rating and city wise
--composite group by
select city,rating,count(cnum) as 'count of customer' from customer group by city,rating;

--find count of customer for each salepersonn id
select snum,count(cnum) as 'count of customer' from customer group by snum;
--print the name of the salesperson too
--use of joins(combining two or more tables into a single table)
--inner,left outer,right outer,full
select c.snum,sname,count(cnum) as 'count of customer' from salespeople s join customer c
on s.snum=c.snum
group by c.snum,sname;


select * from orders;

--find the count of orders of each customer
select cnum,count(cnum) as 'count of order' from orders group by cnum;

--display all the records and columns after joinning salespeople and customer
select * from salespeople s join customer c
on s.snum=c.snum;

--display all the customer and salespeople residing in the same city
select * from customer c join salespeople s on c.snum=s.snum
where c.city=s.city;

--left outer join
select * from salespeople s left outer join customer c 
on c.snum=s.snum;

--find count of customer for each salepersonn id(exact)
select s.snum,sname,count(cnum) as 'count of customer' from salespeople s left outer join customer c
on s.snum=c.snum
group by s.snum,sname;
select * from orders1;

--find total sales for all transactions
select sum(amt) as 'total amount' from orders1;

--find total sales for each data-store into a new table
select odate,sum(amt) as 'total_sales'
into date_wise_sales
from orders1
group by odate;

select * from date_wise_sales;
select * from salespeople;
select * from customer;
select cnum from customer where rating >100
select * from orders;

--find customer wise sales (cust id, name, total sales)
--find customer wise count of txns (cust id, name, total count)
--find total sales for each customer city (cust_city, total sales)

--customer wise sales
select o.cnum,cname,sum(amt) as 'total sales to each customer' into customer_wise_sales
from customer c join orders o on c.cnum=o.cnum
group by o.cnum,cname;

select * from customer_wise_sales;

--customer wise count of txns
select c.cnum,cname,COUNT(c.cnum) as 'total txns by each customer' into customer_wise_count_of_txns
from customer c join orders o on c.cnum=o.cnum
group by c.cnum,cname

select * from customer_wise_count_of_txns;

--total sales for each customer city (cust_city,total sales)
select c.city,SUM(amt) as 'total sales of each city' 
from customer c join orders o on c.cnum=o.cnum
group by c.city
order by 'total sales of each city' desc;

select * from customer_city;

--customer wise sales dealing with null
insert into customer values(2009,'john','hyderabad',400,1001);
select c.cnum,cname,coalesce(SUM(amt),0) as 'total sales' from customer c left outer join orders o
on c.cnum=o.cnum group by c.cnum,cname;

--having clause(is a filtered caluse that works on agreegate data)
select c.city,SUM(amt) as 'total sales of each city' 
from customer c join orders o on c.cnum=o.cnum
group by c.city
having SUM(amt) > 5000
order by 'total sales of each city' asc;

--find count of txns for each customer whose total count more than 1
select c.cnum,cname,COUNT(o.cnum) as 'total transactions' from customer c left outer join orders o
on c.cnum=o.cnum
group by c.cnum,cname
having COUNT(o.cnum) > 1;

--find count of txns for each customer who are living in london and san jose and whose total count more than 1
select c.cnum,cname ,COUNT(o.cnum) as 'total transactions' from customer c left outer join orders o
on c.cnum=o.cnum
where city='london' or city='san jose' 
group by c.cnum,cname
having COUNT(o.cnum)>1;

--update command
update customer set city='berlin' where cnum=2009;

select * from customer;

--delete command
delete from customer where cnum=2009;

--min max and avg
select MIN(rating) from customer;
select MAX(rating) from customer;
select AVG(rating) from customer;

--truncate command(deletes all the records in a table)
create table new(pid int,pname varchar(30));
insert into new values(100,'r')
insert into new values(101,'a')
select * from new;
truncate table new;

--date functions
--triggers
--stored procedures
--join 3 tables

select * from orders1;

--find month wise total sales
select *,MONTH(odate) as 'month' from orders1;
select *,DATENAME(MONTH,odate) as 'month name' from orders1;

select month(odate),SUM(amt) as 'total sales' from orders1 group by MONTH(odate);
select DATENAME(Month,odate) as 'month name',SUM(amt) as 'total sales' from orders1 group by DATENAME(month,odate),MONTH(odate)
order by month(odate);

--quarter wise sales
select DATENAME(quarter,odate) as 'qtr num',SUM(amt) as 'total sales' from orders1 group by DATENAME(quarter,odate)

--year wise sales
select YEAR(odate) as 'year' ,sum(amt) as 'total sales' from orders1 group by YEAR(odate); 

--weekday wise sales
select DATENAME(weekday,odate) as 'weekday' ,SUM(amt) as 'total sales' from orders1 group by DATENAME(weekday,odate),DATEPART(dw,odate)
order by DATEPART(dw,odate);	

--3 table joins
select * from salespeople s join customer c on s.snum=c.snum
join orders o on o.cnum=c.cnum

--find the total amount of sales done by each salesperson
select sname,SUM(amt) as 'total sales' from salespeople s join customer c on s.snum=c.snum
join orders o on  o.cnum=c.cnum group by sname

--find commission payable to each salesperson
select * from salespeople;
select sname,round(SUM(amt*comm),2) as 'total comm' from salespeople s join customer c on s.snum=c.snum
join orders o on  o.cnum=c.cnum group by sname order by 'total comm' desc;

--cross joins
select * from salespeople,customer;
--never use cross joins and always use on

--creating view(like a virtual table)
create view sp_cust_ord as 
select s.snum as salespersonid,sname,s.city as salpesperson_city ,comm,c.cnum as customer_id,cname,c.city as customer_city,
rating,onum,amt,odate
from salespeople s join customer c on s.snum=c.snum join orders o on o.cnum=c.cnum

select * from sp_cust_ord

--use of view is not writing again and again join
select sname,round(SUM(amt*comm),2) as 'total comm' from sp_cust_ord
group by sname;

--Triggers(auto programs based on events)
--events-update,insert,delete

select SUM(amt) from orders1 where cnum=2002
select * from customer
alter table customer add total_sales decimal(18,2)

update customer
set total_sales=(select SUM(amt) from orders1 where cnum=2002)
where cnum=2002

select SUM(amt) from orders1 where cnum=2002

--program to update based on event
declare @mycursor cursor;
declare @mycnum int;
begin
	set @mycursor=CURSOR FOR
	select cnum from customer

	open @mycursor
	fetch next from @mycursor into @mycnum

	while @@FETCH_STATUS=0
	begin
		update customer
		set total_sales=(select SUM(amt) from orders1 where cnum=@mycnum)
		where cnum=@mycnum
		fetch next from @mycursor into @mycnum
	end;

	close @mycursor;
	deallocate @mycursor;

end;

select * from customer;

--creating trigger for automatic updation of total_sales after inserting into orders
create trigger update_amount on orders1
after insert as
begin
set nocount on;
declare @amt decimal(10,2);
declare @cnum int;
select @cnum=cnum,@amt=amt from inserted
update customer set total_sales=total_sales+@amt where customer.cnum=@cnum;
end;
go

insert into orders1 values(3015,5000,'2024-02-16',2001);

select * from customer

select * from orders1

--trigger for update


create trigger update_amount5 on orders1
after update as
begin
set nocount on;
declare @amt decimal(10,2);
declare @cnum int;
declare @old_amt decimal(10,2);

select @old_amt=amt from deleted
select @cnum=cnum ,@amt=amt from inserted
update customer 
set total_sales=total_sales-@old_amt+@amt
where customer.cnum=@cnum
end;
go

update orders1 set amt=4000 where onum=3015
select * from customer

--trigger for delete
create trigger update_amount_7 on orders1
after delete as
begin 
set nocount on;
declare @old_amt decimal(10,2);
declare @cnum int;
select @cnum=cnum,@old_amt=amt from deleted
update customer set total_sales=total_sales-@old_amt where
customer.cnum=@cnum;
end;
go

delete from orders1 where onum=3015;

select * from customer;
select * from orders1;

--multiple inserts
insert into orders values (3015,5000,'2024-02-11',2001),(3020,...)

--stored procedures



