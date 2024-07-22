/*
We know personal addresses from our data. Let's assume 
that this person only visits pizzerias in his city. 
Write a SQL statement that returns the address, the name 
of the pizzeria, and the amount of the person's orders. 
The result should be sorted by address and then by restaurant name.
*/

SELECT p.address,
  pizzeria.name,
  COUNT(*) AS count_of_orders
FROM person_order po
  JOIN person p ON po.person_id = p.id
  JOIN menu m ON po.menu_id = m.id
  JOIN pizzeria ON pizzeria.id = m.pizzeria_id
GROUP BY p.address,
  pizzeria.name
ORDER BY 1,
  2;