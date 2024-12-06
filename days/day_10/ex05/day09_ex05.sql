-- Drop function if it exists for retrieving female persons
DROP FUNCTION IF EXISTS fnc_persons_female();

-- Drop function if it exists for retrieving male persons
DROP FUNCTION IF EXISTS fnc_persons_male();

-- Create or replace a function to retrieve persons based on gender
CREATE OR REPLACE FUNCTION fnc_persons(
    IN pgender VARCHAR DEFAULT 'female' -- Input parameter for gender with default 'female'
)
RETURNS TABLE ( -- Define the structure of the returned table
    id BIGINT, -- ID of the person
    name VARCHAR, -- Name of the person
    age INTEGER, -- Age of the person
    gender VARCHAR, -- Gender of the person
    address VARCHAR -- Address of the person
) AS $$
    -- Select all columns from the person table where gender matches input parameter
    SELECT *
    FROM person
    WHERE gender = pgender;
$$ LANGUAGE SQL;

-- Select all male persons using the created function
SELECT *
FROM fnc_persons(pgender := 'male');

-- Select all female persons using the created function
SELECT *
FROM fnc_persons();