-- Create a function to generate Fibonacci numbers
CREATE OR REPLACE FUNCTION fnc_fibonacci(
    -- Input parameter with default value 0
    IN pstop INTEGER DEFAULT 0
)
RETURNS SETOF INTEGER AS $$
-- Declare variables
DECLARE
    a INTEGER := 0;
    b INTEGER := 1;
    tmp INTEGER;
BEGIN
    -- Check if input parameter is valid
    IF pstop IS NULL OR pstop < 0 THEN
        -- Raise an exception if the input parameter is not valid
        RAISE EXCEPTION 'Invalid input: pstop must be a positive integer. Received: %', pstop;
    END IF;
    -- Return the first Fibonacci number
    RETURN NEXT a;
    -- Loop until the second Fibonacci number is greater than the input parameter
    WHILE b < pstop LOOP
        -- Return the second Fibonacci number
        RETURN NEXT b;
        -- Calculate the next Fibonacci number
        tmp := a + b;
        -- Update the first Fibonacci number
        a := b;
        -- Update the second Fibonacci number
        b := tmp;
    END LOOP;
    -- Return the result
    RETURN;
END;
$$ LANGUAGE plpgsql;

-- Example call to the function with a positive integer
SELECT * FROM fnc_fibonacci(100);

-- Example call to the function with the default value
SELECT * FROM fnc_fibonacci();