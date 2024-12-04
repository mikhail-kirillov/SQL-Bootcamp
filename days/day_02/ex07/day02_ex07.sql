-- Select the name of the pizzeria
SELECT pizzeria.name
-- From the pizzeria table
FROM pizzeria
-- Perform an inner join with the person_visits table on matching pizzeria_id
JOIN person_visits
    ON pizzeria.id = person_visits.pizzeria_id
-- Perform an inner join with the person table on matching person_id
JOIN person
    ON person_visits.person_id = person.id
-- Perform an inner join with the menu table on matching pizzeria_id
JOIN menu
    ON pizzeria.id = menu.pizzeria_id
-- Filter for the specific visit date
WHERE person_visits.visit_date = '2022-01-08'
  -- Filter for the specific person's name
  AND person.name = 'Dmitriy'
  -- Filter for menu items with a price less than 800
  AND menu.price < 800;