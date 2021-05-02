/*
 *  #175: Combine Two Tables
 *  Write a query to provide information for each person in the Person table
 */
SELECT FirstName, LastName, City, State
FROM Person p LEFT OUTER JOIN Address a
ON p.PersonId = a.PersonId;
