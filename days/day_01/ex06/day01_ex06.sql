-- Select order_date and person_name from the person_order table
SELECT order_date AS action_date, 
    -- Select the name from the person table
    (SELECT name FROM person WHERE id = person_id) AS person_name 
FROM person_order
-- Combine with the results from the next query using INTERSECT
INTERSECT
-- Select visit_date and person_name from the person_visits table
SELECT visit_date AS action_date, 
    -- Select the name from the person table
    (SELECT name FROM person WHERE id = person_id) AS person_name 
FROM person_visits
-- Sort the results by action_date and person_name
ORDER BY action_date ASC, person_name DESC;