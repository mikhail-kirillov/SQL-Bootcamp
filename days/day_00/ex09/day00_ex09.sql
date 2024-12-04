-- Select person name and pizzeria name
SELECT 
  -- Get name from person table with matching person_id
  (SELECT name FROM person WHERE id = pv.person_id) AS person_name, 
  -- Get name from pizzeria table with matching pizzeria_id
  (SELECT name FROM pizzeria WHERE id = pv.pizzeria_id) AS pizzeria_name 
FROM 
  -- Get records from person_visits table where visit_date is between '2022-01-07' and '2022-01-09'
  (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-07' AND '2022-01-09') AS pv 
-- Order the result by person name in ascending order and pizzeria name in descending order
ORDER BY 
  person_name ASC, 
  pizzeria_name DESC;