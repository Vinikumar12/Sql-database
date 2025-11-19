CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department_id INT,
    job_title VARCHAR(100),
    salary DECIMAL(10,2)
);

INSERT INTO employees(emp_id, emp_name, department_id, job_title, salary) VALUES
(1,'chenna',10,'developer',30000.0),
(2,'vijay',20,'backenddev',40000.0),
(3,'raju',30,'software',50000.0),
(4,'vikram',10,'developer',30500.0),
(5,'rithvik',20,'backenddev',40000.0),
(6,'ramu',30,'software',50000.0);

SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id;

SELECT department_id, COUNT(*) AS employee_count
FROM employees
GROUP BY department_id;

SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;

SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 70000;

SELECT department_id, COUNT(DISTINCT job_title) AS unique_jobs
FROM employees
GROUP BY department_id;

SELECT department_id,
       COUNT(*) AS employee_count,
       SUM(salary) AS total_salary,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;
