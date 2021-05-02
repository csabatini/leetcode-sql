/*
 *  #577: Employee Bonus
 *  Write a query that outputs all employees with a bonus less than $1000
 */
WITH Employee AS
(
    SELECT 3 AS empId, 'Brad' AS name, null AS supervisor, 4000 AS salary
    UNION
    SELECT 1, 'John', 3, 1000
    UNION
    SELECT 2, 'Dan', 3, 2000
    UNION
    SELECT 4, 'Thomas', 3, 4000
),
Bonus AS
(
    SELECT 2 AS empId, 500 AS bonus
    UNION
    SELECT 4, 2000
)
SELECT e.name, b.bonus
FROM Employee AS e LEFT OUTER JOIN Bonus AS b
ON e.empId = b.empId
WHERE b.bonus IS NULL OR b.bonus < 1000;
