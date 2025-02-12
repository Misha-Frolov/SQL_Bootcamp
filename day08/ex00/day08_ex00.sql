/*
Please use the command line for PostgreSQL database (psql) for this task.
You need to check how your changes will be published to the database
for other database users. 
Actually, we need two active sessions (i.e. 2 parallel sessions in the command line). 
Please provide a proof that your parallel session can’t see your changes 
until you will make a `COMMIT`;

See the steps below.

Session #1
- Update of rating for "Pizza Hut" to 5 points in a transaction mode.
- Check that you can see a changes in session #1.

Session #2
- Check that you can’t see a changes in session #2.

Session #1
- Publish your changes for all parallel sessions.

Session #2
- Check that you can see a changes in session #2.
*/

-- Session #1
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;

-- Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';