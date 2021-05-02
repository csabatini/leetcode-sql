/*
 *  #580: Count Student Number in Departments
 *  Write a query for the number of students majoring in each department
 *  Sort your results by descending number of students and department name.
 */
SELECT d.dept_name, COUNT(s.student_id) AS student_number
FROM department AS d LEFT OUTER JOIN student AS s
ON d.dept_id = s.dept_id
GROUP BY d.dept_id, d.dept_name
ORDER BY 2 DESC, 1 ASC;
