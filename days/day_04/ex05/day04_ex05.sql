-- Create a view named v_price_with_discount
CREATE VIEW v_price_with_discount AS
-- Select person name, menu pizza name, menu price and discount price
SELECT
    person.name,
    menu.pizza_name,
    menu.price,
    ROUND(menu.price - menu.price * 0.1) AS discount_price
-- Join person table with person_order table
FROM
    person
JOIN
    person_order ON person_order.person_id = person.id
-- Join person_order table with menu table
JOIN
    menu ON menu.id = person_order.menu_id
-- Sort the result by person name and menu pizza name
ORDER BY
    person.name,
    menu.pizza_name;