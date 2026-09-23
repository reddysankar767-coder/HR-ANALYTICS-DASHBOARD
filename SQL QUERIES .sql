 USE [HR DATA1]
 SELECT * FROM [dbo].[Employee]

 ---SQL QUERIES----

 --1. Find the total number of employees.

 select COUNT(*) as emp_count from Employee

 --2. Find the number of employees who left the company.

 select COUNT(*) as emp_count
 from Employee
 where Attrition='1'

 --3.Find the number of employees who in company
 
 select COUNT(*) as emp_count
 from Employee
 where Attrition='0'
 
 --4.Find the overall attrition rate.

  SELECT 
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS Attrition_Rate
FROM Employee;

--5. Find the number of employees in each department.

select Department,COUNT(*) as dept_count
from Employee
group by Department

--6.Find the number of employees in each job role.

select JobRole,COUNT(*) as job_count
from Employee
group by JobRole

--7.Find the total, average,highest and lowest salary

select
SUM(salary) as Total_salary,
AVG(salary) as Avg_salary,
MAX(salary) as highest_salary,
MIN(salary) as lowest_salry
from Employee

--8.Find attrition count by department.

select Department,COUNT(*) as attrtion_deptcount
from Employee
where Attrition=1
group by Department

--9.. Find attrition rate by department. 

SELECT 
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS Attrition_Rate
FROM Employee
GROUP BY Department;

--10.Find attrition rate by job role.

SELECT 
    JobRole,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS Attrition_Rate
FROM Employee
GROUP BY JobRole;

--11.Find attrition by business travel.

 SELECT 
    BusinessTravel,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS Attrition_Rate
FROM Employee
GROUP BY BusinessTravel;

--12.Find attrition by marital status.

 SELECT 
    MaritalStatus,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS Attrition_Rate
FROM Employee
GROUP BY MaritalStatus;

--13.Find employees who have been at the company for more than 10 years.

select  EmployeeID,FirstName,LastName
from Employee
where YearsAtCompany>10;


--14.Find employees who have not received a promotion for more than 5 years.

select FirstName,LastName
from Employee
where YearsSinceLastPromotion>5;

--15.Find job roles with more than 10 employees who left.

select JobRole,COUNT(*) as job_count
from Employee
where Attrition=1
group by JobRole
order by job_count desc;

--16.Find the highest-paid employee.

select top 1
FirstName,LastName,Salary
from Employee
order by Salary desc

--17.Find the highest-paid employee in each department.

with highest_paid1 as (

select 
EmployeeID,FirstName,LastName,department,salary,ROW_NUMBER() over (partition by department order by salary desc) as rn
from Employee
)
select * from highest_paid1
where rn=1

---20.Find the top 5 highest-paid employees.

with highest_paid as (
select 
EmployeeID,FirstName,LastName,department,salary,ROW_NUMBER() over (partition by employeeid order by salary desc) as rn
from Employee
)
select * from highest_paid
where rn=5

---21.Rank employees by salary within each department.

SELECT
    EmployeeID,
    Department,
    JobRole,
    Salary,
    RANK() OVER (
        PARTITION BY Department
        ORDER BY Salary DESC
    ) AS SalaryRank
FROM Employee;

--22 Fi nd employees which have no salary

select FirstName,LastName,Salary
from Employee
where Salary is null;

--23.Find the average salary by department.

select Department ,AVG(salary) as Avg_dept
from Employee
group by Department
order by Avg_dept desc
