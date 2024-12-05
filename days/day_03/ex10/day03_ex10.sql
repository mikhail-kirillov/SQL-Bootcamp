-- Insert two new records into person_order table
INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES 
    -- Get the maximum id from person_order table plus one
    ((SELECT MAX(id) FROM person_order) + 1,
        -- Get the id of Denis from person table
        (SELECT id FROM person WHERE name = 'Denis'),
        -- Get the id of Sicilian pizza from menu table
        (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
        -- The date of the order
        '2022-02-24'
    ),
    -- Get the maximum id from person_order table plus two
    ((SELECT MAX(id) FROM person_order) + 2,
        -- Get the id of Irina from person table
        (SELECT id FROM person WHERE name = 'Irina'),
        -- Get the id of Sicilian pizza from menu table
        (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
        -- The date of the order
        '2022-02-24'
    );