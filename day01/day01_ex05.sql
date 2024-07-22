/*
Please write a SQL statement that returns all possible combinations 
between person and pizzeria tables, and please set the order of the 
person identifier columns and then the pizzeria identifier columns.
*/

SELECT person.id AS person_id,
       person.name AS person_name,
       person.age AS person_age,
       person.gender AS person_gender,
       person.address AS person_address,
       pizzeria.id AS pizzeria_id,
       pizzeria.name AS pizzeria_name,
       pizzeria.rating AS pizzeria_rating
FROM person,
     pizzeria
ORDER BY person.id,
         pizzeria.id;