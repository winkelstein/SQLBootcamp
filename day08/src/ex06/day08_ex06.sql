/* Session #1 */
begin transaction isolation level repeatable read;

/* Session #1 */
begin transaction isolation level repeatable read;

/* Session #1 */
SELECT SUM(rating) FROM pizzeria;

/* Session #2 */
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
COMMIT;

/* Session #1 */
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT SUM(rating) FROM pizzeria;

/* Session #2 */
SELECT SUM(rating) FROM pizzeria;

