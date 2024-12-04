-- Select distinct person_id from the person_visits table
SELECT DISTINCT 
  person_id  -- unique identifier for each person
FROM 
  person_visits  -- table containing records of visits by persons
WHERE 
  (visit_date BETWEEN '2022-01-06' AND '2022-01-09')  -- condition to filter visits in the specified date range
  OR 
  person_id = 2  -- condition to include person with ID 2 regardless of visit date
ORDER BY 
  person_id DESC;  -- order the results by person_id in descending order