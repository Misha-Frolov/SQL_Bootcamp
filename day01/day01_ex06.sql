/*
Let's go back to Exercise #03 and modify our SQL statement 
to return person names instead of person identifiers 
and change the order by action_date in ascending mode 
and then by person_name in descending mode.
*/

SELECT 
  person_order.order_date AS action_date, 
  person.name AS person_name 
FROM 
  person_order 
  INNER JOIN person ON person_order.person_id = person.id 
INTERSECT 
SELECT 
  person_visits.visit_date AS action_date, 
  person.name AS person_name 
FROM 
  person_visits 
  INNER JOIN person ON person_visits.person_id = person.id 
ORDER BY 
  action_date, 
  person_name DESC;
