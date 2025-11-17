USE batch61;

CREATE TABLE emp (
    empno INT,
    empname VARCHAR(20) NOT NULL,
    empjob VARCHAR(15) NOT NULL,
    MSalary INT
);

INSERT INTO emp VALUES
(1, "Anand", "Software", 1000),
(2, "Govind", "Developer", 5000),
(3, "Ravi", "Tester", 3000),
(4, "Meena", "Manager", 8000);

SELECT * FROM emp;

SELECT empname, empjob, MSalary FROM emp;

SELECT * FROM emp WHERE empjob = "Developer";

SELECT * FROM emp WHERE empjob = "Developer" OR empjob = "Manager";

SELECT * FROM emp WHERE empname LIKE "%a%";

SELECT * FROM emp WHERE MSalary BETWEEN 2000 AND 6000;

SELECT * FROM emp ORDER BY MSalary;

SELECT * FROM emp ORDER BY MSalary DESC;

SELECT * FROM emp ORDER BY MSalary DESC LIMIT 2;

SELECT empname, empjob, MSalary,
       ((MSalary/100)*20) + (MSalary*12) AS Annual_Package
FROM emp;

SELECT DISTINCT empjob FROM emp;
