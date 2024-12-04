-- Select the person name, visit date, and pizzeria name
SELECT
    -- Replace null person names with '-'
    COALESCE(person.name, '-', NULL) AS person_name,
    -- Use the visit date directly
    pv.visit_date AS visit_date,
    -- Replace null pizzeria names with '-'
    COALESCE(pizzeria.name, '-', NULL) AS pizzeria_name
FROM
    -- Select all columns from person visits
    -- where the visit date is between 2022-01-01 and 2022-01-03
    (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS pv
-- Perform a full join with the person table
FULL JOIN person ON person.id = pv.person_id
-- Perform a full join with the pizzeria table
FULL JOIN pizzeria ON pizzeria.id = pv.pizzeria_id
-- Order the result by person name, visit date, and pizzeria name
ORDER BY person_name, visit_date, pizzeria_name;