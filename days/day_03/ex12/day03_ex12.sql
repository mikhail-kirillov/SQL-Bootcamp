-- Insert orders for all persons into person_order table
INSERT INTO person_order (id, person_id, menu_id, order_date)
-- Calculate id as maximum existing id plus person id
SELECT (SELECT MAX(id) FROM person_order) + person.id,
       -- Get person id
       person.id,
       -- Get menu id for 'greek pizza'
       menu.id,
       -- Set order date to '2022-02-25'
       '2022-02-25'
FROM person, menu
-- Filter orders only for 'greek pizza'
WHERE menu.pizza_name = 'greek pizza';