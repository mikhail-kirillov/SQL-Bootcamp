-- Selects the name and the count of visits for each pizzeria
WITH visits AS (
    -- Selects the name from pizzeria table
    SELECT 
        pizzeria.name AS name,
        -- Counts the number of visits for each pizzeria
        COUNT(*) AS count
    FROM 
        person_visits -- Specifies the table to select from
    -- Joins person_visits table with pizzeria table
    JOIN 
        pizzeria ON pizzeria.id = person_visits.pizzeria_id
    GROUP BY 
        pizzeria.name -- Groups results by pizzeria name
), 
-- Selects the name and the count of orders for each pizzeria
orders AS (
    -- Selects the name from pizzeria table
    SELECT 
        pizzeria.name AS name,
        -- Counts the number of orders for each pizzeria
        COUNT(*) AS count
    FROM 
        person_order -- Specifies the table to select from
    -- Joins person_order table with menu table
    JOIN 
        menu ON menu.id = person_order.menu_id
    -- Joins menu table with pizzeria table
    JOIN 
        pizzeria ON pizzeria.id = menu.pizzeria_id
    GROUP BY 
        pizzeria.name -- Groups results by pizzeria name
)
SELECT 
    name, 
    -- Calculates the total count for each pizzeria
    SUM(count) AS total_count
FROM 
    (
        -- Selects the results from visits
        SELECT * FROM visits
        UNION ALL
        -- Selects the results from orders
        SELECT * FROM orders
    ) AS union_table
GROUP BY 
    name
ORDER BY 
    -- Orders results by total_count in descending order
    total_count DESC, 
    -- Orders results by name in ascending order if counts are equal
    name ASC;