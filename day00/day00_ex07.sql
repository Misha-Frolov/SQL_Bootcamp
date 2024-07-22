/* Let's apply data intervals to the person table.
Please make an SQL statement that returns the identifiers of a person, 
the person's names, and the interval of the person's ages (set a name 
of a new calculated column as 'interval_info') based on the pseudo code below.

  if (age >= 10 and age <= 20) then return 'interval #1'
  else if (age > 20 and age < 24) then return 'interval #2'
  else return 'interval #3'

And yes... please sort a result by ‘interval_info’ column in ascending mode. */

SELECT 
  id, 
  name, 
  CASE WHEN age BETWEEN 10 
  AND 20 THEN 'interval #1' WHEN age BETWEEN 21 
  AND 23 THEN 'interval #2' ELSE 'interval #3' END AS interval_info 
FROM 
  person 
ORDER BY 
  interval_info;
