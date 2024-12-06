-- Create a view named v_symmetric_union
CREATE VIEW v_symmetric_union AS (
    -- Return all values from the first set which are not in the second set
    (
        SELECT person_id
        FROM person_visits
        WHERE visit_date = '2022-01-02'
        EXCEPT
        SELECT person_id
        FROM person_visits
        WHERE visit_date = '2022-01-06'
    )
    UNION
    -- Return all values from the second set which are not in the first set
    (
        SELECT person_id
        FROM person_visits
        WHERE visit_date = '2022-01-06'
        EXCEPT
        SELECT person_id
        FROM person_visits
        WHERE visit_date = '2022-01-02'
    )
)
-- Sort the result by person_id
ORDER BY person_id;