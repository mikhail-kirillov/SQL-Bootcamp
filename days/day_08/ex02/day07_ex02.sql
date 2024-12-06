WITH count_visits AS ( -- Define a common table expression (CTE) for top 3 pizzerias by visits
    SELECT 
        pizzeria.name AS name, -- Select the pizzeria name
        COUNT(*) AS count, -- Count the number of visits
        'visit' AS action_type -- Label the action type as 'visit'
    FROM 
        person_visits -- Source table for visits
    JOIN 
        pizzeria ON pizzeria.id = person_visits.pizzeria_id -- Join with pizzeria table to get pizzeria names
    GROUP BY 
        pizzeria.name -- Group results by pizzeria name
    ORDER BY 
        count DESC -- Order results by count in descending order
    LIMIT 3 -- Limit the results to top 3 pizzerias
), 
count_orders AS ( -- Define a CTE for top 3 pizzerias by orders
    SELECT 
        pizzeria.name AS name, -- Select the pizzeria name
        COUNT(*) AS count, -- Count the number of orders
        'order' AS action_type -- Label the action type as 'order'
    FROM 
        person_order -- Source table for orders
    JOIN 
        menu ON menu.id = person_order.menu_id -- Join with menu table to get menu items
    JOIN 
        pizzeria ON pizzeria.id = menu.pizzeria_id -- Join with pizzeria table to get pizzeria names
    GROUP BY 
        pizzeria.name -- Group results by pizzeria name
    ORDER BY 
        count DESC -- Order results by count in descending order
    LIMIT 3 -- Limit the results to top 3 pizzerias
)
SELECT 
    * -- Select all columns from count_visits
FROM 
    count_visits -- From the CTE for visits
UNION ALL
SELECT 
    * -- Select all columns from count_orders
FROM 
    count_orders -- From the CTE for orders
ORDER BY 
    action_type ASC, -- Order final results by action type in ascending order
    count DESC; -- Then by count in descending order