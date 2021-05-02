/*
 *  #185: Department Top Three Salaries
 *  Write a query to find employees with the top three salaries per department.
 */
WITH Employee AS
(
    SELECT 1 AS Id, 'Joe' AS Name, 70000 AS Salary, 1 AS DepartmentId
    UNION
    SELECT 2, 'Henry', 80000, 2
    UNION
    SELECT 3, 'Sam', 60000, 2
    UNION
    SELECT 4, 'Max', 90000, 1
    UNION
    SELECT 5, 'Janet', 69000, 1
    UNION
    SELECT 6, 'Randy', 85000, 1
),
Department AS 
(
    SELECT 1 AS Id, 'IT' AS Name
    UNION
    SELECT 2, 'Sales'
)
SELECT Department, Employee, Salary
FROM
(SELECT d.Name AS Department,
  e.Name AS Employee,
  e.Salary,
  ROW_NUMBER() OVER (PARTITION BY d.Id ORDER BY e.Salary DESC) AS Rank
FROM Employee AS e INNER JOIN Department AS d
ON e.DepartmentId = d.Id) AS t
WHERE Rank <= 3;
