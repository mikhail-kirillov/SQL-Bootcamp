-- Selects the name and the count of visits for each person
SELECT
	person.name AS name, -- Selects the name from person table
	COUNT(*) AS count_of_visits -- Counts the number of visits for each person
FROM
	person_visits -- Specifies the table to select from
	JOIN
	person ON person.id = person_visits.person_id -- Joins person table with person_visits table
GROUP BY
	person.name -- Groups results by name
ORDER BY
	count_of_visits DESC, -- Orders results by count_of_visits in descending order
	name ASC -- Orders results by name in ascending order if counts are equal
LIMIT 4; -- Limits the results to 4