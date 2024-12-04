-- Concatenate person information as name (age: <age>, gender: '<gender>', address: '<address>')
-- and select the result as person_information
SELECT 
  CONCAT(
    name, 
    ' (age:', 
    CAST(age AS VARCHAR), 
    ', gender:', 
    '''', 
    gender, 
    '''', 
    ', address:', 
    '''', 
    address, 
    '''', 
    ')'
  ) AS person_information 
-- From person table
FROM 
  person 
-- Order the result by person information in ascending order
ORDER BY 
  person_information ASC;