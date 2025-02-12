/* Write a select statement that returns the names of people 
(based on an internal query in the SELECT clause) 
who placed orders for the menu with identifiers 13, 14, and 18, 
and the date of the orders should be January 7, 2022. 

Denied constructions:
IN, any types of JOINs
*/

SELECT 
  (
    SELECT 
      name 
    FROM 
      person 
    WHERE 
      person.id = person_order.person_id
  ) AS name
FROM 
  person_order 
WHERE 
  (
    menu_id = 13 
    OR menu_id = 14 
    OR menu_id = 18
  ) 
  AND order_date = '2022-01-07'
