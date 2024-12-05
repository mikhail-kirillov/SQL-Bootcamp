-- Get a list of all pizzas that weren't ordered by anyone
-- and the places where they can be ordered
SELECT
    -- Pizza name
    menu.pizza_name,
    -- Price of the pizza
    menu.price,
    -- Name of the pizzeria
    pizzeria.name AS pizzeria_name
FROM menu
-- Join pizzeria table by pizzeria id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE menu.id IN (
    -- Get a list of all menu ids that weren't ordered by anyone
    SELECT menu.id AS menu_id
    FROM menu
    WHERE menu.id NOT IN (
        -- Get a list of all menu ids that were ordered by anyone
        SELECT person_order.menu_id
        FROM person_order
    )
    -- Sort the result by id
    ORDER BY menu.id
)
-- Sort the result by pizza name, price, and pizzeria name
ORDER BY menu.pizza_name, menu.price;