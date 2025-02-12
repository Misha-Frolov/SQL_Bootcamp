/*
Please write a SQL statement that returns the missing days 
from January 1 through January 10, 2022 (including all days) 
for visits by people with identifiers 1 or 2 (i.e., days missed by both). 
Please order by visit days in ascending mode.

Denied constructions:
NOT IN, IN, NOT EXISTS, EXISTS, UNION, EXCEPT, INTERSECT
*/

SELECT missing_date :: DATE
FROM generate_series(DATE '2022-01-01', DATE '2022-01-10', INTERVAL '1 day') AS DATE(missing_date)
LEFT JOIN
  (SELECT visit_date
   FROM person_visits
   WHERE person_id = 1
     OR person_id = 2 ) ON visit_date = date.missing_date
WHERE visit_date IS NULL
ORDER BY
	missing_date;