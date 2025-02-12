/*
Please modify an SQL statement from Exercise 00 and return 
a person name (not an identifier). Additional clause is we 
need to see only top 4 people with maximum visits in each 
pizzerias and sorted by a person name.
*/

SELECT p.name,
  COUNT(*) AS count_of_visits
FROM person_visits pv
  JOIN person p ON pv.person_id = p.id
GROUP BY p.name
ORDER BY 2 DESC,
  1
LIMIT 4;