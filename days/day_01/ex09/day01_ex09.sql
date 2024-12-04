-- Select all pizzeria names
SELECT name 
-- From pizzeria table, renamed as p
FROM pizzeria AS p
-- Where p.id is not in the list of pizzeria_id
WHERE p.id NOT IN (
    -- Select pizzeria_id from person_visits table
    SELECT pizzeria_id FROM person_visits
);

-- Select all pizzeria names
SELECT name 
-- From pizzeria table, renamed as p
FROM pizzeria AS p
-- Where p.id is not in the list of pizzeria_id
WHERE NOT EXISTS (
    -- Select 1 from person_visits 
    -- where p.id is equal to pizzeria_id
    SELECT 1 FROM person_visits WHERE p.id = pizzeria_id
);