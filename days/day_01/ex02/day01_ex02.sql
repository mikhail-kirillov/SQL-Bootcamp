-- Select all pizza names from the menu
SELECT pizza_name FROM menu
-- Combine with...
UNION
-- ...all pizza names from the menu
SELECT pizza_name FROM menu
-- Sort the results in descending order by pizza_name
ORDER BY pizza_name DESC;