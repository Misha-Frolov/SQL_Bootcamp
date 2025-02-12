/*
Find complete information about all possible pizzeria names and prices 
to get mushroom or pepperoni pizza. Then sort the result 
by pizza name and pizzeria name.
*/

SELECT
	pizza_name,
	pizzeria.name AS pizzeria_name,
	price
FROM
	menu
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE 
	pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY
	pizza_name,
	pizzeria.name