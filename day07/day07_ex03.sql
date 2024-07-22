/*
Write an SQL statement to see how restaurants are grouped 
by visits and by orders, and joined together by restaurant name.
You can use the internal SQL from Exercise 02 (Restaurants by 
Visits and by Orders) without any restrictions on the number of rows.

In addition, add the following rules:
- Compute a sum of orders and visits for the corresponding pizzeria 
  (note that not all pizzeria keys are represented in both tables).
- Sort the results by the total_count column in descending order 
  and by the name column in ascending order.
*/

SELECT pizzeria.name,
  COALESCE(visits.count, 0) + COALESCE(orders.count, 0) AS total_count
FROM pizzeria
  LEFT JOIN (
    SELECT pizzeria_id,
      COUNT(*) AS count
    FROM person_visits
    GROUP BY pizzeria_id
  ) AS visits ON pizzeria.id = visits.pizzeria_id
  LEFT JOIN (
    SELECT m.pizzeria_id,
      COUNT(*) AS count
    FROM person_order po
      JOIN menu m ON po.menu_id = m.id
    GROUP BY m.pizzeria_id
  ) AS orders ON pizzeria.id = orders.pizzeria_id
ORDER BY total_count DESC,
  pizzeria.name ASC;