-- CREATING A DATABASE
Create database Company_DB;
-- CREATING A TABLE 
create table employees(
	emp_id 	INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender CHAR(1) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    department VARCHAR(50)
    );
-- INSERTING DATA

INSERT INTO employees(emp_id, first_name, last_name, gender, salary, department) Values
	(101,'Prashant','Kumar','M','55000','IT'),
    (102,'Rahul', 'Sharma','M','48000','HR'),
    (103,'Priya','Singh','F','62000','Finance'),
    (104,'Aman','Verma','M','51000','Sales'),
    (105,'Neha','Gupta','F','59000','IT');
    
-- Display the record
select * from employees;    

-- Display all details of employees whose department is IT.
select * from employees where department = 'IT';
-- Display all employees whose salary is greater than 50,000.
select * from employees where department <> 'IT';

-- Display all employees who:
-- belong to the IT department AND
-- have a salary greater than 55,000.

select * from employees where department = 'IT' AND salary > 55000;

-- Display all employees who:
-- belong to the IT department OR
-- belong to the HR department.

select * from employees where department IN ('IT','HR');

-- Display all employees who:
-- are in the IT department OR
-- are in the HR department

select * from employees where department IN ('IT','HR') AND salary > 50000;
-- Display all employees whose salary is between 50,000 and 60,000 (inclusive).
select * from employees where salary NOT between 50000 and 60000;

-- Display all employees whose department is IT, HR, or Finance.
select * from employees where department NOT IN ('IT','HR');

-- Display all employees whose first name starts with the letter P.
select * from employees WHERE first_name LIKE '_r%';

-- Display all employees, sorted by salary in ascending order (lowest salary first).
select * from employees order by salary ASC;

-- Display all employees, sorted by salary in descending order (highest salary first).
select * from employees order by salary desc;

-- Display the top 3 highest-paid employees.
select * from employees order by salary DESC LIMIT 3 ;
-- Display the 2nd and 3rd highest-paid employees.

select * from employees order by salary DESC limit 2 offset 1;

-- Find the total number of employees in the employees table.
select count(*) from employees;

-- 👉 Count the number of employees whose department is NOT NULL.
select count(*) from employees where department IS NOT null;

-- Find the total salary of all employees.
select min(salary) from employees;

-- 👉 Display the number of employees in each department.
select count(department) from employees group by department;

-- Display the average salary of each department.
select department, avg(salary) AS avg_salary from employees group by department;

-- 👉 Display the highest salary in each department.
select department,max(salary) as max_salary from employees group by department;

-- Display only those departments where the maximum salary is greater than 55,000.

SELECT department, MAX(salary) AS max_sal
FROM employees
GROUP BY department
HAVING MAX(salary) > 55000;

-- Display only those departments that have more than 1 employee.
select 