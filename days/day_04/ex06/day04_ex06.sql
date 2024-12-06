-- Create a materialized view named mv_dmitriy_visits_and_eats
CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
-- Select pizzeria name
SELECT
    pizzeria.name AS pizzeria_name
-- From the pizzeria table
FROM
    pizzeria
-- Join person_visits table with pizzeria table on pizzeria_id
    JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
-- Join menu table with pizzeria table on pizzeria_id
    JOIN menu ON menu.pizzeria_id = pizzeria.id
-- Join person table with person_visits table on person_id
    JOIN person ON person.id = person_visits.person_id
-- Where the person name is Dmitriy and the visit date is 2022-01-08
-- And the menu price is less than 800
WHERE
    person.name = 'Dmitriy'
    AND person_visits.visit_date = '2022-01-08'
    AND menu.price < 800;