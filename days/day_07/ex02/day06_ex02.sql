SELECT
    person.name AS name, -- Select the name of the person
    menu.pizza_name AS pizza_name, -- Select the name of the pizza
    menu.price AS price, -- Select the price of the pizza
    (menu.price * ((100 - person_discounts.discount) / 100)) AS discount_price, -- Calculate the discounted price
    pizzeria.name AS pizzeria_name -- Select the name of the pizzeria
FROM person_discounts
JOIN person ON person.id = person_discounts.person_id -- Join with person table on person_id
JOIN person_order ON person_order.person_id = person.id -- Join with person_order table on person_id
JOIN menu ON menu.id = person_order.menu_id -- Join with menu table on menu_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id -- Join with pizzeria table on pizzeria_id
ORDER BY
    person.name, -- Order by person name
    menu.pizza_name; -- Order by pizza name