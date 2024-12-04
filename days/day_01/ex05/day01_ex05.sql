-- Select all columns from person and pizzeria tables
SELECT *
-- From the person and pizzeria tables
FROM person, pizzeria
-- Order the results by person.id and then by pizzeria.id
ORDER BY person.id, pizzeria.id;