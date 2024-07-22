/*
Please write a SQL statement that returns a list of pizza names, 
pizza prices, pizzeria names, and visit dates for Kate and for 
prices ranging from 800 to 1000 rubles. Please sort by pizza, 
price, and pizzeria name.
*/

SELECT pizza_name,
       price,
       pizzeria.name AS pizzeria_name,
       visit_date
FROM
  (SELECT *
   FROM person
   WHERE name = 'Kate') AS person
JOIN person_visits pv ON person.id = pv.person_id
JOIN pizzeria ON pizzeria.id = pv.pizzeria_id
JOIN
  (SELECT *
   FROM menu
   WHERE price BETWEEN 800 AND 1000) AS pizza ON pizzeria.id = pizza.pizzeria_id
ORDER BY pizza_name,
         price,
         pizzeria_name;
