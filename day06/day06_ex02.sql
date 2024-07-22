/*
Write a SQL statement that returns the orders with actual price 
and price with discount applied for each person in the 
corresponding pizzeria restaurant, sorted by person name 
and pizza name.
*/

SELECT p.name,
  m.pizza_name,
  m.price,
  ROUND(m.price - m.price * pd.discount / 100, 2) AS discount_price,
  pizzeria.name AS pizzeria_name
FROM person_order po
  JOIN person p ON po.person_id = p.id
  JOIN menu m ON po.menu_id = m.id
  JOIN pizzeria ON m.pizzeria_id = pizzeria.id
  JOIN person_discounts pd ON pd.person_id = p.id
  AND pd.pizzeria_id = m.pizzeria_id
ORDER BY p.name,
  m.pizza_name;