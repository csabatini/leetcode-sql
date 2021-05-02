/*
 *  #570: Managers with at Least 5 Direct Reports
 *  Write a query that finds the managers with at least 5 direct reports.
 */
WITH Employee AS
(
    SELECT 101 AS Id, 'John' AS Name, 'A' AS Department, NULL AS ManagerId
    UNION
    SELECT 102, 'Dan', 'A', 101
    UNION
    SELECT 103, 'James', 'A', 101
    UNION
    SELECT 104, 'Amy', 'A', 101
    UNION
    SELECT 105, 'Anne', 'A', 101
    UNION
    SELECT 106, 'Ron', 'B', 101
)
SELECT e2.Name
FROM Employee AS e1 INNER JOIN Employee AS e2
ON e1.ManagerId = e2.Id
GROUP BY e2.Id, e2.Name
HAVING COUNT(e1.Id) >= 5;
