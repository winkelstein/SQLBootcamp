/* Session #1 */
begin transaction isolation level read committed;

/* Session #2 */
begin transaction isolation level read committed;

/* Session #1 */
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

/* Session #2 */
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;
select * from pizzeria where  name  = 'Pizza Hut';

/* Session $1 */
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;

/* Session #2 */
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';