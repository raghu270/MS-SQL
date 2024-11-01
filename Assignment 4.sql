use assignment;

--1. Use the inbuilt functions and find the minimum, maximum and average amount from the orders tab

select MIN(amount) as 'min amount',MAX(amount) as 'max amount',AVG(amount) as 'avg amount' from orders;

--2. Create a user-defined function which will multiply the given number with 10

create function multiply(@num int)
returns int
as begin
return (@num * 10)
end;

select dbo.multiply(10);

--3. Use the case statement to check if 100 is less than 200, greater than 200 or equal to 200
--and print the corresponding value

select 
case
when 100<200 then '100 is less than 200'
when 100>200 then '100 is greater than 200'
else '100 is equal to 200'
end

--4.4. Using a case statement, find the status of the amount. Set the status of the
--amount as high amount, low amount or medium amount based upon the condition.

select amount,
case
when amount > 5000 then 'high amount'
when amount  between 1000 and 5000 then 'medium amount'
else 'low amount'
end as status
from orders

--5. Create a user-defined function, to fetch the amount greater than then given input

select * from orders;
create function greater(@num int)
returns table 
as
return (select amount from orders where amount > @num);


select * from  dbo.greater (2000);


