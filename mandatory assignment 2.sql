use assignment2;

select * from jomato;

Tasks:

--1. Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick
--Chicken Bites’.

create function StuffChickenIntoQuickBites3(@foodType varchar(50))
returns varchar(50)
as 
begin
declare @result varchar(50);
set @result='Quick'+@foodType+'Bites'
return @result
end;

select dbo.StuffChickenIntoQuickBites3('chicken');

--2.Use the function to display the restaurant name and cuisine type which has the
--maximum number of rating.

select RestaurantName,CuisinesType ,rating from jomato
where rating=(select MAX(rating) from jomato);

--3. Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4
--start rating, ‘Good’ if it has above 3.5 and below 5 star rating, ‘Average’ if it is above 3
--and below 3.5 and ‘Bad’ if it is below 3 star rating.

alter table jomato 
add RatingStatus varchar(20);

update Jomato 
set RatingStatus=
case
when Rating>4 then 'Excellent'
when Rating>3.5 and Rating <=4 then 'Good'
when Rating >3 and Rating <=3.5 then 'Average'
else 'Bad'
end

--4. Find the Ceil, floor and absolute values of the rating column and display the current date
--and separately display the year, month_name and day.

-- Ceil, floor, and absolute values of the rating column

select CEILING(rating) as ceil_value_of_rating ,floor(rating) as floor_value_of_rating ,
abs(rating) as absolute_value_of_rating from Jomato;


-- Display the current date, year, month name, and day

SELECT 
    GETDATE() AS 'current_date',
    YEAR(GETDATE()) AS year,
    Datename(month,GETDATE()) AS month_name,
    DAY(GETDATE()) AS day;

--5. Display the restaurant type and total average cost using rollup.

select coalesce(RestaurantType,'Total') as 'Restaurant Type',sum(AverageCost) as 'Total average Cost' 
from jomato group by RestaurantType with rollup;


