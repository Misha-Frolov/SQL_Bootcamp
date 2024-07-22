/*
Write 2 SQL statements that return a list of pizzerias 
that have not been visited by people using IN for the first 
and EXISTS for the second.
*/

SELECT name
FROM pizzeria
WHERE id NOT IN
    (SELECT DISTINCT pizzeria_id
     FROM person_visits);

SELECT name
FROM pizzeria
WHERE NOT EXISTS
    (SELECT 1
     FROM person_visits
     WHERE pizzeria_id = pizzeria.id);