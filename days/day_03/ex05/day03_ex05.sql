-- Select distinct pizzeria names visited by Andrey
SELECT DISTINCT
    pizzeria.name AS pizzeria_name
-- From pizzeria table
FROM
    pizzeria
-- Join person_visits table to get visit data
JOIN
    person_visits ON person_visits.pizzeria_id = pizzeria.id
-- Join person table to get person details
JOIN
    person ON person.id = person_visits.person_id
-- Filter for visits by Andrey
WHERE
    person.name = 'Andrey'
    -- Exclude pizzerias where Andrey has placed an order
    AND pizzeria.id NOT IN (
        -- Select pizzeria ids from orders placed by Andrey
        SELECT
            pizzeria_id
        -- From person_order table
        FROM
            person_order
        -- Join menu table to get menu details
        JOIN
            menu ON person_order.menu_id = menu.id
        -- Join pizzeria table to get pizzeria details
        JOIN
            pizzeria ON pizzeria.id = menu.pizzeria_id
        -- Join person table to filter by person
        JOIN
            person ON person.id = person_order.person_id
        -- Filter for orders placed by Andrey
        WHERE
            person.name = 'Andrey'
    );