-- Select name and age of all person living in Kazan
SELECT 
  name,  -- person's name
  age    -- person's age
FROM 
  person  -- table containing person records
WHERE 
  address = 'Kazan';  -- condition to filter persons living in Kazan