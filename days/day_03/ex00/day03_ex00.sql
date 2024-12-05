-- Get a list of all pizzas that Kate ordered
-- and the places where she ordered them
SELECT
    -- Pizza name
    menu.pizza_name,
    -- Price of the pizza
    menu.price,
    -- Name of the pizzeria
    pizzeria.name AS pizzeria_name,
    -- Date when Kate visited the pizzeria
    person_visits.visit_date
FROM menu
-- Join pizzeria table by pizzeria id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
-- Join person visits table by pizzeria id
JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
-- Join person table by person id
JOIN person ON person.id = person_visits.person_id
-- Filter by person name and price
WHERE person.name = 'Kate'
AND menu.price BETWEEN 800 AND 1000
-- Sort the result by pizza name, price, and pizzeria name
ORDER BY
    menu.pizza_name,
    menu.price,
    pizzeria.name;