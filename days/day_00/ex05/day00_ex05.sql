-- Select name from person table where person_id in person_order table is in list of the given menu_id
SELECT
  (SELECT name FROM person WHERE person.id = person_order.person_id) AS name  -- get name from person table
FROM
  person_order  -- table that contains records of orders by persons
WHERE
  (person_order.menu_id = 13 OR person_order.menu_id = 14 OR person_order.menu_id = 18)  -- condition to filter menu_id
  AND
  order_date = '2022-01-07';  -- condition to filter order_date