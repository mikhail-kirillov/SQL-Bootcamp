CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT menu.pizzeria_id, menu.pizza_name
FROM menu
WHERE menu.pizza_name = 'cheese pizza'
AND menu.pizzeria_id = 1;