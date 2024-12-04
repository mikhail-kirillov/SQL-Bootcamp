(
    -- Select the id and name of each person
    SELECT id AS object_id, name AS object_name
    -- From the person table
    FROM person
)
UNION
(
    -- Select the id and pizza_name of each menu item
    SELECT id AS object_id, pizza_name AS object_name
    -- From the menu table
    FROM menu
)
-- Sort the results first by object_id then by object_name
ORDER BY object_id, object_name;