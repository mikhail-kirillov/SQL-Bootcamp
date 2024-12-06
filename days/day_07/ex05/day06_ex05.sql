COMMENT ON TABLE person_discounts IS
    -- Comment on the table person_discounts
    'Таблица для хранения информации о скидках';

COMMENT ON COLUMN person_discounts.id IS
    -- Comment on the column id
    'Первичный ключ таблицы, который генерируется автоматически';

COMMENT ON COLUMN person_discounts.person_id IS
    -- Comment on the column person_id
    'Идентификатор пользователя, который не может быть NULL';

COMMENT ON COLUMN person_discounts.pizzeria_id IS
    -- Comment on the column pizzeria_id
    'Идентификатор пиццерии, который не может быть NULL';

COMMENT ON COLUMN person_discounts.discount IS
    -- Comment on the column discount
    'Скидка, которая не может быть NULL, по умолчанию равна 0 и должна быть в диапазоне от 0 до 100';