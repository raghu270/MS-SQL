use assignment

--1. Create a view named ‘customer_san_jose’ which comprises of only those customers who are from San Jose

create view customer_san_jose
as 
select * from customer where city='san jose';

select * from customer_san_jose;

--2.Inside a transaction, update the first name of the customer to Francis where the last name is Jordan

begin transaction
update customer set first_name='francis'
where last_name='jordan'


--a. Rollback the transaction

rollback transaction;

--b. Set the first name of customer to Alex, where the last name is Jordan

begin transaction
update customer set first_name='alex'
where last_name='jordan'
commit  

--3. Inside a TRY... CATCH block, divide 100 with 0, print the default error message

begin try
declare @result int
set @result=100/0
end try
begin catch
print 'i cannot handle divide by zero'
print error_message()
end catch

--4. Create a transaction to insert a new record to Orders table and save it.

begin 
transaction
insert into orders values()
commit