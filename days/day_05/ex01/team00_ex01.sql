-- Recursive query to get all routes between cities with costs
WITH RECURSIVE route AS (
    -- Select next city
    SELECT 
    -- Second city
    cities.second_city AS second_city,
    -- Concatenate first city with path
    CONCAT('{', cities.first_city) AS path,
    -- Path cost from first city to second
    cost AS total_cost
    -- From cities
    FROM cities
    -- Where first city is 'a'
    WHERE cities.first_city = 'a'
    -- Union all possible routes
    UNION ALL
    -- Select next city
    SELECT
    -- Second city
    cities.second_city,
    -- Concatenate current city with path
    CONCAT(path, ',', cities.first_city) AS path,
    -- Increment path cost
    route.total_cost + cities.cost
    -- From cities
    FROM cities
    -- Join with recursive query
    JOIN route
    -- Where second city in route is the first city in cities to find all possible routes from the last city in the path
    ON route.second_city = cities.first_city
    -- Where current city (cities.first_city) is not in the already traversed path to avoid cycles
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
min_and_max_result AS (
    -- Select all
    SELECT *
    -- From result of all routes
    FROM result
    -- Where cost is minimal
    WHERE result.total_cost = (SELECT MIN(total_cost) FROM result)
    -- Union
    UNION
    -- Select all
    SELECT *
    -- From result of all routes
    FROM result
    -- Where cost is maximal
    WHERE result.total_cost = (SELECT MAX(total_cost) FROM result)
)
-- Output the result
SELECT * FROM min_and_max_result
-- Sort by total cost and tour
ORDER BY total_cost, tour;