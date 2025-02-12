/*
Before proceeding, please write an SQL statement that returns 
pizzas and the corresponding pizzeria names.

Let's prove that your indexes work for your SQL.
The sample proof is the output of the EXPLAIN ANALYZE command.
Please take a look at the sample output of the command.

->  Index Scan using idx_menu_pizzeria_id on menu m  (...)
*/

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT pizza_name,
    pizzeria.name AS pizzeria_name
FROM menu
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id;