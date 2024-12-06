ALTER TABLE person_discounts
    -- Add a constraint to check that person_id is not null
    ADD CONSTRAINT ch_nn_person_id CHECK (person_id IS NOT NULL),
    -- Add a constraint to check that pizzeria_id is not null
    ADD CONSTRAINT ch_nn_pizzeria_id CHECK (pizzeria_id IS NOT NULL),
    -- Add a constraint to check that discount is not null
    ADD CONSTRAINT ch_nn_discount CHECK (discount IS NOT NULL),
    -- Set the default value of discount to 0
    ALTER COLUMN discount SET DEFAULT 0,
    -- Add a constraint to ensure discount is between 0 and 100
    ADD CONSTRAINT ch_range_discount CHECK (discount BETWEEN 0 AND 100);