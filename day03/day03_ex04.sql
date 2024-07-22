/*
Find a union of pizzerias that have orders from either women or men. 
In other words, you should find a set of names of pizzerias 
that have been ordered only by women and make "UNION" operation 
with set of names of pizzerias that have been ordered only by men. 
Please be careful with word "only" for both genders. 
For all SQL operators with sets don't store duplicates (UNION, EXCEPT, INTERSECT). 
Please sort a result by the name of the pizzeria.
*/

SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN menu ON pizzeria.id = pizzeria_id
JOIN person_order po ON menu.id = menu_id
JOIN person ON person.id = po.person_id
GROUP BY pizzeria.name
HAVING SUM(CASE
               WHEN person.gender = 'male' THEN 1
               ELSE 0
           END) = 0
UNION
SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN menu ON pizzeria.id = pizzeria_id
JOIN person_order po ON menu.id = menu_id
JOIN person ON person.id = po.person_id
GROUP BY pizzeria.name
HAVING SUM(CASE
               WHEN person.gender = 'female' THEN 1
               ELSE 0
           END) = 0
ORDER BY pizzeria_name;