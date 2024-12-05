-- Delete all orders with date '2022-02-25'
DELETE FROM person_order
  -- Filter orders by date
  WHERE person_order.order_date = '2022-02-25';

-- Delete all pizzas named 'greek pizza'
DELETE FROM menu
  -- Filter pizzas by name
  WHERE menu.pizza_name = 'greek pizza';