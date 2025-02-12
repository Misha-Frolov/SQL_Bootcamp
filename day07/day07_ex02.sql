/*
Please write a SQL statement to see 3 favorite restaurants 
by visits and by orders in a list (please add an action_type column 
with values 'order' or 'visit', it depends on the data from the 
corresponding table). The result should be sorted in ascending order 
by the action_type column and in descending order by the count column.
*/

(
  SELECT pizzeria.name,
    COUNT(*) AS count,
    'visit' AS action_type
  FROM person_visits pv
    JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
  GROUP BY pizzeria.name
  ORDER BY 2 DESC
  LIMIT 3
)
UNION
(
  SELECT pizzeria.name,
    COUNT(*) AS count,
    'order' AS action_type
  FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria ON m.pizzeria_id = pizzeria.id
  GROUP BY pizzeria.name
  ORDER BY 2 DESC
  LIMIT 3
)
ORDER BY 3,
  2 DESC;