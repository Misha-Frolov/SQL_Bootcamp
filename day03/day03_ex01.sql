/*
Find all menu identifiers that are not ordered by anyone. 
The result should be sorted by identifier.

Denied constructions:
any type of JOINs
*/

SELECT id
FROM menu
WHERE id NOT IN
    (SELECT menu_id
     FROM person_order)
ORDER BY id;


