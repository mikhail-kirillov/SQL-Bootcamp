-- Insert a new pizza into the menu table with the following values:
-- id: the maximum id from the menu table plus one
-- pizzeria_id: the id of the pizzeria named 'Dominos'
-- pizza_name: 'sicilian pizza'
-- price: 900
INSERT INTO menu (id, pizzeria_id, pizza_name, price)
VALUES (
    -- Get the maximum id from the menu table plus one
    (SELECT MAX(id) FROM menu) + 1,
    -- Get the id of the pizzeria named 'Dominos'
    (SELECT id FROM pizzeria WHERE name = 'Dominos'),
    -- The name of the pizza
    'sicilian pizza',
    -- The price of the pizza
    900
);