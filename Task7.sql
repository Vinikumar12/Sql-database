/*View definitions and usage examples:

CREATE VIEW with complex queries, demonstrate how they’re used, and show how they provide abstraction and security. The outcome is mastering the idea of reusable SQL logic.*/
eg:
CREATE VIEW EmployeeDept AS
SELECT e.name, d.department_name
FROM Employees e
JOIN Departments d ON e.dept_id = d.id;
