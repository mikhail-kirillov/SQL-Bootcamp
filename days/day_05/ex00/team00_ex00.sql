-- Drop the cities table if it already exists
DROP TABLE IF EXISTS cities;

-- Create the cities table
CREATE TABLE cities (
  -- First city (single character, cannot be null)
  first_city VARCHAR(1) NOT NULL,
  -- Second city (single character, cannot be null)
  second_city VARCHAR(1) NOT NULL,
  -- Path cost from one city to another
  cost INT NOT NULL
);

-- Populate the cities table with data
INSERT INTO cities (first_city, second_city, cost)
VALUES 
  ('a', 'b', 10),
  ('b', 'c', 35),
  ('c', 'd', 30),
  ('d', 'a', 20),
  ('a', 'c', 15),
  ('c', 'b', 35),
  ('b', 'a', 10),
  ('a', 'd', 20),
  ('d', 'b', 25),
  ('c', 'a', 15),
  ('b', 'd', 25),
  ('d', 'c', 30);

-- Recursive query to get all routes between cities with costs
WITH RECURSIVE route AS (
    -- Select the next city
    SELECT 
    cities.second_city AS second_city,
    -- Initialize path with the first city
    CONCAT('{', cities.first_city) AS path,
    -- Path cost from the first city to the second
    cost AS total_cost
    FROM cities
    -- Where the first city is 'a'
    WHERE cities.first_city = 'a'
    -- Union all possible routes
    UNION ALL
    -- Select the next city
    SELECT
    cities.second_city,
    -- Add the city to the path
    CONCAT(path, ',', cities.first_city) AS path,
    -- Increment the path cost
    route.total_cost + cities.cost
    FROM cities
    -- Join with recursive query
    JOIN route
    -- Where the second city in route is the first city in cities to find all possible routes from the last city in the path
    ON route.second_city = cities.first_city
    -- Where the current city (cities.first_city) is not in the already traversed path to avoid cycles
    WHERE POSITION(cities.first_city IN REPLACE(route.path, '{', '')) = 0
),
-- Obtain results
result AS (
    -- Select
    SELECT
    -- Total path cost
    route.total_cost AS total_cost,
    -- Complete path, adding return to the starting city
    CONCAT(route.path, ',a}') AS tour
    FROM route
    -- Where the last city as the second city in the cities table equals 'a'
    WHERE second_city = 'a'
    -- And the number of cities is 4 (including "," and "{}" = 8)
    AND CHAR_LENGTH(route.path) = 8
),
min_result AS (
    -- Select all
    SELECT *
    FROM result
    -- Where the cost is minimal
    WHERE result.total_cost = (SELECT MIN(total_cost) FROM result)
)
-- Output the result
SELECT * FROM min_result
-- Sort by total cost and tour
ORDER BY total_cost, tour;