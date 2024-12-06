-- Insert a new visit into person_visits table
INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
    -- Generate a new id by incrementing the max id
    (SELECT MAX(id) FROM person_visits) + 1,
    -- Get the id of the person named 'Dmitriy'
    (SELECT id FROM person WHERE name = 'Dmitriy'),
    -- Get the pizzeria_id of a random pizzeria which is not 'Papa Johns'
    (SELECT DISTINCT pizzeria_id
     FROM menu
     -- Join menu table with pizzeria table
     JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
     -- Filter the pizzerias based on price and name
     WHERE price < 800
     AND pizzeria.name != 'Papa Johns'
     -- Limit the result to one
     LIMIT 1),
    -- Set the visit_date to '2022-01-08'
    '2022-01-08'
);

-- Refresh the materialized view mv_dmitriy_visits_and_eats
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;