create database casestudy2;

use casestudy2;

CREATE TABLE LOCATION (
  Location_ID INT PRIMARY KEY,
  City VARCHAR(50)
);

INSERT INTO LOCATION (Location_ID, City)
VALUES (122, 'New York'),
       (123, 'Dallas'),
       (124, 'Chicago'),
       (167, 'Boston');

select * from LOCATION;

  CREATE TABLE DEPARTMENT (
  Department_Id INT PRIMARY KEY,
  Name VARCHAR(50),
  Location_Id INT,
  FOREIGN KEY (Location_Id) REFERENCES LOCATION(Location_ID)
);

INSERT INTO DEPARTMENT (Department_Id, Name, Location_Id)
VALUES (10, 'Accounting', 122),
       (20, 'Sales', 124),
       (30, 'Research', 123),
       (40, 'Operations', 167);

	   CREATE TABLE JOB (
  Job_ID INT PRIMARY KEY,
  Designation VARCHAR(50)
);

select * from DEPARTMENT;


CREATE TABLE JOB
(JOB_ID INT PRIMARY KEY,
DESIGNATION VARCHAR(20))


INSERT  INTO JOB VALUES
(667, 'CLERK'),
(668,'STAFF'),
(669,'ANALYST'),
(670,'SALES_PERSON'),
(671,'MANAGER'),
(672, 'PRESIDENT')

select * from JOB;

CREATE TABLE EMPLOYEE
(EMPLOYEE_ID INT,
LAST_NAME VARCHAR(20),
FIRST_NAME VARCHAR(20),
MIDDLE_NAME CHAR(1),
JOB_ID INT FOREIGN KEY
REFERENCES JOB(JOB_ID),
MANAGER_ID INT,
HIRE_DATE DATE,
SALARY INT,
COMM INT,
DEPARTMENT_ID  INT FOREIGN KEY
REFERENCES DEPARTMENT(DEPARTMENT_ID))

INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','JOHN','Q',667,7902,'17-DEC-84',800,NULL,20),
(7499,'ALLEN','KEVIN','J',670,7698,'20-FEB-84',1600,300,30),
(7505,'DOYLE','JEAN','K',671,7839,'04-APR-85',2850,NULl,30),
(7506,'DENNIS','LYNN','S',671,7839,'15-MAY-85',2750,NULL,30),
(7507,'BAKER','LESLIE','D',671,7839,'10-JUN-85',2200,NULL,40),
(7521,'WARK','CYNTHIA','D',670,7698,'22-FEB-85',1250,500,30)

select * from EMPLOYEE;

--Simple queries

--1. List all the employee details.

select * from EMPLOYEE;

--2. List all the department details.

select * from DEPARTMENT;

--3. List all job details.

select * from JOB;

--4. List all the locations.

select * from LOCATION;

--5. List out the First Name, Last Name, Salary, Commission for all Employees.

select first_name,last_name,salary,comm from EMPLOYEE;

--6. List out the Employee ID, Last Name, Department ID for all employees and alias
--Employee ID as "ID of the Employee", Last Name as "Name of the
--Employee", Department ID as "Dep_id".

select employee_id as 'id of the employee' ,last_name as 'name of the employee' ,department_id as 'dep_id' 
from employee;

--7. List out the annual salary of the employees with their names only.

select salary*12 as 'annual salary',last_name,first_name from EMPLOYEE;


--WHERE Condition

--1. List the details about "Smith".

select * from EMPLOYEE where LAST_NAME='smith';

--2. List out the employees who are working in department 20.

select * from EMPLOYEE where DEPARTMENT_ID=20;

--3. List out the employees who are earning salaries between 3000 and 4500.

select * from EMPLOYEE where SALARY between 3000 and 4500;

--4. List out the employees who are working in  department 10 or 20.

select * from EMPLOYEE where DEPARTMENT_ID in (10,20);

--5. Find out the employees who are not working  in department 10 or 30

select * from EMPLOYEE where DEPARTMENT_ID not in (10,30);

--6. List out the employees whose name starts with 'S'.

select * from EMPLOYEE where first_NAME like 's%';

--7. List out the employees whose name starts with 'S' and ends with 'H'.

select * from EMPLOYEE where first_NAME like 's%h';

--8. List out the employees whose name length is 4 and start with 'S'.

select * from EMPLOYEE where FIRST_NAME like 's%' and LEN(first_name )=4;

--9. List out employees who are working in department 10 and draw salaries more than 3500.

select * from EMPLOYEE where DEPARTMENT_ID=20 and SALARY>3500;

--10. List out the employees who are not receiving commission.

select * from EMPLOYEE where COMM is null;

--ORDER BY Clause

--1. List out the Employee ID and Last Name in ascending order based on the Employee ID.

select EMPLOYEE_id,last_name from EMPLOYEE order by EMPLOYEE_ID;

--2. List out the Employee ID and Name in descending  order based on salary.

select EMPLOYEE_id,first_name,last_name  from employee order by salary desc;

--3. List out the employee details according to their Last Name in ascending-order.

select * from EMPLOYEE order by LAST_NAME ;

--4.. List out the employee details according to their Last Name in ascending
--order and then Department ID in descending order.

select * from EMPLOYEE order by LAST_NAME,DEPARTMENT_ID desc;

--GROUP BY and HAVING Clause:

--1. How many employees are in different departments in the organization?

select department_id,COUNT(employee_id) as 'No of Employees' from EMPLOYEE group by DEPARTMENT_ID;

--2. List out the department wise maximum salary, minimum salary and
--average salary of the employees.

select DEPARTMENT_id, MAX(salary) as 'max salary',MIN(salary) as 'min salary',AVG(salary) as 'avg salary'
from EMPLOYEE group by DEPARTMENT_id;

--3. List out the job wise maximum salary, minimum salary and average salary of the employees.

select job_id, MAX(salary) as 'max salary',MIN(salary) as 'min salary',AVG(salary) as 'avg salary'
from EMPLOYEE group by job_id;

--4. List out the number of employees who joined each month in ascending order.

select MONTH(hire_date) as 'month', COUNT(MONTH(hire_date)) as 'No of count' from EMPLOYEE group by MONTH(hire_date)
order by month(hire_date);

--5. List out the number of employees for each month and year in
--ascending order based on the year and month.

select MONTH(hire_date) as month,YEAR(hire_date) as year ,count(hire_date)  as 'No of count' from employee 
group by MONTH(hire_date),YEAR(hire_date) order by month(hire_date),year(hire_date)

--6. List out the Department ID having at least four employees.

select department_id,COUNT(department_id) as 'No of count' from EMPLOYEE group by DEPARTMENT_ID 
having COUNT(department_id)>=4

--7. How many employees joined in the month of January?

select COUNT(employee_id) as 'total employee joined in january '
from employee where MONTH(hire_date)=1

--8. How many employees joined in the month of January or September?

select COUNT(employee_id) as 'total employee joined in january or september' 
from EMPLOYEE where MONTH(hire_date) in (1,9)

--9. How many employees joined in 1985?

select YEAR(hire_date), COUNT(employee_id) as 'total employee joined in 1985'
from EMPLOYEE group by YEAR(hire_date)
having YEAR(hire_date)=1985

--10. How many employees joined each month in 1985?

select year(hire_date) as year ,month(hire_date) as month,COUNT(month(hire_date)) as count_of_employee from EMPLOYEE 
group by month(hire_date),YEAR(hire_date)
having YEAR(hire_date)=1985

--11. How many employees joined in March 1985?

select year(hire_date) as year,month(hire_date) as month ,COUNT(employee_id) as 'count of employee in march 1985' from EMPLOYEE
group by year(hire_date),month(hire_date) having YEAR(hire_date)=1985 and MONTH(HIRE_DATE)=3


--12. Which is the Department ID having greater than or equal to 3 employees
--joining in April 1985?

select year(hire_date) as year,month(hire_date) as month ,DEPARTMENT_id ,
COUNT(employee_id) as count from employee group by YEAR(HIRE_DATE),MONTH(hire_date),DEPARTMENT_ID
having YEAR(hire_date)=1985 and MONTH(hire_date)=4 and COUNT(employee_id)>=3

--JOINS

--1. List out employees with their department names.

select employee_id,first_name,last_name ,name from EMPLOYEE e inner join
DEPARTMENT d on e.DEPARTMENT_ID=d.Department_Id

--2. Display employees with their designations.

select employee_id ,first_name,last_name ,designation from EMPLOYEE e inner join
JOB j on j.Job_ID=e.JOB_ID

--3. Display the employees with their department names  and regional groups.

select e.*,name,city from EMPLOYEE e inner join DEPARTMENT d 
on e.DEPARTMENT_ID=d.Department_Id inner join LOCATION l 
on l.Location_ID=d.Location_Id

--4. How many employees are working in different departments? Display with department names.

select COUNT(employee_id) as 'No of Employee',name from EMPLOYEE e
inner join DEPARTMENT d on e.DEPARTMENT_ID=d.Department_Id group by name

--5. How many employees are working in the sales department?

select COUNT(employee_id) 'no of employee in sales department' ,name from EMPLOYEE e
inner join DEPARTMENT d on e.DEPARTMENT_ID=d.Department_Id  where name='sales' group by Name 

--6. Which is the department having greater than or equal to 5 employees?
--Display the department names in ascending order

select name ,COUNT(employee_id) as 'no of employee' from EMPLOYEE e
inner join DEPARTMENT d on e.DEPARTMENT_ID=d.Department_Id  group by name having COUNT(employee_id)>=5
order by name;

--7. How many jobs are there in the organization? Display with designations.

select COUNT(j.job_id) as 'No of Jobs',designation from EMPLOYEE e inner join JOB j on e.job_ID=j.job_Id
group by designation

--8. How many employees are working in "New York"?

select COUNT(employee_id) as 'no of employee',city from EMPLOYEE e inner join DEPARTMENT d
on e.DEPARTMENT_ID=d.Department_Id inner join LOCATION l on d.Location_Id=l.Location_ID
where city='new york' group by City;

--9. Display the employee details with salary grades. Use conditional statement to
--create a grade column.

select employee_id,first_name,last_name ,
case
when salary >2000 then 'A'
when salary=2000 then 'B'
else 'C'
end as 'salary grade'
from employee;

--10. List out the number of employees grade wise. Use conditional statement to
--create a grade column

select COUNT(employee_id) 'count of employee',
case
when salary >2000 then 'A'
when salary=2000 then 'B'
else 'C'
end salary_grade
from EMPLOYEE group by 
case
when salary >2000 then 'A'
when salary=2000 then 'B'
else 'C'
end 

--11.Display the employee salary grades and the number of employees
--between 2000 to 5000

select employee_id,first_name,last_name ,case
when salary >2000 then 'A'
when salary=2000 then 'B'
else 'C'
end salary_grade from EMPLOYEE;

select COUNT(employee_id) as count from EMPLOYEE where SALARY 
between 2000 and 5000;

--12. Display all employees in sales or operation departments.

select employee_id,name from EMPLOYEE e inner join DEPARTMENT d
on e.DEPARTMENT_ID=d.Department_Id where Name in ('sales','operations')
group by employee_id,name;

--Set Operators

--1. List out the distinct jobs in sales and accounting departments.

(SELECT distinct job_id
FROM employee
WHERE department_id = (SELECT department_id FROM department WHERE name = 'Sales'))
UNION
(SELECT distinct job_id
FROM employee
WHERE department_id = (SELECT department_id FROM department WHERE name = 'Accounting'));

--2. List out all the jobs in sales and accounting departments.

(SELECT DISTINCT job_id
FROM employee
WHERE department_id = (SELECT department_id FROM department WHERE name = 'Sales'))
UNION ALL
(SELECT DISTINCT job_id
FROM employee
WHERE department_id = (SELECT department_id FROM department WHERE name = 'Accounting'));


--3. List out the common jobs in research and accounting departments

(SELECT distinct job_id
FROM employee
WHERE department_id = (SELECT department_id FROM department WHERE name = 'research'))
intersect
(SELECT job_id
FROM employee
WHERE department_id = (SELECT department_id FROM department WHERE name = 'Accounting'));

 
--Subqueries

--1. Display the employees list who got the maximum salary.

select * from employee where salary=(select MAX(salary) from employee);

--2. Display the employees who are working in the sales department.

select * from employee where department_id=(select department_id from DEPARTMENT where Name='sales');

--3. Display the employees who are working as 'Clerk'.

select * from EMPLOYEE where JOB_ID=(select JOB_ID from JOB where Designation='clerk');

--4. Display the list of employees who are living in "New York".

select * from EMPLOYEE where DEPARTMENT_ID=(select department_id from DEPARTMENT where Location_Id=
(select Location_Id from LOCATION where City='new york'));

--5. Find out the number of employees working in the sales department.

select COUNT(employee_id) as 'No of employee' from EMPLOYEE where DEPARTMENT_ID=
(select DEPARTMENT_ID from DEPARTMENT where Name ='sales');

--6. Update the salaries of employees who are working as clerks on the basis of 10%

update EMPLOYEE set SALARY=SALARY+0.1*SALARY where JOB_ID=
(select JOB_ID from JOB where Designation='clerk');

--7. Delete the employees who are working in the accounting department.

delete from EMPLOYEE where DEPARTMENT_ID=(
select DEPARTMENT_ID from DEPARTMENT where Name='accounting');

--8. Display the second highest salary drawing employee details.

select * from EMPLOYEE where SALARY=(
select MAX(salary) from EMPLOYEE where SALARY <(select MAX(salary) from EMPLOYEE));

--9. Display the nth highest salary drawing employee details.

SELECT *
FROM employee e1
WHERE (n - 1) = (
    SELECT COUNT(DISTINCT e2.salary)
    FROM employee e2
    WHERE e2.salary > e1.salary
);

--10. List out the employees who earn more than every employee in department 30.

SELECT *
FROM employee
WHERE salary > All(SELECT salary FROM employee WHERE department_id = 30);


--11. List out the employees who earn more than the lowest salary in department.

SELECT e.*
FROM employee e
JOIN (
    SELECT department_id, MIN(salary) AS lowest_salary
    FROM employee
    GROUP BY department_id
) dept_salaries ON e.department_id = dept_salaries.department_id
WHERE e.salary > dept_salaries.lowest_salary;


--12. Find out which department has no employees.  

select department_id ,name from DEPARTMENT
where Department_Id not in(select distinct Department_Id from EMPLOYEE);

--13. Find out the employees who earn greater than the average salary for their department

SELECT e.*
FROM employee e
JOIN (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employee
    GROUP BY department_id
) dept_avg ON e.department_id = dept_avg.department_id
WHERE e.salary > dept_avg.avg_salary;

 


























