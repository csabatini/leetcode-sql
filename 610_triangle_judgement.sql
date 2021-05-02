/*
 *  #610: Triangle Judgement
 *  Write a query to judge whether these three sides can form a triangle
 */
WITH triangle AS
(
    SELECT 13 AS x, 15 AS y, 30 AS z
    UNION
    SELECT 10, 20, 15
)
SELECT x,
    y,
    z,
    CASE
        WHEN valid_x + valid_y + valid_z = 3 THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM (SELECT x,
    y,
    z,
    CASE
        WHEN y + z > x THEN 1
        ELSE 0
    END AS valid_x,
    CASE
        WHEN x + z > y THEN 1
        ELSE 0
    END AS valid_y,
    CASE
        WHEN x + y > z THEN 1
        ELSE 0
    END AS valid_z
FROM triangle) t;