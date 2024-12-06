-- Selects the average rating of all pizzerias
SELECT
	-- Rounds the average to 4 decimal places
	ROUND(AVG(pizzeria.rating), 4)
		-- Labels the result as global_rating
		AS global_rating
-- From the pizzeria table
FROM
	pizzeria;