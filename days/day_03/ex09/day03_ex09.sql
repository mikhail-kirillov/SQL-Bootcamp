-- Insert two new records into person_visits table
INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES 
    -- Get the maximum id from person_visits table plus one
    ((SELECT MAX(id) FROM person_visits) + 1,
        -- Get the id of Denis from person table
        (SELECT id FROM person WHERE name = 'Denis'),
        -- Get the id of Dominos from pizzeria table
        (SELECT id FROM pizzeria WHERE name = 'Dominos'),
        -- The date of the visit
        '2022-02-24'
    ),
    -- Get the maximum id from person_visits table plus two
    ((SELECT MAX(id) FROM person_visits) + 2,
        -- Get the id of Irina from person table
        (SELECT id FROM person WHERE name = 'Irina'),
        -- Get the id of Dominos from pizzeria table
        (SELECT id FROM pizzeria WHERE name = 'Dominos'),
        -- The date of the visit
        '2022-02-24'
    );