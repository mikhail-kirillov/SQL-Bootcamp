-- Select id from menu table
SELECT
    menu.id AS menu_id
-- From menu table
FROM
    menu
-- Where id is not in (subquery to get all menu ids from person_order table)
WHERE
    menu.id NOT IN (
        -- Select menu id from person_order table
        SELECT
            person_order.menu_id
        -- From person_order table
        FROM
            person_order
    )
-- Order by id
ORDER BY
    menu.id;