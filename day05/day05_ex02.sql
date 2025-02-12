/*
Please create a functional B-Tree index  named idx_person_name 
on the column name of the person table. The index should contain 
person names in upper case.
Write and provide any SQL with proof (EXPLAIN ANALYZE) 
that index idx_person_name works.
*/

CREATE INDEX idx_person_name ON person(UPPER(name));

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT *
FROM person
WHERE UPPER(name) = 'Denis';