/*
Please add a way to see additional rows with the most 
expensive cost to the SQL from the previous exercise. 
Please sort the data by total_cost and then by trip.
*/

WITH RECURSIVE routes AS (
  SELECT 
    n1.point1, 
    n1.point2, 
    ARRAY [n1.point1] AS path, 
    ARRAY [cost] AS costs, 
    cost
  FROM 
    nodes n1 
  WHERE 
    n1.point1 = 'a' 
  UNION ALL 
  SELECT 
    n2.point1, 
    n2.point2, 
    routes.path || n2.point1, 
    routes.costs || n2.cost AS costs, 
    n2.cost + routes.cost as cost
  FROM 
    nodes n2 
    INNER JOIN routes ON routes.point2 = n2.point1 
  WHERE 
   n2.point1 <> ALL(routes.path)
) 
SELECT 
  DISTINCT cost - costs [4] + (
    SELECT 
      SUM(n.cost) 
    FROM 
      nodes n 
    WHERE 
      n.point1 = path[4] 
      AND n.point2 = 'a'
  ) AS total_cost, 
  path || ARRAY[ 'a' ] AS tour 
FROM 
  routes 
WHERE 
  array_length(path, 1) = 4 
ORDER BY 
  total_cost, 
  tour;
