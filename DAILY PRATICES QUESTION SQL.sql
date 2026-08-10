-- 1 CREATING A DATABASE
Create database Company_DB;
-- 2 CREATING A TABLE 
create table employees(
	emp_id 	INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender CHAR(1) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    department VARCHAR(50)
    );
-- 3  INSERTING DATA

INSERT INTO employees(emp_id, first_name, last_name, gender, salary, department) Values
	(101,'Prashant','Kumar','M','55000','IT'),
    (102,'Rahul', 'Sharma','M','48000','HR'),
    (103,'Priya','Singh','F','62000','Finance'),
    (104,'Aman','Verma','M','51000','Sales'),
    (105,'Neha','Gupta','F','59000','IT');
    
-- 4 Display the record
select * from employees;    

-- 5 Display all details of employees whose department is IT.
select * from employees where department = 'IT';
-- 6 Display all employees whose salary is greater than 50,000.
select * from employees where department <> 'IT';

-- 7  Display all employees who:
-- belong to the IT department AND
-- have a salary greater than 55,000.

select * from employees where department = 'IT' AND salary > 55000;

-- 8  Display all employees who:
-- belong to the IT department OR
-- belong to the HR department.

select * from employees where department IN ('IT','HR');

-- 9 Display all employees who:
-- are in the IT department OR
-- are in the HR department

select * from employees where department IN ('IT','HR') AND salary > 50000;
-- 10 Display all employees whose salary is between 50,000 and 60,000 (inclusive).
select * from employees where salary NOT between 50000 and 60000;

-- 11 Display all employees whose department is IT, HR, or Finance.
select * from employees where department NOT IN ('IT','HR');

-- 12 Display all employees whose first name starts with the letter P.
select * from employees WHERE first_name LIKE '_r%';

-- 13 Display all employees, sorted by salary in ascending order (lowest salary first).
select * from employees order by salary ASC;

-- 14 Display all employees, sorted by salary in descending order (highest salary first).
select * from employees order by salary desc;

-- 15 Display the top 3 highest-paid employees.
select * from employees order by salary DESC LIMIT 3 ;
-- 16 Display the 2nd and 3rd highest-paid employees.

select * from employees order by salary DESC limit 2 offset 1;

-- 17 Find the total number of employees in the employees table.
select count(*) from employees;

-- 18 Count the number of employees whose department is NOT NULL.
select count(*) from employees where department IS NOT null;

-- 19 Find the total salary of all employees.
select min(salary) from employees;

-- 20 Display the number of employees in each department.
select count(department) from employees group by department;

-- 21 Display the average salary of each department.
select department, avg(salary) AS avg_salary from employees group by department;

-- 22 Display the highest salary in each department.
select department,max(salary) as max_salary from employees group by department;

-- 23 Display only those departments where the maximum salary is greater than 55,000.

SELECT department, MAX(salary) AS max_sal
FROM employees
GROUP BY department
HAVING MAX(salary) > 55000;

-- 24 ABOVE TOP 30 QUESTIONN
-- both question pratice one time more
-- Display only those departments that have more than 1 employee.
select department, count(*) from employees group by department having count(*) > 1; 

-- 25 Display the number of employees in each department, sorted by the employee count in descending order
select department, count(*) AS total_eemployee from employees group by department order by count(*) DESC;

-- 26 Count the number of employees for each department and gender.
select department,gender,count(*) AS no_emp from employees group by department, gender;

-- 27 Show the departments where male ('M') employees have an average salary greater than 50,000.
select department,avg(salary) AS emp_sal from employees where gender = 'M' group by department having avg(salary) > 50000;


-- 28 DISTINCT QUESTION
-- Display all unique department names from the employees table.
select distinct department from employees;

-- 29 Find the total number of unique departments in the employees table.
select count(distinct department) as UNIQUE_DEP from employees;

-- IS NULL
-- 30 Display all employees whose department is NULL.
select * from employees where department is null;

-- 31 Update Rahul's salary to ₹52,000.
UPDATE employees
SET salary = 52000
WHERE first_name = 'Priya';

-- 32 Delete the employee Aman from the employees table.
delete from employees where first_name = 'Aman';

-- 33 Add a new column named email to the employees table.
ALTER TABLE employees ADD COLUMN email varchar(50);

-- 34 Remove the email column from the employees table. 
ALTER TABLE employees DROP COLUMN email;

-- 35 Rename the column first_name to fname.
ALTER table employees RENAME column first_name TO fname;

-- 36 Change the salary column from:
ALTER TABLE employees modify column salary  DECIMAL(12,2); 

-- 37 Rename the column department to dept and keep its data type as VARCHAR(50).
ALTER TABLE employees CHANGE COLUMN department dept VARCHAR(50);


-- JOIN QUESTION 

-- 38 Create the departments table
Create table department(
	dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
    );
    
-- 39 insert Data into departments
INSERT INTO department (dept_id,dept_name)
	values(1,'IT'),
		  (2,'HR'),
          (3,'Finance'),
          (4,'Sales');

-- 40 Add a new column named dept_id to the employees table.
ALTER TABLE employees ADD COLUMN dept_id INT;

-- 41 Update Prashant's dept_id to 1.
UPDATE employees SET dept_id = 1 WHERE fname = 'Prashant';
 -- 42 Now update the other employees' dept_id values.
 
 UPDATE employees SET dept_id = CASE
	WHEN fname = 'Rahul' then 2
	when fname = 'Priya' then 3
    WHEN fname = 'Aman' then 4
    WHEN fname = 'Neha' then 1
END
where fname IN ('Rahul','Priya','Aman','Neha');

-- Inner join
-- 43 using an INNER JOIN between: employees, departments
Select e.fname,
	   d.dept_name
	From employees e
    INNER JOIN department d
    on e.dept_id = d.dept_id;
    
-- left join
-- 44 Display all employees along with their department names, even if an employee does not have a matching department.
Select e.fname,
	   d.dept_name 	
	from employees e LEFT JOIN department d
on e.fname = d.dept_id;

-- Right Join
-- 45 Display all departments, including those that have no employees.
select e.fname, d.dept_name
	from employees e RIGHT JOIN department d
on d.dept_id = d.dept_id;

-- 46 Display the employee name and department name. (INNER JOIN)

select e.fname, d.dept_name
	from employees e
    INNER JOIN department d
on e.dept_id = d.dept_id;
Select * from employees;
-- 47 Display all employees, even if they don't have a department. (LEFT JOIN)
select e.fname, d.dept_name
from employees e 
LEFT JOIN department d
ON e.dept_id = d.dept_id;

-- 48 Display: Employee Name Department Name Salary using an INNER JOIN.
select e.fname, d.dept_name, e.salary
from employees e INNER JOIN department d
on e.dept_id = e.dept_id;

-- 04/08/2026

-- 49 Display: Employee Name (fname) Department Name (dept_name) Only for employees who work in the IT department.
select e.fname, d.dept_name
from employees e 
Inner join department d
on e.dept_id = d.dept_id
where d.dept_name = 'IT';

-- 50 Display: fname salary, dept_name,Only employees whose salary is greater than 50000.
select e.fname, d.dept_name, salary
from employees e 
Inner join department d
on e.dept_id = d.dept_id
where salary > 50000;

-- 51 Display: fname dept_name salary Only employees who work in the IT department and have a salary greater than 55,000.
select e.fname, d.dept_name, salary
from employees e 
inner join department d
on e.dept_id = d.dept_id
where dept_name = 'IT' AND salary > 55000;

-- 52 Display: fname, dept_name, salary ,Only employees who work in either IT or HR departments and whose salary is greater than 50,000
select e.fname,
       d.dept_name,	
       e.salary
from employees e 
Inner join department d
on e.dept_id = d.dept_id 
where dept_name in ('IT','HR') and e.salary > 50000;

-- 53 Display: fname dept_name salary Show only employees who are in the IT or Finance department and whose salary is between 50000 and 60000.

select e.fname,
	   d.dept_name,
       e.salary
from employees e 
Inner join department d 
on e.dept_id = d.dept_id
where d.dept_name IN ('IT','Finance') AND Salary between 50000 and 60000;

-- 54 Display: fname, dept_name, salary
-- Show employees who:
-- belong to the IT, HR, or Finance department,
-- have a salary greater than or equal to 50,000,
-- and sort the results by salary in descending order.
select e.fname, d.dept_name, e.salary
from employees e
inner join department d
on e.dept_id = d.dept_id
where d.dept_name IN ('IT','HR','Finance') 
AND e.salary >= 50000 order by e.salary desc;

-- 55 Display: dept_name 
-- Total number of employees in each department.

select d.dept_name 
from employees e
inner join department d
on e.dept_id = d.dept_id
where count(*) group by d.dept_name order by employees;

-- 56 Display: d.dept_name AVG(e.salary) as avg_salary
-- Show only those departments whose average salary is greater than 55,000.
select d.dept_name, AVG(e.salary) as avg_salary 
from employees e
inner join department d
on e.dept_id = d.dept_id
group by dept_name having avg(e.salary) > 550000;

-- 57 Display Department Name Total Salary of each department
select dept_name, sum(e.salary) as total_sal
from employees e
inner join department d
on e.dept_id = d.dept_id
group by d.dept_name;

-- 58 Display: dept_name SUM(e.salary) as total_salary
-- Show only those departments whose total salary is greater than 100000.
select dept_name, SUM(e.salary) as total_salary
from employees e
inner join department d
on e.dept_id  = d.dept_id
group by dept_name having  sum(e.salary) >100000;

-- 59 Display: dept_name COUNT(*) as total_emp
-- Show only those departments that have more than 1 employee.

select dept_name, count(*) as total_emp
from employees e
inner join department d
on e.dept_id = d.dept_id
group by dept_name having count(*) > 1;

-- 60 Display: dept_name COUNT(*) AS total_emp
-- Conditions:
-- Consider only employees whose salary is greater than 50,000.
-- Then display only those departments having more than 1 employee.

select dept_name, count(*) as total_emp
from employees e
inner join department d
on e.dept_id = d.dept_id
 where salary > 50000 group by dept_name having count(*) > 1;
 
-- 61 Display: dept_name AVG(e.salary) as avg_salary
-- Conditions:
-- Consider only employees whose salary is greater than or equal to 50,000.
-- Show only departments whose average salary is greater than 55,000.
-- Sort by avg_salary in descending order.
select dept_name, Avg(e.salary) as avg_salary
from employees e
INNER JOIN department d
on e.dept_id = d.dept_id
where salary >= 50000 group by dept_name having avg(e.salary) > 55000
order by avg_salary desc;

05/08/2026


-- 62 Display: dept_name MAX(e.salary) AS highest_salary
-- Sort the result by highest_salary in descending order.
select dept_name, MAX(e.salary) AS highest_salary
from employees e
Inner join department d
on e.dept_id = d.dept_id
group by dept_name having highest_salary
order by highest_salary DESC;

-- 63 -- Display: dept_name MIN(e.salary) AS lowest_salary
-- Show only those departments whose lowest salary is greater than 50,000. 

select dept_name, MIN(e.salary) as lowest_salary
from employees e
inner join department d
on e.dept_id = d.dept_id
group by dept_name having min(e.salary) > 50000
order by lowest_salary DESC;

-- 64 Display: dept_name ,COUNT(*) AS total_emp ,AVG(e.salary) AS avg_salary
-- Conditions
-- Show only departments:
-- having more than 2 employees, and
-- having an average salary greater than 55,000.

SELECT d.dept_name,
       COUNT(*) AS total_emp,
       AVG(e.salary) AS avg_salary
FROM employees e
INNER JOIN department d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name
HAVING COUNT(*) > 2
   AND AVG(e.salary) > 55000
ORDER BY avg_salary DESC;

-- 65 Display: dept_name COUNT(*) AS total_emp MAX(e.salary) AS highest_salary
-- Conditions 
-- Consider only employees whose salary is greater than 50,000.
-- Show only departments having at least 2 employees.
-- Sort by highest_salary in descending order.

select dept_name, COUNT(*) as total_emp, MAX(e.salary) as highest_salary
from employees e
inner join department d
on e.dept_id = d.dept_id
where e.salary > 50000
group by d.dept_name having count(*) >= 2
order by highest_salary DESC; 

-- 65 Question Display: dept_name AVG(e.salary) AS avg_salary COUNT(*) AS total_emp
-- Conditions:- 
-- Consider only employees in the IT and HR departments.
-- Show only departments whose average salary is greater than 55,000.
-- Sort by avg_salary in descending order.

select dept_name, AVG(e.salary) AS avg_salary, count(*) AS  total_emp
from employees e
inner join department d
on e.dept_id = d.dept_id
where d.dept_name IN ('IT','HR')
group by d.dept_name  having avg(e.salary) > 55000
order by avg_salary DESC; 

-- 66 Display: dept_name COUNT(*) AS total_emp AVG(e.salary) AS avg_salary MAX(e.salary) AS highest_salary
-- Conditions
-- Consider only employees whose salary is between 50000 and 70000.
-- Show only departments having at least 2 employees.
-- Show only departments whose average salary is greater than 55000.
-- Sort by highest_salary in descending order.

select dept_name, count(*) as total_emp, Avg(e.salary) AS avg_salary, max(e.salary) as highest_salary
from employees e
inner join department d
on e.dept_id = d.dept_id
where e.salary between 50000 and 70000
group by d.dept_name HAVING COUNT(*) >= 2
   AND AVG(e.salary) > 55000
order by highest_salary DESC;

-- 67 Display: fname dept_name
-- Show all employees, even if they are not assigned to any department.

select fname, dept_name
from employees e
left join department d
on e.dept_id = d.dept_id;

-- 68 Display: fname dept_name
-- Show only those employees who are not assigned to any department.

select fname, dept_name
from employees e
left join department d
on e.dept_id = d.dept_id
where d.dept_name is NULL;

-- 69 Display: fname, dept_name
-- Show only employees who are assigned to a department.

select fname, dept_name
from employees e
left join department d
on e.dept_id = d.dept_id
where d.dept_name is not null;

-- 70 Display: fname, salary, dept_name
-- Show all employees, even if they don't belong to any department.
-- Sort the result by salary in descending order.

select fname,dept_name, salary
from employees e
left join department d
on e.dept_id = d.dept_id 
order by e.salary desc;

-- 71 Display: dept_name, COUNT(e.emp_id) AS total_employees
-- Show every department, even if no employee works there.

select dept_name, count(e.emp_id) AS total_employees
from employees e
left join department d
on d.dept_id = e.dept_id
group by d.dept_name
order by d.dept_name;

-- 72 Display: dept_name
-- Show only those departments that have no employees.

select dept_name
from department d
left join employees e
on d.dept_id = e.dept_id
where e.emp_id is null;

-- 73 dept_name fname
-- Show all departments, including departments with no employees.

select dept_name ,fname
from department d
left join employees e
on d.dept_id = e.dept_id;

-- Right Join

-- 74  Display: fname dept_name
-- Show all departments, even if no employee belongs to them.

SELECT e.fname,
       d.dept_name
FROM employees e
RIGHT JOIN department d
ON e.dept_id = d.dept_id;  


-- 75 Display: fname, dept_name
--  Show all employees, even if they are not assigned to any department.

select fname, dept_name
from department d
right join employees e
on e.dept_id = d.dept_id;

-- 76 Add new column manager_id for self join
alter table employees 
add column manager_id int;

-- 77 inserting the data into manager_id
UPDATE employees
SET manager_id = NULL
WHERE emp_id = 101;

UPDATE employees
SET manager_id = 102
WHERE emp_id IN (105);

UPDATE employees
SET manager_id = 101
WHERE emp_id IN (102,103);

SELECT emp_id,
       fname,
       manager_id
FROM employees;
select * from employees;

-- 78 now we will start self join

-- Display: Employee Name 
-- Manager Name

SELECT e.fname AS Employee_Name,
       m.fname AS Manager_Name
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.emp_id;

-- 79 Display:
-- Employee Name
-- Employee Salary
-- Manager Name
-- Manager Salary

select e.fname as employee_name,
	   e.salary as employee_name,
       m.fname as manager_name,
       m.salary as manager_salary
       from employees e
       inner join employees m
       on e.manager_id = m.emp_id;
       ;

-- 80 Display: Employee Name Manager Name
-- Show only employees whose salary is greater than their manager's salary.
select e.fname as employee_name,
	   m.fname as manager_name
       from employees e 
       inner join employees m
       on e.manager_id = m.emp_id
       where e.salary > m.salary;
       
-- 81 Display: Employee Name Manager Name
-- Show only employees whose manager is Prashant.
select e.fname as employee_Name,
	   m.fname as manager_name
       from employees e
       inner join employees m
       on e.manager_id = m.emp_id
       where m.fname = 'Prashant';
       
-- 82 Display: employee_nam, employee_salary, manager_name, manager_salar
-- Show only employees whose salary is less than their manager's salary.

select e.fname as employee_Name,
	   e.salary as employee_Name,
       m.fname as manager_Name,
       m.salary as manager_salary
       from employees e
       inner join employees m
       on e.manager_id = m.emp_id	
where e.salary > m.salary;

-- 83 Display: employee_name, manager_name
-- Show employees whose manager is Rahul.

SELECT e.fname AS employee_name,
       m.fname AS manager_name
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.emp_id
WHERE m.fname = 'Rahul';

-- 84 Display: employee_name manager_name
-- Show employees whose manager's salary is greater than 55000.

select e.fname as employee_name,
	   m.fname as manager_name
from employees e
INNER JOIN employees m
on e.manager_id = m.emp_id
where m.salary > 55000;      

-- 85  Display: employee_name, manager_name, employee_salary, manager_salary
-- Show only employees whose manager earns more than the employee .
select e.fname as employee_name,
	   m.fname as manager_name,
       e.salary as employee_salary,
       m.salary as manager_salary
from employees e
inner join employees m
on e.manager_id = m.emp_id
where e.salary < m.salary;

-- Today

-- 86 Display the employee name and manager name for employees who have a manager.
SELECT e.fname AS employee_name,
       m.fname AS manager_name
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.emp_id;

-- 87  Display the employee name and manager name for employees who do NOT have a manager.
select e.fname as employee_name,
	   m.fname as manager_name
from employees e
left join employees m
on e.manager_id = m.manager_id
where e.manager_id IS NULL;

-- 88 Display all employees and their manager names, including employees who do NOT have a manager.
select e.fname as employee_name,
	   m.fname as manager_name
from employees e
left join employees m
on e.manager_id = m.emp_id
where e.manager_id = m.emp_id IS null;

-- NOW WE HAVE TO START CROSS JOIN --
-- 89 Display every possible combination of employee names and department names.
SELECT e.fname,
	   d.dept_name
from employees e
CROSS join department d;

-- 90 Suppose you want to create all possible combinations of employee names
-- and department names, but only for departments IT and HR.

SELECT e.fname,
       d.dept_name
FROM employees e
CROSS JOIN department d
WHERE d.dept_name IN ('IT', 'HR');

-- 91 Display every possible combination of employee names 
-- and department names, but only for the IT department.

select e.fname,
	   d.dept_name
from employees e
cross join department d
where dept_name = 'IT';

-- Now we have to start SUBQUERIES

-- 92 Display employees whose salary is greater than the average salary of all employees.
Select fname, salary
FROM employees
where salary > (
	SELECT avg(salary)
    from employees);
    
-- 93 Display the employee name and salary of the employee who has the highest salary.
select fname, salary
from employees
where salary = ( 
	select max(salary)
    from employees);
    
-- 94 Display all employees whose salary is greater than the average salary.
select fname, salary
	from employees
where salary > (
	select avg(salary) 
    from employees);

-- 95 Display the employee name and salary of employees who earn the same salary as Rahul
select fname, salary 
	from employees
where salary  = (
select salary from employees
where fname = 'Rahul');

-- 96 Display the employees who work in the same departments as Rahul.
select fname, dept_id
from employees 
	where dept_id IN (
select dept_id from employees
where fname = 'Rahul');

-- 97 Display employees whose salary is greater than the salary of Prashant.
select fname, salary
from employees
where salary > (
select max(salary) from employees
	where fname = 'Prashant');

-- 98 Display employees whose salary is less than the highest salary in the company.
select fname, salary 
from employees 
where salary < (
select max(salary) from employees);

-- 99 Display employees whose salary is equal to the lowest salary in the company.

select fname, salary
from employees
where salary = (
select min(salary) from employees);

-- 100 Display employees whose salary is greater than the salary of Rahul.
select fname, salary 
from employees
where salary > (
select salary from employees where fname = 'Rahul');

-- 101 Display employees whose salary is greater
-- than or equal to the average salary of all employees.

select fname, salary 
from employees 
where salary >= (
select avg(salary) from employees
);

-- 102 Display employees whose salary is less than the average salary of all employees.
select fname, salary 
from employees 
where salary < (
select avg(salary) from employees);
    
-- 103  Display the names of employees.
-- who work in either the IT department or the HR department using UNION.
