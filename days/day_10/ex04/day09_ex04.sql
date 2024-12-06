-- Create a function to return all female persons
CREATE FUNCTION fnc_persons_female()
RETURNS TABLE ( -- Specify the table structure for the returned data
    id BIGINT, -- ID of the person
    name VARCHAR, -- Name of the person
    age INTEGER, -- Age of the person
    gender VARCHAR, -- Gender of the person
    address VARCHAR -- Address of the person
) AS $$
    -- Select all columns from the person table where gender is female
    SELECT * 
    FROM person 
    WHERE gender = 'female'
$$ LANGUAGE SQL;

-- Create a function to return all male persons
CREATE FUNCTION fnc_persons_male()
RETURNS TABLE ( -- Specify the table structure for the returned data
    id BIGINT, -- ID of the person
    name VARCHAR, -- Name of the person
    age INTEGER, -- Age of the person
    gender VARCHAR, -- Gender of the person
    address VARCHAR -- Address of the person
) AS $$
    -- Select all columns from the person table where gender is male
    SELECT * 
    FROM person 
    WHERE gender = 'male'
$$ LANGUAGE SQL;

-- Select all male persons using the created function
SELECT * 
FROM fnc_persons_male();

-- Select all female persons using the created function
SELECT * 
FROM fnc_persons_female();