-- Select the name and rating of pizzerias
SELECT pizzeria.name, pizzeria.rating
-- From the pizzeria table
FROM pizzeria
-- Perform a left join with the person_visits table
LEFT JOIN person_visits
  -- On matching pizzeria_id fields
  ON pizzeria.id = person_visits.pizzeria_id
-- Where there are no matching records in person_visits
WHERE person_visits.pizzeria_id IS NULL;