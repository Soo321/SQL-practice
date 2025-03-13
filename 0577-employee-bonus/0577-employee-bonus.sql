# Write your MySQL query statement below
SELECT 
name,bonus
FROM Employee
LEFT JOIN Bonus
ON Employee.empID=Bonus.empID
WHERE bonus IS NULL OR bonus<1000;