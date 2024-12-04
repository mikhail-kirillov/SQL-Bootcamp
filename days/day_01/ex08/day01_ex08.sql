-- Select the order date and person information
SELECT po.order_date, 
       -- Concatenate the person's name and age and alias it as person information
       CONCAT (p.name, ' (age:', p.age, ')') AS person_information
FROM person_order AS po
-- Join with the person table on person_id
NATURAL JOIN (SELECT id AS person_id, name, age FROM person) AS p
-- Sort the results by order_date and person information
ORDER BY order_date, person_information;