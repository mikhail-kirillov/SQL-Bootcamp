--- Session 1 (1)
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--- Session 2 (1)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--- Session 1 (2)
COMMIT;

--- Session 2 (2)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';