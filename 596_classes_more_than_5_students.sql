/*
 *  #596: Classes More Than 5 Students
 *  Write a query that outputs all classes with 5 or more students
 */
SELECT class
FROM courses
GROUP BY 1
HAVING COUNT(DISTINCT student) >= 5;
