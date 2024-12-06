CREATE INDEX idx_person_name ON person (UPPER(name));

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT person.name AS names
FROM person
WHERE UPPER(person.name) = 'ANNA';