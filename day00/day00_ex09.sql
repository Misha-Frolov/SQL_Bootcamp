/* Please make a select statement that returns person names 
and pizzeria names based on the person_visits table with a 
visit date in a period from January 07 to January 09, 2022 
(including all days) (based on an internal query in the `FROM' clause).

Please add a ordering clause by person name in ascending mode 
and by pizzeria name in descending mode. 

Denied constructions:
Any types of JOINs
*/

SELECT 
  (
    SELECT 
      person.name 
    FROM 
      person 
    WHERE 
      person.id = pv.person_id
  ) AS person_name, 
  (
    SELECT 
      pizzeria.name 
    FROM 
      pizzeria 
    WHERE 
      pizzeria.id = pv.pizzeria_id
  ) AS pizzeria_name 
FROM 
  (
    SELECT 
      person_id, 
      pizzeria_id 
    FROM 
      person_visits 
    WHERE 
      visit_date BETWEEN '2022-01-07' 
      AND '2022-01-09'
  ) AS pv 
ORDER BY 
  person_name, 
  pizzeria_name DESC;
