/*
 *  #608: Tree Node
 *  Given a table tree, id is identifier of the tree node and p_id is its parent node's id.
 *  Write a query to print the node id and the type of the node. Sort your output by the node id.
 *  
 *             1
 *           /   \
 *         2       3
 *       /   \
 *     4       5
 */
WITH tree AS
(
    SELECT 1 AS id, null AS p_id
    UNION
    SELECT 2,1
    UNION
    SELECT 3,1
    UNION
    SELECT 4,2
    UNION
    SELECT 5,2
)
SELECT DISTINCT t1.id,
    CASE
        WHEN t1.p_id IS NULL THEN 'Root'
        WHEN t2.p_id IS NULL THEN 'Leaf'
        ELSE 'Inner'
    END AS Type
FROM tree AS t1 LEFT OUTER JOIN tree AS t2
ON t2.p_id = t1.id
ORDER BY t1.id;