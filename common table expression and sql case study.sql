use retail;

--common table expression(cte)
--single query
CREATE TABLE Employees
(
  EmployeeID int NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  ManagerID int NULL
)

INSERT INTO Employees VALUES (1, 'Ken', 'Thompson', NULL)
INSERT INTO Employees VALUES (2, 'Terri', 'Ryan', 1)
INSERT INTO Employees VALUES (3, 'Robert', 'Durello', 1)
INSERT INTO Employees VALUES (4, 'Rob', 'Bailey', 2)
INSERT INTO Employees VALUES (5, 'Kent', 'Erickson', 2)
INSERT INTO Employees VALUES (6, 'Bill', 'Goldberg', 3)
INSERT INTO Employees VALUES (7, 'Ryan', 'Miller', 3)
INSERT INTO Employees VALUES (8, 'Dane', 'Mark', 5)
INSERT INTO Employees VALUES (9, 'Charles', 'Matthew', 6)
INSERT INTO Employees VALUES (10, 'Michael', 'Jhonson', 6) 

select * from Employees;

--self join
select a.employeeid,CONCAT(a.firstname,' ',a.LastName) as emp_name ,coalesce(a.managerid,0) as manager_id,
IIF(a.managerid is null,'CEO',concat(b.firstname,' ',b.lastname)) as manager_name from Employees a left outer join Employees b on
a.ManagerID=b.employeeid

 select * from Employees where ManagerID is null

 --cte
 WITH
  cteReports (EmpID, FirstName, LastName, MgrID, EmpLevel)
  AS
  (
    SELECT EmployeeID, FirstName, LastName, ManagerID, 1
    FROM Employees
    WHERE ManagerID IS NULL
    UNION all
    SELECT e.EmployeeID, e.FirstName, e.LastName, e.ManagerID, 
      r.EmpLevel + 1
    FROM Employees e
      INNER JOIN cteReports r
        ON e.ManagerID = r.EmpID
  )


SELECT
  FirstName + ' ' + LastName AS FullName, 
  EmpLevel,
  IIF(emplevel = 1, 'CEO',(SELECT FirstName + ' ' + LastName FROM Employees 
    WHERE EmployeeID = cteReports.MgrID)) AS Manager
FROM cteReports 
ORDER BY EmpLevel, MgrID


--sql case statement
select 
sum(case when odate = '1996-10-03' then amt else 0 end) as total_03,
sum(case when odate = '1996-10-04' then amt else 0 end) as total_04
from orders