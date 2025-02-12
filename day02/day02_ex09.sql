/*
Find the names of all women who ordered both pepperoni and 
cheese pizzas (at any time and in any pizzerias). Make sure 
that the result is ordered by person's name.
*/

WITH cte_persons AS (
  SELECT *
  FROM person
  WHERE gender = 'female'
),
cte_pizzas AS (
  SELECT person_id
  FROM person_order
  JOIN menu ON person_order.menu_id = menu.id
  WHERE pizza_name IN ('pepperoni pizza', 'cheese pizza')
  GROUP BY person_id
  HAVING COUNT(DISTINCT pizza_name) = 2
)
SELECT cte_persons.name
FROM cte_persons
JOIN cte_pizzas ON cte_persons.id = cte_pizzas.person_id
ORDER BY cte_persons.name;