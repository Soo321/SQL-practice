# Write your MySQL query statement below
SELECT 
s1.id as id,
IFNULL(s2.student, s1.student) as student
FROM Seat as s1
LEFT JOIN Seat as s2
ON IF( s1.id %2 = 0, s1.id = s2.id + 1, s1.id = s2.id - 1)