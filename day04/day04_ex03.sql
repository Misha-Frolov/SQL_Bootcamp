/*
Write a SQL statement that returns missing days for people's visits 
in January 2022. Use the v_generated_dates view for this task 
and sort the result by the missing_date column.
*/

SELECT generated_date AS missing_date
FROM v_generated_dates
EXCEPT
SELECT visit_date AS missing_date
FROM person_visits
WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-31'
ORDER BY missing_date;