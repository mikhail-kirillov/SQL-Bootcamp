-- Select the person's name and the number of visits
SELECT
    person.name AS name,
    COUNT(*) AS count_of_visits
-- From the person table
FROM
    person
-- Join the person_visits table on matching person_id
JOIN
    person_visits
        ON person_visits.person_id = person.id
-- Group the results by person's name
GROUP BY
    person.name
-- Filter for persons with more than 3 visits
HAVING
    COUNT(*) > 3;