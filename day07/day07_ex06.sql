/*
Please write a SQL statement that returns the number of orders, 
the average price, the maximum price and the minimum price for 
pizzas sold by each pizzeria restaurant. The result should be 
sorted by pizzeria name. Round the average price to 2 floating numbers.
*/

SELECT pizzeria.name,
  COUNT(*) AS count_of_orders,
  ROUND(AVG(price), 2) AS average_price,
  MAX(price) AS max_price,
  MIN(price) AS min_price
FROM person_order po
  JOIN menu m ON po.menu_id = m.id
  JOIN pizzeria ON pizzeria.id = m.pizzeria_id
GROUP BY pizzeria.name
ORDER BY 1;