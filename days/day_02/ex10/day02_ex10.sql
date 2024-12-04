-- Select the name of the first person
SELECT person_one.name AS person_name1,
       -- Select the name of the second person
       person_two.name AS person_name2,
       -- Select the common address
       person_one.address AS common_address
-- From the person table twice, with different aliases
FROM person AS person_one,
     person AS person_two
-- Where the id of the first person is greater than the id of the second person
WHERE person_one.id > person_two.id
  -- And the address of the first person is the same as the address of the second person
  AND person_one.address = person_two.address
-- Order the result by the name of the first person, the name of the second person, and the address
ORDER BY person_one.name,
         person_two.name,
         person_one.address;