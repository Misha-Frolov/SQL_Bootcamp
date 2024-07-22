/* Create an SQL statement that returns all columns from the 
person_order table with rows whose identifier is an even number. 
The result must be ordered by the returned identifier. */

SELECT 
  * 
FROM 
  person_order 
WHERE 
  MOD(id, 2) = 0;