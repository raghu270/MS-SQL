use retail

select * from salespeople;
select * from customer;
select * from orders1;

--find orders of such customers who are living in london

select * from customer c join orders o on o.cnum=c.cnum where city='london';
--this approach is gonna waste lots of memory by joining two tables

--subquery approach

select onum,odate,cnum,amt from orders1 where cnum in(
select cnum from customer where city='london') order by odate desc;		

--find the customer details whose avg order value is above 2000
select * from orders1
select *  from customer where cnum in(
select cnum  from orders1 group by cnum having AVG(amt)>2000);

--nested sub queries
--find orders placed by customers whose salesperson living in london
--instead of joining three tables we go for
select onum,odate,cnum,amt from orders1 where cnum in(
select cnum from customer where snum in
(select snum from salespeople where city = 'london'))
order by odate desc;

--Rank function
create table student(name varchar(10))
insert into student values('A'),('C'),('C'),('B'),('B'),('D'),('E')
select * from student

select name, RANK() over(order by name) as 'rank_no' from student ;

--print the second rank

select name,rank_no
from (select name, RANK() over(order by name) as 'rank_no' from student ) abc where rank_no=2

--print top 5 rank holders

select name,rank_no 
from (select name, RANK() over(order by name) as 'rank_no' from student ) abc where rank_no<=5

--Dense Rank() function (for no skipping)

--print the second rank

select name,rank_no
from (select name, Dense_RANK() over(order by name) as 'rank_no' from student ) abc where rank_no=2

--print top 5 rank holders

select name,rank_no 
from (select name, Dense_RANK() over(order by name) as 'rank_no' from student ) abc  where rank_no<=5

--limit command has some disadvantages

--new table
create table rank_table2 (name varchar(10),value int)

insert into rank_table2 values('A',90),('B',80),('C',100),('D',40),('E',60)

select * from rank_table2

select name ,value,RANK() over (order by value desc) as 'rank_no' from rank_table2

--find 2nd rank
select name,value,rank_no from
(select name ,value,RANK() over (order by value desc) as 'rank_no' from rank_table2) abc1 where rank_no=2

--find max rank
select name,value,rank_no from
(select name ,value,RANK() over (order by value desc) as 'rank_no' from rank_table2) abc1 where rank_no=(
select MAX(rank_no) from 
(select name ,value,RANK() over (order by value desc) as 'rank_no' from rank_table2) abc1)

--find min rank
select name,value,rank_no from
(select name ,value,RANK() over (order by value desc) as 'rank_no' from rank_table2) abc1 where rank_no=(
select Min(rank_no) from 
(select name ,value,RANK() over (order by value desc) as 'rank_no' from rank_table2) abc1)





