-- Drop views
DROP VIEW IF EXISTS
    -- View v_persons_male
    v_persons_male,
    -- View v_persons_female
    v_persons_female,
    -- View v_generated_dates
    v_generated_dates,
    -- View v_symmetric_union
    v_symmetric_union,
    -- View v_price_with_discount
    v_price_with_discount;

-- Drop materialized views
DROP MATERIALIZED VIEW mv_dmitriy_visits_and_eats;