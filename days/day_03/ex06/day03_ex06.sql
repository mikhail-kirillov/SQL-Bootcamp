-- Select the name of the pizza, the name of the first pizzeria, the name of
-- the second pizzeria, and the price of the pizza
SELECT
    menu_one.pizza_name AS pizza_name,
    pizzeria_one.name AS pizzeria_name_1,
    pizzeria_two.name AS pizzeria_name_2,
    menu_one.price AS price
-- From the menu table
FROM menu AS menu_one
-- Join the menu table to get the second pizzeria
JOIN menu AS menu_two
    -- Join the two menu tables by the name of the pizza and the price of the
    -- pizza
    ON menu_one.pizza_name = menu_two.pizza_name
    AND menu_one.price = menu_two.price
-- Join the pizzeria table to get the name of the first pizzeria
JOIN pizzeria AS pizzeria_one ON pizzeria_one.id = menu_one.pizzeria_id
-- Join the pizzeria table to get the name of the second pizzeria
JOIN pizzeria AS pizzeria_two ON pizzeria_two.id = menu_two.pizzeria_id
-- Filter the result to remove duplicate pizzerias
WHERE pizzeria_one.id != pizzeria_two.id
-- Sort the result by the name of the pizza
ORDER BY pizza_name;