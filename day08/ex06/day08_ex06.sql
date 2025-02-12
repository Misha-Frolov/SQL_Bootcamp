/*
Please use the command line for PostgreSQL database (psql) for this task.
You need to check how your changes will be published to the database
for other database users.
Actually, we need two active sessions (i.e. 2 parallel sessions in the command line).

Let's check one of the famous "Phantom Reads" database patterns,
but under the isolation level REPEATABLE READ. 
Please summarize all ratings for all pizzerias in one transaction mode
for Session #1 and then make INSERT of the new restaurant 'Kazan Pizza 2'
with rating 4 and ID=11 in Session #2.
*/

-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SELECT SUM(rating) FROM pizzeria;
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT SUM(rating) FROM pizzeria;

-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
INSERT INTO pizzeria VALUES (11, 'Kazan Pizza 2', 4);
COMMIT;
SELECT SUM(rating) FROM pizzeria;