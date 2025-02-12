/*
Please use the command line for PostgreSQL database (psql) for this task.
You need to check how your changes will be published to the database
for other database users.
Actually, we need two active sessions (i.e. 2 parallel sessions in the command line).

Let's check one of the famous "Non-Repeatable Reads" database patterns,
but under the SERIALIZABLE isolation level.
Please check a rating for "Pizza Hut" in a transaction mode for Session #1,
and then make an UPDATE of the rating to a value of 3.0 in Session #2.
*/

-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';