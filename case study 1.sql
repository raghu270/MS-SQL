create database casestudy;

use casestudy;

select * from fact;
select * from location;
select * from product;

--1. Display the number of states present in the LocationTable

select count(distinct state) as count_states from location;

--2. How many products are of regualar type

select COUNT(*) from product where TYPE='regular';

--3. How much spending has been done on marketing of product ID 1?

select sum(marketing) as sum_marketing from fact  where productid=1;

--4. What is the minimum sales of a product

select min(sales) as minimum_sales from fact;

--5. Display the max Cost of Good Sold (COGS).

select max(cogs) as max_cogs from fact;

--6. Display the details of the product where product type is coffee.

select * from product where product_type='coffee';

--7. Display the details where total expenses are greater than 40

select * from fact where total_expenses > 40;

--8. What is the average sales in area code 719?

select avg(sales) as average_sales from fact where area_code=719;

--9. Find out the total profit generated by Colorado state.

select sum(profit) as total_profit from fact where area_code in 
(select area_code from location where state='colorado');

--10. Display the average inventory for each product ID.

select productid,avg(inventory) as average_inventory from fact group by productid order by productid;

--11. Display state in a sequential order in a Location Table.

select state from location order by state;

--12. Display the average budget of the Product where the average budget margin should be greater than 100

select avg(budget_margin) as avereage_budget,productid from fact group by productid
having avg(budget_margin)>100;

--13.What is the total sales done on date 2010-01-01?

select sum(sales) as total_sales from fact where date='2010-01-01';

--14.Display the average total expense of each product ID on an individual date.

select avg(total_expenses) as avg_total_expenses ,productid,date from fact 
group by productid,date order by date,productid;

--15.Display the table with the following attributes 
--such as date, productID, product_type, product, sales, profit, state, area_code

select date,f.productid,product_type,product,sales,profit,state,l.area_code from fact f
inner join product p on f.productid=p.productid
inner join location l on l.area_code=f.area_code

--16.Display the rank without any gap to show the sales wise rank.

select sales,Dense_rank() over(order by sales desc) as 'rank_no' from fact;

--17.Find the state wise profit and sales

select state,sum(profit) as total_profit,sum(sales) as total_sales from location l inner join fact f 
on l.area_code=f.area_code group by state;

--18. Find the state wise profit and sales along  with the product name

select state,sum(profit) as total_profit,sum(sales) as total_sales,product from location l
inner join fact f on l.area_code=f.area_code
inner join product p on p.productid=f.productid
group by state,product order by state;

--19.If there is an increase in sales of 5%, calculate the increasedsales.

select sales, sales+sales*0.05 as increased_sales from fact;

--20.Find the maximum profit along with the product ID and product type

select max(profit) as maximum_profit,p.productid,product_type from fact f 
inner join product p
on p.productid=f.productid
group by p.productid,product_type order by p.productid

--21.Create a stored procedure to fetch the result according to the product type from Product Table.

create procedure ptype @prod_type varchar(20) as
select * from Product where Product_Type=@prod_type

exec ptype @prod_type='coffee'

--22.Write a query by creating a condition in which if the total expenses is less than 60 then it is a profit or else loss.

SELECT total_expenses, iif(total_expenses<60 ,'Profit','Loss') as 'profitloss' from fact;

--23.Give the total weekly sales value with the date and product ID details. Use roll-up to pull the data in hierarchical order.

select datepart(week,date) Week, productid, sum(sales) weekly_sale
from fact
group by rollup(datepart(week,date), ProductId)

--24.Apply union and intersection operator on the tables which consist of attribute area code.

select area_code from fact 
union select area_code from location

select area_code from fact 
intersect select area_code from location


--25.Create a user-defined function for the product table to fetch a particular
--product type based upon the user�s preference.

CREATE FUNCTION PRO_TYPE(@PROD_TYP VARCHAR(20))
returns TABLE
AS
return (SELECT * FROM Product WHERE Product_Type = @PROD_TYP)

SELECT * FROM PRO_TYPE('COFFEE');

--26.Change the product type from coffee to tea where product ID is 1 and undo it.

begin transaction
update product set product_type='tea' where productid=1

rollback

select * from product

--27. Display the date, product ID and sales where total expenses are
--between 100 to 200.

select DATE,productid ,sales from fact where Total_Expenses between 100 and 200;

--28.Delete the records in the Product Table for regular type.

delete from product where type='regular'

--29.Display the ASCII value of the fifth character from the columnProduct

select product ,ascii(substring(product,5,1)) as ascii_values  from product
























