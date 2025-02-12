/*
Please create a Materialized View mv_dmitriy_visits_and_eats 
(with data included) based on the SQL statement that finds 
the name of the pizzeria where Dmitriy visited on January 8, 2022 
and could eat pizzas for less than 800 rubles.
To check yourself, you can write SQL to the Materialized View 
mv_dmitriy_visits_and_eats and compare the results with your previous query.
*/

CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS 

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

SELECT *
FROM mv_dmitriy_visits_and_eats