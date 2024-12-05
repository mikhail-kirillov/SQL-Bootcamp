-- Reduce the price of 'greek pizza' by 10%
UPDATE menu
SET price = price * (1 - 0.1)  -- reduce the price by 10%
WHERE pizza_name = 'greek pizza';  -- target 'greek pizza'