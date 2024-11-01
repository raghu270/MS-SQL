use assignment;
--1.Arrange the ‘Orders’ dataset in decreasing order

select * from orders order by amount desc;

--2. Create a table with the name ‘Employee_details1’ consisting of these
--columns: ‘Emp_id’, ‘Emp_name’, ‘Emp_salary’. Create another table with
--the name ‘Employee_details2’ consisting of the same columns as the first table.

create table employee_details1 (emp_id int not null,
emp_name varchar(50) not null,
emp_salary int);

create table employee_details2 (emp_id int not null,
emp_name varchar(50) not null,
emp_salary int);

insert into employee_details1 values(1,'p',25000),(2,'a',450000)

insert into employee_details2 values(1,'p',25000),(2,'h',450000),(3,'v',50000)

--3. Apply the UNION operator on these two tables

select * from employee_details1 
union	
select * from employee_details2

--to also retreive the duplicates
select * from employee_details1 
union all
select * from employee_details2

--4. Apply the INTERSECT operator on these two tables

select * from employee_details1
intersect
select * from employee_details2

--5. Apply the EXCEPT operator on these two tables

select * from employee_details1
except
select * from employee_details2

select * from employee_details2
except
select * from employee_details1



