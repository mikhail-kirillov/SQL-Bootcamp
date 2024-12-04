-- Select the pizza name and the pizzeria name
SELECT
    -- Get the pizza name
    menu.pizza_name AS pizza_name,
    -- Get the pizzeria name
    pizzeria.name AS pizzeria_name
FROM
    -- Join the menu table
    menu
    -- Join the pizzeria table on the pizzeria_id field
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    -- Join the person_order table on the menu_id field
    JOIN person_order ON person_order.menu_id = menu.id
    -- Join the person table on the person_id field
    JOIN person ON person.id = person_order.person_id
WHERE
    -- Filter for the given person names
    person.name IN ('Denis', 'Anna')
ORDER BY
    -- Order by the pizza name
    pizza_name,
    -- Order by the pizzeria name
    pizzeria_name;