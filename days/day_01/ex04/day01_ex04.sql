-- Select person_id from person_order
SELECT person_id 
-- Where order_date is 2022-01-07
FROM person_order 
WHERE order_date = '2022-01-07'
-- Except all
EXCEPT ALL
-- Select person_id from person_visits
SELECT person_id 
-- Where visit_date is 2022-01-07
FROM person_visits
WHERE visit_date = '2022-01-07';