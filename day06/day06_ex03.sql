/*
Actually, we need to improve data consistency from one side 
and performance tuning from the other side. Please create 
a multi-column unique index (named idx_person_discounts_unique) 
that prevents duplicates of the person and pizzeria identifier pairs.
After creating a new index, please provide any simple SQL statement 
that shows proof of the index usage (using EXPLAIN ANALYZE).
The proof example is below:
  ...
  Index Scan using idx_person_discounts_unique on person_discounts
  ...
*/

CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);

SET enable_seqscan = off;

EXPLAIN ANALYZE
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