/*
Write an SQL statement that satisfies the formula (R - S)∪(S - R).
Where R is the person_visits table with a filter through January 2, 2022, 
S is also the person_visits table but with a different filter through January 6, 2022. 
Please do your calculations with sets under the person_id column and this column 
will be alone in a result. Please sort the result by the person_id column 
and present your final SQL in the v_symmetric_union database view.
To be honest, the definition of "symmetric union" doesn't exist in set theory. 
This is the author's interpretation, the main idea is based on the existing rule 
of symmetric difference.
*/

CREATE VIEW v_symmetric_union AS

WITH R AS(
  SELECT person_id
  FROM person_visits
  WHERE visit_date = '2022-01-02'
),
S AS (
  SELECT person_id
  FROM person_visits
  WHERE visit_date = '2022-01-06'
)
SELECT person_id
FROM (
    SELECT person_id
    FROM R
    EXCEPT
    SELECT person_id
    FROM S
  )
UNION ALL
SELECT person_id
FROM (
    SELECT person_id
    FROM S
    EXCEPT
    SELECT person_id
    FROM R
  )
ORDER BY 1;
