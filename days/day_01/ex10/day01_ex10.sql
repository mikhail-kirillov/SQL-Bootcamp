-- Select columns from person, menu, and pizzeria tables
SELECT 
  -- name from person table
  person.name, 
  -- pizza_name from menu table
  menu.pizza_name, 
  -- name from pizzeria table
  pizzeria.name AS pizzeria_name
FROM 
  -- person table
  person
  -- Join with person_order table on person_id
  JOIN person_order ON person.id = person_order.person_id
  -- Join with menu table on menu_id
  JOIN menu ON person_order.menu_id = menu.id
  -- Join with pizzeria table on pizzeria_id
  JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
-- Order the results by person.name, menu.pizza_name, and pizzeria.name
ORDER BY 
  person.name ASC, 
  menu.pizza_name ASC, 
  pizzeria.name ASC;