SELECT
	person_visits.person_id AS person_id,  -- Selects the person_id from person_visits table
	COUNT(*) AS count_of_visits            -- Counts the number of visits for each person
FROM
	person_visits                          -- Specifies the table to select from
GROUP BY
	person_id                              -- Groups results by person_id
ORDER BY
	count_of_visits DESC,                  -- Orders results by count_of_visits in descending order
	person_id ASC;                         -- Orders results by person_id in ascending order if counts are equal