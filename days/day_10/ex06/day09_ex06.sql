-- Function that returns the names of pizzerias that a certain person visited and ate at on a certain date
CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    -- Input parameter for the person's name with default 'Dmitry'
    IN pperson VARCHAR DEFAULT 'Dmitry',
    -- Input parameter for the maximum price of the dish with default 500
    IN pprice NUMERIC DEFAULT 500,
    -- Input parameter for the date with default '2022-01-08'
    IN pdate DATE DEFAULT '2022-01-08')
RETURNS TABLE (pizzeria_name VARCHAR) AS $$
BEGIN
    -- Return the names of the pizzerias
    RETURN QUERY
    SELECT pizzeria.name
    -- From the pizzeria table
    FROM pizzeria
    -- Join the person_visits table on the pizzeria_id
    JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
    -- Join the person table on the person_id
    JOIN person ON person.id = person_visits.person_id
    -- Join the menu table on the pizzeria_id
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    -- Where the person's name is equal to the input parameter
    WHERE person.name = pperson
        -- And the price of the dish is less than the input parameter
        AND menu.price < pprice
        -- And the visit date is equal to the input parameter
        AND person_visits.visit_date = pdate;
END;
$$ LANGUAGE plpgsql;

-- Get the names of pizzerias that the person 'Dmitry' visited and ate at on '2022-01-08' with a price of less than 800
SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

-- Get the names of pizzerias that the person 'Anna' visited and ate at on '2022-01-01' with a price of less than 1300
SELECT *
FROM fnc_person_visits_and_eats_on_date(
    pperson := 'Anna',
    pprice := 1300,
    pdate := '2022-01-01');