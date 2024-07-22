/*
Please write an SQL statement that returns a list of the names 
of the people who ordered pizza from the corresponding pizzeria.
Please make the ordering by 3 columns (person_name, pizza_name, 
pizzeria_name) in ascending mode.
*/

SELECT person.name AS person_name,
       pizza_name,
       pizzeria.name AS pizzeria_name
FROM person_order
JOIN person ON person_order.person_id = person.id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY person_name,
         pizza_name,
         pizzeria.name;