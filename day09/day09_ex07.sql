CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr NUMERIC []) RETURNS NUMERIC AS $$
SELECT MIN(value) AS minimum
FROM unnest(arr) AS value;
$$ LANGUAGE sql;