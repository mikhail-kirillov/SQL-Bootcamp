-- Select all records from person_order table
SELECT 
  * 
-- From person_order table
FROM 
  person_order 
-- Where the id is even
WHERE 
  id % 2 = 0 
-- Order the result by id
ORDER BY 
  id;