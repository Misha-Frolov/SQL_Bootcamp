/*
Please create a Database View (with name v_generated_dates) 
which should "store" generated dates from January 1st 
to January 31st, 2022 in type DATE. Don't forget the order 
of the generated_date column.
*/

CREATE VIEW v_generated_dates AS
SELECT generated_date::DATE
FROM generate_series(
    DATE '2022-01-01',
    DATE '2022-01-31',
    INTERVAL '1 day'
  ) AS DATE(generated_date)
ORDER BY generated_date;