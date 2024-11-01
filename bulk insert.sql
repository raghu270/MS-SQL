use retail
exec sp_columns salespeople

--if we are in another database and you need to access table in another database
select * from retail.dbo.salespeople;

--Bulk insert
create table cust
(custno varchar(10) not null primary key,
firstname varchar(30) not null,
lastname varchar(30) not null,
age int,
profession varchar(100)
);

select * from cust

bulk insert cust
from 'C:\custs.txt'
with (fieldterminator=',',
rowterminator='\n');

select * from cust
select * from cust where age>60

--Another table 
create table sales
(txnno varchar(10) not null primary key,
txndate varchar(10),
custno varchar(10) foreign key references cust(custno),
amount numeric(8,2),
category varchar(50),
product varchar(50),
city varchar(50),
state varchar(50),
spendby varchar(20));

select * from sales;

bulk insert sales
from 'C:\txn.txt'
with(
fieldterminator=',',
rowterminator='\n'
);

select * from sales;