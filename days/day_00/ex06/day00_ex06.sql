-- Select name and boolean check if name is 'Denis' or not
-- From person and person_order tables
SELECT 
  -- Select name from person table as NAME
  person_.name AS NAME, 
  -- Use CASE expression to check if name is 'Denis'
  -- If name is 'Denis' then return TRUE, else FALSE
  (CASE 
    WHEN person_.name = 'Denis' THEN TRUE 
    ELSE FALSE 
  END) AS check_name
FROM 
  -- From person table
  person AS person_, 
  -- From person_order table
  person_order AS person_order_
WHERE 
  -- Join person and person_order table on person_id
  person_order_.person_id = person_.id 
  -- Filter menu_id to be one of the given list
  AND 
  (person_order_.menu_id = 13 OR person_order_.menu_id = 14 OR person_order_.menu_id = 18) 
  -- Filter order_date to be '2022-01-07'
  AND 
  person_order_.order_date = '2022-01-07';