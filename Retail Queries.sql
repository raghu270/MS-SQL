use retail;

select * from salespeople;

--find all the salesperson who are living in London
select snum,sname,city from salespeople where city='London';

--find all the salesperson who are living in London and Newyork
select * from salespeople where city='london' or city='New york';

--By using in clause
select * from salespeople where city in ('London','New york');

--and should meet both the conditions
--or either one of the condition must be true

--find all the salespeople whoo residing in london and charge less than 15% comm
select * from salespeople where city='London' and comm < 0.15;

--find all the salespeople who are charging comm between 10% and 15%
select * from salespeople where comm >=0.10 and comm<=0.15;

--By using between clause
select * from salespeople where comm between 0.10 and 0.15;

--pattern searching using like (anywhere)
--% sign means any number of data
select * from salespeople where city like '%san%';

--beginning pattern search
--print all the names who are starting with letter p
select * from salespeople where sname like 'p%';

--ending pattern search
--print all the names which are ending with letter n
select * from salespeople where sname like '%n';

--string functions
--upper function
select upper(sname),upper(city) from salespeople;

--lower function
select lower(city) from  salespeople;

--to get the column name
select lower(city) as 'city in uppercase' from salespeople;

--Trim function
--used for removing the leading and last spaces
select trim(' helloworld');

--substring function
--1-start ,3-no of places you want to read
select substring('hello',1,3);
select substring(city,1,4) from salespeople;

--sum function
select sum(comm) from salespeople;

--average function
select avg(comm) from salespeople;

--count function
select count(comm) from salespeople;

--concat function
--combining two strings into a single string
select concat('mark','zuckerberg');

select * from customer;








