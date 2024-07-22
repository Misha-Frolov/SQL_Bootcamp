/*
Please find the name of the pizzeria Dmitriy visited on January 8, 2022 
and could eat pizza for less than 800 rubles.
*/

WITH cte_visit AS (
  SELECT *
  FROM person_visits
  WHERE person_id = (
      SELECT id
      FROM person
      WHERE name = 'Dmitriy'
    )
    AND visit_date = '2022-01-08'
)
SELECT name
FROM pizzeria
  JOIN cte_visit cv ON cv.pizzeria_id = pizzeria.id
  JOIN menu ON menu.pizzeria_id = pizzeria.id
WHERE price < 800;