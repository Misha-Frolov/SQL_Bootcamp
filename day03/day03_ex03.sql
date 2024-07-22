/*
Please find pizzerias that have been visited more often 
by women or by men. Save duplicates for any SQL operators 
with sets (UNION ALL, EXCEPT ALL, INTERSECT ALL constructions). 
Please sort a result by the name of the pizzeria.
*/

SELECT pizzeria_name
FROM (
  SELECT pi.name AS pizzeria_name, 
         COUNT(CASE WHEN gender = 'female' THEN 1 END) AS women_visits,
         COUNT(CASE WHEN gender = 'male' THEN 1 END) AS men_visits
  FROM person_visits pv
  JOIN person p ON pv.person_id = p.id
  JOIN pizzeria pi ON pv.pizzeria_id = pi.id
  GROUP BY pi.name
)
WHERE women_visits > men_visits
UNION ALL
SELECT pizzeria_name
FROM (
  SELECT pi.name AS pizzeria_name,
         COUNT(CASE WHEN gender = 'female' THEN 1 END) AS women_visits,
         COUNT(CASE WHEN gender = 'male' THEN 1 END) AS men_visits
  FROM person_visits pv
  JOIN person p ON pv.person_id = p.id
  JOIN pizzeria pi ON pv.pizzeria_id = pi.id
  GROUP BY pi.name
)
WHERE men_visits > women_visits
ORDER BY pizzeria_name;




