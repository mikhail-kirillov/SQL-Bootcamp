-- Select the person's name
SELECT person.name
-- From the person table
FROM person
-- Perform an inner join with the person_order table on matching person_id
JOIN person_order ON person.id = person_order.person_id
-- Perform an inner join with the menu table on matching menu_id
JOIN menu ON person_order.menu_id = menu.id
-- Filter for male persons
WHERE person.gender = 'male'
  -- Filter for persons from Moscow or Samara
  AND (person.address = 'Moscow' OR person.address = 'Samara')
  -- Filter for menu items with either pepperoni pizza or mushroom pizza
  AND (menu.pizza_name = 'pepperoni pizza' OR menu.pizza_name = 'mushroom pizza')
-- Order the result by the person's name in descending order
ORDER BY person.name DESC;