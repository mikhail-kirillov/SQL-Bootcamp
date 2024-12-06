-- Create a sequence for the id column
CREATE SEQUENCE seq_person_discounts
    -- Starting from 1
    START WITH 1
    -- Increment by 1
    INCREMENT BY 1
    -- No max value
    NO MAXVALUE;

-- Set the default value of the id column to the next value of the sequence
ALTER TABLE person_discounts
    ALTER COLUMN id
        SET DEFAULT nextval('seq_person_discounts');

-- Set the current value of the sequence to the count of records in the table + 1
SELECT setval('seq_person_discounts',
              COALESCE((SELECT COUNT(*) FROM person_discounts), 0) + 1);