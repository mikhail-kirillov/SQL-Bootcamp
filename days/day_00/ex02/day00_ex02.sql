-- Select name and rating of all pizzeria with rating between 3.5 and 5
SELECT 
  name,  -- name of pizzeria
  rating  -- rating of pizzeria
FROM 
  pizzeria  -- table containing pizzeria records
WHERE 
  rating >= 3.5  -- condition to filter minimum rating
  AND 
  rating <= 5  -- condition to filter maximum rating
ORDER BY 
  rating;  -- order by rating

-- Select name and rating of all pizzeria with rating between 3.5 and 5
SELECT 
  name,  -- name of pizzeria
  rating  -- rating of pizzeria
FROM 
  pizzeria  -- table containing pizzeria records
WHERE 
  rating BETWEEN 3.5 AND 5  -- condition to filter minimum and maximum rating
ORDER BY 
  rating;  -- order by rating