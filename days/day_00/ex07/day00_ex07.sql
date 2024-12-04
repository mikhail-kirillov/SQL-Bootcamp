-- Select the id, name, and age from the person table
SELECT 
  id,  -- unique identifier for each person
  name,  -- name of the person
  age,  -- age of the person
  -- Determine interval_info based on age
  (CASE 
    WHEN age BETWEEN 10 AND 20 THEN 'interval #1'  -- age between 10 and 20
    WHEN age > 20 AND age < 24 THEN 'interval #2'  -- age between 21 and 23
    ELSE 'interval #3'  -- any other age
  END) AS interval_info 
FROM 
  person  -- table containing person records
ORDER BY 
  interval_info ASC;  -- order by interval_info in ascending order