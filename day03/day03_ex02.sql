/*
Please use the SQL statement from Exercise #01 and display 
the names of pizzas from the pizzeria that no one has ordered, 
including the corresponding prices. The result should be sorted 
by pizza name and price.
*/

SELECT m.pizza_name,
       m.price,
       p.name AS pizzeria_name
FROM menu m
JOIN pizzeria p ON m.pizzeria_id = p.id
WHERE m.id NOT IN
    (SELECT menu_id
     FROM person_order)
ORDER BY 1, 2;