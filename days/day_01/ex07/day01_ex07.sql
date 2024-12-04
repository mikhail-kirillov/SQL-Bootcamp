-- Select the order date from the person_order table and alias it as date
SELECT person_order.order_date AS date, 
       -- Concatenate the person's name and age and alias it as name
       CONCAT(person.name, ' (age:', person.age, ')' ) AS name 
-- From the person_order table
FROM person_order
-- Join with the person table on person_id
JOIN person ON person_order.person_id = person.id
-- Order the results by date and name in ascending order
ORDER BY date ASC, name ASC;