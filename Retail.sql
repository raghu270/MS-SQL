create database retail;

use retail;

create table salespeople(
snum int not null,
sname varchar(30) not null,
city varchar(30) not null,
comm decimal(4,2) not null,
primary key(snum)
);

insert into salespeople values(1001,'peel','London',0.12);
select * from salespeople;
insert into salespeople values(1002,'serres','san jose',0.13);
insert into salespeople values(1004,'motika','London',0.11);
insert into salespeople values(1007,'rifkin','barcelona',0.15);
insert into salespeople values(1003,'axelrod','new york',0.10);
insert into salespeople values(1005,'fran','london',0.26);

create table customer(
cnum int not null,
cname varchar(30) not null,
city varchar(30) not null,
rating int not null,
snum int not null,
primary key(cnum),
foreign key(snum) references salespeople(snum)
);

insert into customer values(2001 ,'Hoffman', 'London', 100, 1001);
insert into customer values(2002 ,'Giovanni', 'Rome', 200, 1003);
insert into customer values(2003 ,'Liu' ,'San Jose', 200 ,1002);
insert into customer values(2004 ,'Grass', 'Berlin' ,300 ,1002);
insert into customer values(2006 ,'Clemens' ,'London' ,100, 1001);
insert into customer values(2008 ,'Cisneros' ,'San Jose', 300, 1007);
insert into customer values(2007 ,'Pereira', 'Rome' ,100 ,1004);

select * from customer;

create table orders1(
onum int not null,
amt decimal(7,2) not null,
odate date not null,
cnum int not null,
primary key(onum),
foreign key(cnum) references customer(cnum)
);

select * from orders1;

insert into orders1 values(3001 ,18.69 ,'1996-03-10' ,2008);
insert into orders1 values(3003 ,767.19 ,'1996-03-10', 2001 );
insert into orders1 values(3002 ,1900.10 ,'1996-03-10' ,2007); 
insert into orders1 values(3005 ,5160.45 ,'1996-03-10' ,2003 );
insert into orders1 values(3006 ,1098.16 ,'1996-03-10 ',2008 );
insert into orders1 values(3009 ,1713.23 ,'1996-04-10', 2002);
insert into orders1 values(3007 ,75.75 ,'1996-04-10' ,2002 );
insert into orders1 values(3008 ,4723.00 ,'1996-05-10' ,2006 );
insert into orders1 values(3010 ,1309.95 ,'1996-06-10', 2004 );
insert into orders1 values(3011 ,9891.88 ,'1996-06-10', 2006);





