--Q2
SELECT last_name, salary
FROM employees
ORDER BY salary DESC
FETCH FIRST 3 ROWS ONLY;
--Q3
SELECT l.location_id
FROM locations l
LEFT JOIN departments d ON l.location_id = d.location_id
WHERE d.location_id IS NULL;
--Q4
SELECT e.last_name
FROM employees e
WHERE EXISTS (
  SELECT 1
  FROM employees c
  WHERE c.department_id = e.department_id
    AND c.hire_date > e.hire_date
    AND c.salary > e.salary
); 
--Q5
SELECT employee_id, last_name, salary
FROM employees
WHERE salary < (SELECT AVG(salary) FROM employees)
ORDER BY salary DESC;
--Q6
SELECT e.last_name, d.department_id, e.job_id, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.location_id = 1700;
--Q7
SELECT *
FROM employees
WHERE salary > (SELECT MAX(salary) FROM employees WHERE department_id = 90);
--Q8
SELECT department_id
FROM departments
MINUS
SELECT department_id
FROM employees
WHERE job_id = 'SA_REP';
--Q9
SELECT country_id, country_name
FROM countries
MINUS
SELECT country_id, country_name
FROM countries
WHERE country_id NOT IN (
    SELECT DISTINCT country_id
    FROM departments
);
--Q10
CREATE TABLE EMP2 (
  ID NUMBER(7) PRIMARY KEY,
  LAST_NAME VARCHAR2(25),
  FIRST_NAME VARCHAR2(25),
  DEPT_ID NUMBER(7),
  COMMISSION NUMBER(10),
  CONSTRAINT FK_DEPT_ID FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENTS(DEPARTMENT_ID),
  CONSTRAINT CHK_COMMISSION CHECK (COMMISSION > 0)
);
--Q11
CREATE TABLE SAL_HISTORY (
  EMPLOYEE_ID NUMBER(6),
  HIRE_DATE DATE,
  SALARY NUMBER(8,2)
);
CREATE TABLE MGR_HISTORY (
  EMPLOYEE_ID NUMBER(6),
  MANAGER_ID NUMBER(6),
  SALARY NUMBER(8,2)
);
CREATE TABLE SPECIAL_SAL (
  EMPLOYEE_ID NUMBER(6),
  SALARY NUMBER(8,2)
);
--Q11 1
SELECT e.EMPLOYEE_ID, e.HIRE_DATE, e.SALARY, e.MANAGER_ID
FROM EMPLOYEES e
WHERE e.EMPLOYEE_ID < 125;
--Q11 2
INSERT INTO SPECIAL_SAL (EMPLOYEE_ID, SALARY)
SELECT EMPLOYEE_ID, SALARY
FROM EMPLOYEES
WHERE SALARY > 20000;
--Q11 3.1
INSERT INTO SAL_HISTORY (EMPLOYEE_ID, HIRE_DATE, SALARY)
SELECT EMPLOYEE_ID, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE SALARY < 20000;
--Q11 3.2
INSERT INTO MGR_HISTORY (EMPLOYEE_ID, MANAGER_ID, SALARY)
SELECT EMPLOYEE_ID, MANAGER_ID, SALARY
FROM EMPLOYEES
WHERE SALARY < 20000;
