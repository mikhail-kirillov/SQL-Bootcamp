-- Insert into person_discounts table
INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)

-- Select the id, person_id, pizzeria_id and discount from the query below
SELECT
    -- Generate a row number for each row
    ROW_NUMBER() OVER () AS id,
    -- Get the person_id from person_order table
    person_order.person_id,
    -- Get the pizzeria_id from menu table
    menu.pizzeria_id,
    -- Calculate the discount based on the count of orders
    CASE
        -- If the count of orders is 1, the discount is 10.5
        WHEN COUNT(*) = 1 THEN 10.5
        -- If the count of orders is 2, the discount is 22
        WHEN COUNT(*) = 2 THEN 22
        -- Otherwise, the discount is 30
        ELSE 30
    END AS discount_amount

-- From the person_order table
FROM
    person_order

-- Join the menu table with person_order table on menu_id
JOIN
    menu ON menu.id = person_order.menu_id

-- Group the result by person_id and pizzeria_id
GROUP BY
    person_id,
    pizzeria_id;