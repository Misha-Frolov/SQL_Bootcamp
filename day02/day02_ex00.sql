/*
Write a SQL statement that returns a list of pizzerias with 
the corresponding rating value that have not been visited by people.

Denied constructions:
NOT IN, IN, NOT EXISTS, EXISTS, UNION, EXCEPT, INTERSECT
*/

SELECT 
  name, 
  rating 
FROM 
  person_visits 
  RIGHT JOIN pizzeria ON pizzeria_id = pizzeria.id 
WHERE 
  pizzeria_id IS NULL 
ORDER BY 
  pizzeria_id