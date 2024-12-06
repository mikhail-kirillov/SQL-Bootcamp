-- Create a view named v_generated_dates
CREATE VIEW v_generated_dates AS
-- Select generated_date formatted as date
SELECT generated_date::date
-- From generate_series with the following parameters
FROM generate_series(
    -- Start date
    '2022-01-01'::date, 
    -- End date
    '2022-01-31'::date, 
    -- Interval
    '1 day'::interval
) AS generated_date
-- Sort the result by generated_date
ORDER BY generated_date;