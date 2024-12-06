-- Select names from the view v_persons_male
SELECT name
FROM v_persons_male
-- Union operator to combine result sets
UNION
-- Select names from the view v_persons_female
SELECT name
FROM v_persons_female
-- Sort the result by name
ORDER BY name;