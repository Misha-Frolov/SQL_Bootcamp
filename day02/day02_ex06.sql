/*
Find all pizza names (and corresponding pizzeria names using the menu table) 
ordered by Denis or Anna. Sort a result by both columns.
*/

SELECT menu.pizza_name,
       pizzeria.name
FROM person_order
JOIN menu ON menu.id = person_order.menu_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE person_id IN
    (SELECT id
     FROM person
     WHERE name IN ('Denis',
                    'Anna'))
ORDER BY 1,
         2;