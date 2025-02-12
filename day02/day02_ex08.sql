/*
Please find the names of all men from Moscow or Samara who order 
either pepperoni or mushroom pizza (or both). Please sort the result 
by person names in descending order.
*/

WITH cte_persons AS
  (SELECT *
   FROM person
   WHERE gender = 'male'
     AND address IN ('Moscow',
                     'Samara') ),
     cte_pizzas AS
  (SELECT *
   FROM person_order
   JOIN menu ON person_order.menu_id = menu.id
   WHERE pizza_name IN ('pepperoni pizza',
                        'mushroom pizza') )
SELECT name
FROM cte_persons
JOIN cte_pizzas ON cte_persons.id = person_id
ORDER BY name DESC;