-- Select order_date and person_id from the person_order table
SELECT order_date AS action_date, person_id AS person_id 
FROM person_order
-- Combine with the results from the next query
INTERSECT
-- Select visit_date and person_id from the person_visits table
SELECT visit_date AS action_date, person_id AS person_id 
FROM person_visits
-- Sort the results by action_date and person_id
ORDER BY action_date ASC, person_id DESC;