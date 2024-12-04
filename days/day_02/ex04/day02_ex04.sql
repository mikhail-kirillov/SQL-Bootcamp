-- Create a common table expression (CTE) named pizzas_and_pizzas
WITH pizzas_and_pizzas (
    pizza_name,        -- Define the pizza_name column
    pizzeria_name,     -- Define the pizzeria_name column
    price              -- Define the price column
) AS (
    -- Select pizza_name, pizzeria_name, and price from the joined tables
    SELECT
        menu.pizza_name,    -- Select pizza name from the menu table
        pizzeria.name,      -- Select pizzeria name from the pizzeria table
        menu.price          -- Select pizza price from the menu table
    FROM
        menu                -- From the menu table
    JOIN
        pizzeria            -- Join with the pizzeria table
    ON
        menu.pizzeria_id = pizzeria.id  -- On matching pizzeria_id fields
    WHERE
        menu.pizza_name IN (            -- Filter for specific pizza names
            'mushroom pizza',           -- Include mushroom pizza
            'pepperoni pizza'           -- Include pepperoni pizza
        )
)
-- Select pizza_name, pizzeria_name, and price from the CTE
SELECT
    pizzas_and_pizzas.pizza_name,    -- Select pizza name
    pizzas_and_pizzas.pizzeria_name, -- Select pizzeria name
    pizzas_and_pizzas.price          -- Select pizza price
FROM
    pizzas_and_pizzas                -- From the CTE
ORDER BY
    pizzas_and_pizzas.pizza_name,    -- Order by pizza name
    pizzas_and_pizzas.pizzeria_name; -- Order by pizzeria name