-- Create a unique index on the combination of person_id and pizzeria_id
CREATE INDEX idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);

-- Disable sequential scan to force the use of index during query execution
SET enable_seqscan = OFF;

-- Explain and analyze the performance of the query
EXPLAIN ANALYZE
SELECT *
FROM person_discounts
WHERE person_id = 1
AND pizzeria_id = 2;