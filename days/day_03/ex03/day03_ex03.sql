-- Select a list of pizzerias where the number of female visitors is greater than
-- the number of male visitors
WITH cte_counts AS (
  -- Select the name of the pizzeria, the count of female visitors, and the count
  -- of male visitors
  SELECT 
    pizzeria.name AS pizzeria_name,
    COUNT(CASE WHEN person.gender = 'female' THEN 1 END) AS female_count,
    COUNT(CASE WHEN person.gender = 'male' THEN 1 END) AS male_count
  FROM pizzeria
  -- Join the person_visits table to get the list of visitors
  JOIN person_visits po ON pizzeria.id = po.pizzeria_id
  -- Join the person table to get the gender of the visitor
  JOIN person ON po.person_id = person.id
  -- Group the result by the name of the pizzeria
  GROUP BY pizzeria.name
)
-- Select the name of the pizzeria where the number of female visitors is greater
-- than the number of male visitors
SELECT pizzeria_name
FROM cte_counts
WHERE female_count > male_count
-- Select the name of the pizzeria where the number of male visitors is greater
-- than the number of female visitors
UNION ALL
SELECT pizzeria_name
FROM cte_counts
WHERE female_count < male_count
-- Sort the result by the name of the pizzeria
ORDER BY pizzeria_name;