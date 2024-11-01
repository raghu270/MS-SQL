use retail;
select * from employee;

--alter table commands
create table emp(emp_id int,emp_name varchar(10));

--add column
alter table emp add salary int;
select * from emp;

--add primary key
--if we not given not null then go for 1 otherwise not required
alter table emp alter column emp_id int not null;
alter table emp add primary key(emp_id);

insert into emp values(1,'r',20000)
insert into emp values(2,'s',30000)
insert into emp values(3,'e',40000)
select * from emp;

--delete column
alter table emp drop column city;

--add column
alter table emp add bonus int;

update emp 
set bonus=salary*0.1;

--add foreign key
alter table table_name add foreign key(column_name) references another_table_name(column_name)





