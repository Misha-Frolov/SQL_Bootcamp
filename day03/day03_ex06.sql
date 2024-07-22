/*
Find the same pizza names that have the same price, 
but from different pizzerias. Make sure that the result 
is ordered by pizza name.
*/

SELECT m1.pizza_name,
    p1.name AS pizzeria_name_1,
    p2.name AS pizzeria_name_2,
    m1.price
FROM menu m1
    JOIN menu m2 ON m1.price = m2.price
    AND m1.pizza_name = m2.pizza_name
    AND (m1.pizzeria_id > m2.pizzeria_id)
    JOIN pizzeria p1 ON m1.pizzeria_id = p1.id
    JOIN pizzeria p2 ON m2.pizzeria_id = p2.id
ORDER BY 1;