--PART1
--Q1 There are four coding errors in the following statement. Identify and list them.
SELECT employee_id, last_name, salary * 12 as annual_salary
FROM employees;
--Q2 The HR department wants a query to display the last name, job ID, hiredate, and employee ID for each employee, with the employee ID appearing first. 
-- Provide an alias STARTDATE for the HIRE_DATE column. Write the necessary query statement.  
SELECT employee_id, last_name, job_id, hire_date AS startdate
FROM employees;
--Q3 Write a query statement to display all unique job IDs from the EMPLOYEES table. 
SELECT DISTINCT job_id
FROM employees;
--PART2
--Q4 The HR department has requested a report of all employees and their job IDs. 
-- Write a query statement to display the last name concatenated with the job ID (separated by a comma and space) and name the column “Employee and Title”. 
SELECT last_name || ', ' || job_id AS "Employee and Title"
FROM employees;
--Q5 The HR department needs to find high-salary and low-salary employees. Write a query statement to display the last name and salary for all employees whose salary is NOT in the range $5,000 -- $12,000. 
SELECT last_name, salary
FROM employees
WHERE salary NOT BETWEEN 5000 AND 12000;
--Q6 Modify your statement from Question 5 to display the last name and salary of employees who earn between $5,000 and $12,000, and are in department 20 or 50.
-- Label the columns Employee and  Monthly Salary, respectively. 
SELECT last_name AS Employee, salary AS "Monthly Salary"
FROM employees
WHERE salary BETWEEN 5000 AND 12000 AND department_id IN (20, 50);
--Q7 Write a query statement to display the last name and hire date of all employees who were hired in 2002.
SELECT last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '01-JAN-2002' AND '31-DEC-2002';
--PART3
--Q8 Write a statement to display the last name and department ID of all employees in departments 20 or 50 in ascending alphabetical order by last name. 
SELECT last_name, department_id
FROM employees
WHERE department_id IN (20, 50)
ORDER BY last_name ASC;
--Q9  Write a statement to display the last name, salary, and commission percentage for all employees who earn commissions. 
-- Sort data in descending order of salary and commissions. Use the column’s numeric position in the ORDER BY clause. 
SELECT last_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY 2 DESC, 3 DESC;
--Q10 Write a statement to display the last names of all employees who have both an “a” and an “e” in their last name. 
SELECT last_name
FROM employees
WHERE last_name LIKE '%a%' AND last_name LIKE '%e%';
--Q11 Write a statement to display the last name, job, and salary for all employees whose job is a sales representative (SA_REP) or a stock clerk (ST_CLERK), and whose salary is not equal to $2,500, $3,500, or $7,000. 
SELECT last_name, job_id, salary
FROM employees
WHERE job_id IN ('SA_REP', 'ST_CLERK')
  AND salary NOT IN (2500, 3500, 7000);
--Q12 Write a statement to display the employee number, last name, salary, and salary increased by 15.5% (expressed as the nearest whole number, with column label New Salary) for each employee.
SELECT employee_id, last_name, salary, salary * 1.155 AS "New Salary"
FROM employees;
--Q13 Modify your query from Question 12 to add a column that subtracts the old salary from the new salary. Label the column Increase. 
SELECT employee_id, last_name, salary, salary * 1.155 AS "New Salary", 
(salary * 1.155) - salary AS Increase
FROM employees;
