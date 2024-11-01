use assignment2;

select * from Jomato;

--Tasks:

--1. Create a stored procedure to display the restaurant name, type and cuisine where the
--table booking is not zero.

go
create procedure display
as 
select RestaurantName,RestaurantType,CuisinesType from Jomato
where TableBooking='yes';
go

execute display;

--2. Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result
--and rollback it.

Begin transaction;
update Jomato
set CuisinesType='cafeteria'
where CuisinesType='cafe';

select * from Jomato;

Rollback Transaction;

--3. Generate a row number column and find the top 5 areas with the highest rating of
--restaurants.

select * from(
select area,restaurantname ,rating,ROW_NUMBER() over (order by rating desc) row_num  from Jomato)t
where row_num<=5;

--4. Use the while loop to display the 1 to 50

declare @start int;
set @start=1;
while(@start < =50)
begin
print @start
set @start=@start+1
end

--5. Write a query to Create a Top rating view to store the generated top 5 highest rating of
--restaurants.

create view TopRating as
select * from(
select area,restaurantname ,rating,ROW_NUMBER() over (order by rating desc) row_num  from Jomato)t
where row_num<=5;


--6. Write a trigger that sends an email notification to the restaurant owner whenever a new
--record is inserted

create trigger email_notification on jomato
after insert as 
begin 
set nocount on;
declare @owneremail nvarchar(50);
select @owneremail=email from inserted;
declare @subject nvarchar(max)='New Record Inserted'
declare @body nvarchar(max)='A new record has been inserted in the table'

EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'YourProfileName',
@recipients = @OwnerEmail,
@subject = @subject,
@body = @body;

end;