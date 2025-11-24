 use batch61;
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);


CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);


CREATE TABLE Project (
    proj_id INT PRIMARY KEY,
    proj_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Employee_Project (
    emp_id INT,
    proj_id INT,
    PRIMARY KEY (emp_id, proj_id),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id),
    FOREIGN KEY (proj_id) REFERENCES Project(proj_id)
);
INSERT INTO Department VALUES 
(1, 'IT', 'Hyderabad'),
(2, 'HR', 'Delhi'),
(3, 'Finance', 'Mumbai');

INSERT INTO Employee VALUES 
(101, 'Alice', 60000, 1),
(102, 'Bob', 45000, 1),
(103, 'Charlie', 50000, 2),
(104, 'David', 70000, 3);

INSERT INTO Project VALUES 
(201, 'Payroll System', 3),
(202, 'Recruitment Portal', 2),
(203, 'Inventory App', 1);

INSERT INTO Employee_Project VALUES 
(101, 203),
(102, 203),
(103, 202),
(104, 201);

SELECT emp_name, salary
FROM Employee
WHERE salary > (SELECT AVG(salary) FROM Employee);

SELECT emp_name, salary, dept_id
FROM Employee e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
    WHERE dept_id = e.dept_id
);

SELECT emp_name
FROM Employee
WHERE emp_id IN (
    SELECT emp_id
    FROM Employee_Project
    WHERE proj_id IN (
        SELECT proj_id
        FROM Project
        WHERE dept_id = (SELECT dept_id FROM Department WHERE dept_name = 'IT')
    )
);

SELECT dept_name
FROM Department d
WHERE EXISTS (
    SELECT 1
    FROM Employee e
    WHERE e.dept_id = d.dept_id AND e.salary > 60000
);

SELECT dept_id, emp_name, salary
FROM (
    SELECT emp_id, emp_name, salary, dept_id,
           RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rnk
    FROM Employee
) AS ranked
WHERE rnk = 1;


