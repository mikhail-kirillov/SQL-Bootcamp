-- Create a table to store all discounts for all people for all pizzerias.
CREATE TABLE person_discounts (
    -- An id to uniquely identify each discount.
    id BIGINT PRIMARY KEY NOT NULL,
    -- The id of the person who has the discount.
    person_id BIGINT NOT NULL,
    -- The id of the pizzeria that granted the discount.
    pizzeria_id BIGINT NOT NULL,
    -- The discount that the person has.
    discount NUMERIC,
    -- Constraint to ensure that the person_id references a valid person.
    CONSTRAINT fk_person_discounts_person_id 
        FOREIGN KEY (person_id) REFERENCES person(id),
    -- Constraint to ensure that the pizzeria_id references a valid pizzeria.
    CONSTRAINT fk_person_discounts_pizzeria_id 
        FOREIGN KEY (pizzeria_id) REFERENCES pizzeria(id)
);