use retail
--creating procedure
go
create procedure display_customer
as
select * from customer;
go
execute display_customer;

go 
create procedure proc1
@name nvarchar(50),
@city nvarchar(50)
as
set nocount on;
select * from customer
where cname=@name and city=@city;
go

--executing procedure
exec proc1 'hoffman','london'

go
create procedure update_customer_total_sales
as
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
go

exec update_customer_total_sales;

select * from customer;

--creating rule
create rule cityname
as @city in ('london','rome')

--binding the rule
exec sp_bindrule 'dbo.cityname','customer.city';

insert into customer values(5000,'mark','mumbai',200,1001,0);

--unbinding the rule
exec sp_unbindrule 'customer.city';

delete from customer where cnum=5000
