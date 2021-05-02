/*
 *  #178: Rank Scores
 *  Write a SQL query to rank scores.
 *  If there is a tie between two scores, both should have the same ranking.
 */
WITH Scores AS
(
    SELECT 1 AS Id, 3.50 AS Score
    UNION
    SELECT 2, 3.65
    UNION
    SELECT 3, 4.00
    UNION
    SELECT 4, 3.85
    UNION
    SELECT 5, 4.00
    UNION
    SELECT 6, 3.65
)
SELECT s.Score, COUNT(1) AS Rank
FROM Scores AS s CROSS JOIN (SELECT DISTINCT Score FROM Scores) AS ds
WHERE s.Score <= ds.Score
GROUP BY s.Id, s.Score
ORDER BY 2 ASC;

