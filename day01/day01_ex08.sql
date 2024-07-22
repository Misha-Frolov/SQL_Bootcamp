/*
Please rewrite a SQL statement from Exercise #07 
by using NATURAL JOIN construction. 
The result must be the same like for Exercise #07.

Denied constructions:
other type of  JOINs
*/

SELECT order_date,
       CONCAT(name, ' (age:', age, ')') AS person_information
FROM person
NATURAL JOIN
  (SELECT order_date,
          person_id AS id
   FROM person_order)
ORDER BY order_date,
         name;