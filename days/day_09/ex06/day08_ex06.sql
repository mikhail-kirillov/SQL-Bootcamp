-- Session 1, Session 2
BEGIN;
-- All Sessions
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Session 1
SELECT SUM(rating) FROM pizzeria;

-- Session 2
INSERT INTO pizzeria (id, name, rating) VALUES (11, 'Kazan Pizza 2', 4);
COMMIT;

-- Session 1
SELECT SUM(rating) FROM pizzeria;
COMMIT;

-- Session 1, Session 2
SELECT SUM(rating) FROM pizzeria;