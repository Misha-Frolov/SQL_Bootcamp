/*
Please use the command line for PostgreSQL database (psql) for this task.
You need to check how your changes will be published to the database
for other database users.
Actually, we need two active sessions (i.e. 2 parallel sessions in the command line).

Let's check one of the famous "phantom reads" database patterns,
but under the READ COMMITTED isolation level.
Please summarize all ratings for all pizzerias in one transaction mode
for Session #1 and then make INSERT of the new restaurant 'Kazan Pizza'
with rating 5 and ID=10 in Session #2.
*/

-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT SUM(rating) FROM pizzeria;
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT SUM(rating) FROM pizzeria;

-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
INSERT INTO pizzeria VALUES (10, 'Kazan Pizza', 5);
COMMIT;
SELECT SUM(rating) FROM pizzeria;