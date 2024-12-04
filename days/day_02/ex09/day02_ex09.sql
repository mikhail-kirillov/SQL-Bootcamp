WITH cte_persons AS (
    -- Select the person's name, gender, and the name of the pizza
    SELECT person.name AS name,
           gender,
           menu.pizza_name AS pizza_name
    -- From the person table
    FROM person
    -- Join the person_order table on the matching person_id field
    JOIN person_order ON person.id = person_order.person_id
    -- Join the menu table on the matching menu_id field
    JOIN menu ON person_order.menu_id = menu.id
    -- Filter for female persons
    WHERE person.gender = 'female'
)
-- Select the person's name
SELECT name
-- From the cte_persons result
FROM cte_persons
-- Filter for persons who ordered pepperoni pizza
WHERE pizza_name = 'pepperoni pizza'
-- Intersect with the result of the query below
INTERSECT
-- Select the person's name
SELECT name
-- From the cte_persons result
FROM cte_persons
-- Filter for persons who ordered cheese pizza
WHERE pizza_name = 'cheese pizza'
-- Order the result by the person's name
ORDER BY name;