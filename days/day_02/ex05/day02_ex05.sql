-- Select the person's name
SELECT person.name
-- From the person table
FROM person
-- Where the person is older than 25
-- And the person is female
WHERE person.age > 25
  AND person.gender = 'female'
-- Order the result by the person's name
ORDER BY person.name ASC;