-- Select the generated_date and alias it as missing_date
SELECT
  generated_date AS missing_date
-- From the view v_generated_dates
FROM
  v_generated_dates
-- Where the generated_date is not present in visit_date from person_visits
WHERE
  generated_date NOT IN (SELECT visit_date FROM person_visits)
-- Order the result by missing_date
ORDER BY
  missing_date;