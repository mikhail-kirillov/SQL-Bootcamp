-- Select distinct pizzeria names
SELECT DISTINCT pizzeria.name AS pizzeria_name
FROM pizzeria
-- Check for existence of orders by females in the pizzeria
WHERE EXISTS (
    SELECT 1
    FROM menu
    -- Join to person_order to link menu items with orders
    JOIN person_order ON person_order.menu_id = menu.id
    -- Join to person to filter by gender
    JOIN person ON person.id = person_order.person_id
    -- Match pizzeria ID and filter by female gender
    WHERE pizzeria.id = menu.pizzeria_id
    AND person.gender = 'female'
)
-- Ensure no orders by males in the same pizzeria
AND NOT EXISTS (
    SELECT 1
    FROM menu
    JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person.id = person_order.person_id
    WHERE pizzeria.id = menu.pizzeria_id
    AND person.gender = 'male'
)
-- Union with pizzerias where only males have made orders
UNION
-- Select distinct pizzeria names
SELECT DISTINCT pizzeria.name AS pizzeria_name
FROM pizzeria
-- Check for existence of orders by males in the pizzeria
WHERE EXISTS (
    SELECT 1
    FROM menu
    JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person.id = person_order.person_id
    WHERE pizzeria.id = menu.pizzeria_id
    AND person.gender = 'male'
)
-- Ensure no orders by females in the same pizzeria
AND NOT EXISTS (
    SELECT 1
    FROM menu
    JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person.id = person_order.person_id
    WHERE pizzeria.id = menu.pizzeria_id
    AND person.gender = 'female'
);