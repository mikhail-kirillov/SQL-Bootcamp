-- Session 1, Session 2
BEGIN;
-- All Sessions
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Session 1
SELECT SUM(rating) FROM pizzeria;

-- Session 2
INSERT INTO pizzeria (id, name, rating) VALUES (10, 'Kazan Pizza', 5);
COMMIT;

-- Session 1
SELECT SUM(rating) FROM pizzeria;
COMMIT;

-- Session 1, Session 2
SELECT SUM(rating) FROM pizzeria;