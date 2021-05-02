/*
 *  #601: Human Traffic of Stadium
 *  Please write a query to display the records which have 3 or more consecutive
 *  rows and the amount of people more than 100 (inclusive).
 */
WITH stadium AS
(
    SELECT 1 AS id,TO_DATE('2017-01-01', 'YYYY-MM-DD') AS date,10 AS people
    UNION
    SELECT 2,TO_DATE('2017-01-02', 'YYYY-MM-DD'),109
    UNION
    SELECT 3,TO_DATE('2017-01-03', 'YYYY-MM-DD'),150
    UNION
    SELECT 4,TO_DATE('2017-01-04','YYYY-MM-DD'),99
    UNION
    SELECT 5,TO_DATE('2017-01-05','YYYY-MM-DD'),145
    UNION
    SELECT 6,TO_DATE('2017-01-06','YYYY-MM-DD'),1455
    UNION
    SELECT 7,TO_DATE('2017-01-07','YYYY-MM-DD'),199
    UNION
    SELECT 8,TO_DATE('2017-01-08','YYYY-MM-DD'),188
)
SELECT DISTINCT final.*
FROM stadium AS s1 INNER JOIN stadium AS s2
ON s2.id-1 = s1.id INNER JOIN stadium AS s3
ON s3.id-1 = s2.id INNER JOIN stadium AS final
ON final.id = s1.id
OR final.id = s2.id
OR final.id = s3.id
WHERE s1.people >= 100 AND s2.people >= 100 AND s3.people >= 100;
ORDER BY final.id ASC;
