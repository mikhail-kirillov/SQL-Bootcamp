-- Define a CTE to select distinct names from the person table
WITH names AS (
    -- Select the name from the person table
    SELECT person.name AS name
    -- Join the person table with person_order table on matching person_id
    FROM person
    JOIN person_order ON person_order.person_id = person.id
)
-- Select distinct names from the CTE
SELECT DISTINCT name
-- From the CTE
FROM names
-- Order the results by name in ascending order
ORDER BY name;