WITH columns AS (
	-- Select the address and the formula to calculate the comparison
	-- between the difference of the max and min ages and the average age
	SELECT
		person.address AS address,
		-- Calculate the formula
		-- The formula is the difference between the max and min ages
		-- divided by the max age and then rounded to 2 decimal places
		ROUND(
			(MAX(person.age::NUMERIC) - (MIN(person.age::NUMERIC) / MAX(person.age::NUMERIC))),
			2
		) AS formula,
		-- Calculate the average age
		-- The average age is the sum of all ages divided by the count of rows
		-- and then rounded to 2 decimal places
		ROUND(AVG(person.age), 2) AS average
	FROM person
	-- Group the results by address
	GROUP BY person.address
)
SELECT
	-- Select the address
	address,
	-- Select the formula
	formula,
	-- Select the average age
	average,
	-- Select the comparison
	-- The comparison is a boolean that is true if the formula is greater
	-- than the average age
	CASE WHEN formula > average THEN TRUE ELSE FALSE END AS comparison
FROM columns
-- Order the results by address
ORDER BY address;