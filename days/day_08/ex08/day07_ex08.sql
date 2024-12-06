-- Selects the address of the person
SELECT person.address AS address,
       -- Selects the name of the pizzeria
       pizzeria.name AS name,
       -- Counts the number of orders for each person and pizzeria
       COUNT(person_order.id) AS count_of_orders
-- From the person table
FROM person
-- Join the person_order table on matching person_id
JOIN person_order
    ON person_order.person_id = person.id
-- Join the menu table on matching menu_id
JOIN menu
    ON menu.id = person_order.menu_id
-- Join the pizzeria table on matching pizzeria_id
JOIN pizzeria
    ON pizzeria.id = menu.pizzeria_id
-- Group the results by person's address and pizzeria's name
GROUP BY person.address, pizzeria.name
-- Order the results by address and then by name
ORDER BY address, name;