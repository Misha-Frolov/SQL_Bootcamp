/*
Let's go back to Exercise #01, please rewrite your SQL using the CTE 
(Common Table Expression) pattern. Please go to the CTE part of your 
"day generator". The result should look similar to Exercise #01.

Denied constructions:
NOT IN, IN, NOT EXISTS, EXISTS, UNION, EXCEPT, INTERSECT
*/

WITH cte_dates AS
  (SELECT missing_date :: DATE
   FROM generate_series(DATE '2022-01-01', DATE '2022-01-10', INTERVAL '1 day') AS DATE(missing_date)),
     cte_visits AS
  (SELECT visit_date
   FROM person_visits
   WHERE person_id = 1
     OR person_id = 2)
SELECT cte_dates.missing_date
FROM cte_dates
LEFT JOIN cte_visits ON cte_dates.missing_date = cte_visits.visit_date
WHERE cte_visits.visit_date IS NULL
ORDER BY cte_dates.missing_date;