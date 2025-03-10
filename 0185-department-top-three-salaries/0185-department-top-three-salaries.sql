# Write your MySQL query statement below
SELECT
Department,
Employee,
Salary
FROM (SELECT
d.name as Department,
e.name as Employee,
e.salary as Salary,
DENSE_RANK() OVER (PARTITION BY d.name ORDER BY e.salary DESC) salary_rank
FROM Employee as e
LEFT JOIN Department as d
ON e.departmentId = d.id) as new
WHERE salary_rank IN (1,2,3);
