-- Select the name from the person table and alias it as object_name
(SELECT name AS object_name 
 -- Order the results by name
 FROM person 
 ORDER BY name)
-- Union all with the next query
UNION ALL
-- Select the pizza_name from the menu table and alias it as object_name
(SELECT pizza_name AS object_name 
 -- Order the results by pizza_name
 FROM menu 
 ORDER BY pizza_name);