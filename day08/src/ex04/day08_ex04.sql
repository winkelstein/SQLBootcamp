/* Session #1 */
begin transaction isolation level serializable;

/* Session #2 */
begin transaction isolation level serializable;

/* Session #1 */
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

/* Session #2 */
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
COMMIT;

/* Session #1 */
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

/* Session #2 */
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';