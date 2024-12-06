-- Session 1, Session 2
BEGIN;
-- All Sessions
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Session 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session 2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;

-- Session 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;

-- Session 1, Session 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';