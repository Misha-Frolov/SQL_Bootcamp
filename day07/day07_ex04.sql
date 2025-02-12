/*
Please write a SQL statement that returns the person's name 
and the corresponding number of visits to any pizzerias if 
the person has visited more than 3 times (> 3).

Denied construction: WHERE
*/

SELECT p.name,
  COUNT(*) AS count_of_visits
FROM person_visits pv
  JOIN person p ON pv.person_id = p.id
GROUP BY p.name
HAVING COUNT(*) > 3;