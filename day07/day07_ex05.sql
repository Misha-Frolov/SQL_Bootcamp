/*
Please write a simple SQL query that returns a list of 
unique person names who have placed orders at any pizzerias. 
The result should be sorted by person name.

Denied constructions:
GROUP BY, any type (UNION,...) working with sets
*/

SELECT DISTINCT p.name
FROM person_order
  JOIN person p ON p.id = person_order.person_id
ORDER BY 1;