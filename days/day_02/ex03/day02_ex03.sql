-- Get the missing dates between 2022-01-01 and 2022-01-10
WITH missing_dates AS (
    -- Generate a series of dates
    SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) AS missing_date
)
-- Select the missing date
SELECT missing_dates.missing_date::date
-- From the missing_dates result
FROM missing_dates
-- Perform a left join with the person_visits table
LEFT JOIN person_visits
    -- On matching visit_date fields
    ON missing_dates.missing_date = person_visits.visit_date
    -- And the person_id is either 1 or 2
    AND (person_visits.person_id = 1 OR person_visits.person_id = 2)
-- Where there are no matching records in person_visits
WHERE person_visits.visit_date IS NULL
-- Order the result by the missing date
ORDER BY missing_dates.missing_date ASC;