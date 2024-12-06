-- Selects the name, count of orders, average price, max price and min price for each pizzeria
SELECT 
    -- Selects the name from pizzeria table
    pizzeria.name AS name,
    -- Counts the number of orders for each pizzeria
    COUNT(person_order.id) AS count_of_orders,
    -- Calculates the average price for each pizzeria
    ROUND(AVG(menu.price), 2) AS average_price,
    -- Finds the maximum price for each pizzeria
    MAX(menu.price) AS max_price,
    -- Finds the minimum price for each pizzeria
    MIN(menu.price) AS min_price
-- From the pizzeria table
FROM 
    pizzeria
-- Join menu table with pizzeria table on matching pizzeria_id
JOIN 
    menu ON menu.pizzeria_id = pizzeria.id
-- Join person_order table with menu table on matching menu_id
JOIN 
    person_order ON person_order.menu_id = menu.id
-- Groups the results by pizzeria name
GROUP BY 
    pizzeria.name 
-- Orders the results by pizzeria name
ORDER BY 
    pizzeria.name;