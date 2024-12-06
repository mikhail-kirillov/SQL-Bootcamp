-- Create a view named v_persons_female
CREATE VIEW v_persons_female AS
-- Select all columns
SELECT *
-- From the person table
FROM person
-- Where the gender is female
WHERE gender = 'female';

-- Create a view named v_persons_male
CREATE VIEW v_persons_male AS
-- Select all columns
SELECT *
-- From the person table
FROM person
-- Where the gender is male
WHERE gender = 'male';