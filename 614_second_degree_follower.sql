/*
 *  #614: Second Degree Follower
 *  On Facebook, there is a follow table with two columns: followee, follower.
 *  Write a query to get the amount of each follower’s follower, if he/she has one.
 *  
 */
WITH follow AS
(
    SELECT 'A' AS followee, 'B' AS follower
    UNION
    SELECT 'B', 'C'
    UNION
    SELECT 'B', 'D'
    UNION
    SELECT 'D', 'E'
)
SELECT f1.follower, COUNT(DISTINCT f2.follower) AS num
FROM follow AS f1 INNER JOIN follow AS f2
ON f1.follower = f2.followee
GROUP BY f1.follower
ORDER BY f1.follower ASC;