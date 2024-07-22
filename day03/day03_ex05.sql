/*
Write an SQL statement that returns a list of pizzerias 
that Andrey visited but did not order from. 
Please order by the name of the pizzeria.
*/

SELECT pizzeria.name AS pizzeria_name
FROM person_visits pv
  JOIN person ON person.id = pv.person_id
  JOIN pizzeria ON pizzeria.id = pv.pizzeria_id
  JOIN menu ON pizzeria.id = menu.pizzeria_id
WHERE person.name = 'Andrey'
EXCEPT
SELECT pizzeria.name AS pizzeria_name
FROM person_order po
  JOIN person ON person.id = po.person_id
  JOIN menu ON menu.id = po.menu_id
  JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE person.name = 'Andrey'
ORDER BY pizzeria_name;