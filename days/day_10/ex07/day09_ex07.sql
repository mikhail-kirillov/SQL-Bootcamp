-- Function to return the minimum of a VARIADIC array
CREATE OR REPLACE FUNCTION func_minimum(
    -- VARIADIC array of numbers
    VARIADIC arr NUMERIC[]
)
RETURNS NUMERIC AS $$
    -- Select the minimum from an unnested array
    SELECT MIN(numbers)
    -- Unnest the array as a table
    FROM UNNEST(arr) AS numbers;
$$ LANGUAGE SQL;

-- Example call to the function with a VARIADIC array
SELECT func_minimum(
    -- VARIADIC array with four numbers
    VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]
);