--Q1
SELECT JOB_ID,
       DECODE(JOB_ID, 'AD_PRES', 'A', 'ST_MAN', 'B', 'IT_PROG', 'C', 'SA_REP', 'D', 'ST_CLERK', 'E', '0') AS Grade
FROM employees;
--Q2
SELECT COUNT(DISTINCT MANAGER_ID) AS "Number of Managers"
FROM employees;
--Q3
SELECT manager_id AS "Manager Number", MAX(salary) AS "Highest Salary"
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MAX(salary) > 7000
ORDER BY MAX(salary) DESC;
--Q4
SELECT 
  e1.last_name AS "Employee Name", 
  e1.hire_date AS "Employee Hire Date", 
  m1.last_name AS "Manager Name", 
  m1.hire_date AS "Manager Hire Date"
FROM 
  employees e1,
  employees m1
WHERE 
  e1.manager_id = m1.employee_id
  AND e1.hire_date > m1.hire_date;
--Q5
SELECT e.last_name, e.job_id, e.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.location_id = (
    SELECT location_id
    FROM locations
    WHERE city = 'Toronto'
);
--Q6
SELECT e.last_name AS "Employee", e.employee_id AS "Emp ID",
       m.last_name AS "Manager", m.employee_id AS "Mgr ID"
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id;
--Q7
DESCRIBE JOB_GRADES;
SELECT e.last_name, e.job_id, d.department_name, e.salary, j.GRADE_LEVEL
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN JOB_GRADES j ON e.salary BETWEEN j.LOWEST_SAL AND j.HIGHEST_SAL;
--Q8
SELECT e.last_name AS "Employee Name", e.hire_date AS "Employee Hire Date",
       m.last_name AS "Manager Name", m.hire_date AS "Manager Hire Date"
FROM employees e
JOIN (
    SELECT employee_id, last_name, hire_date
    FROM employees
) m ON e.manager_id = m.employee_id
WHERE e.hire_date > m.hire_date;
