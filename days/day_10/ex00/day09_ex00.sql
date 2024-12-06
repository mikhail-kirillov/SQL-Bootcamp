-- Delete table if it exists
DROP TABLE IF EXISTS person_audit;

-- Create table
CREATE TABLE person_audit (
    -- Timestamp when entry was created
    created TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Type of event: I - insert, U - update, D - delete
    type_event CHAR(1) NOT NULL DEFAULT 'I',
    -- Ensure type_event can be only I, U or D
    CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D')),
    -- Id of the row in table person
    row_id BIGINT NOT NULL,
    -- Name of person
    name VARCHAR,
    -- Age of person
    age INTEGER,
    -- Gender of person
    gender VARCHAR,
    -- Address of person
    address VARCHAR
);

-- Create function that will be called after each insert on table person
CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() 
RETURNS TRIGGER AS $$
BEGIN
    -- Insert all values of the new row into table person_audit
    INSERT INTO person_audit(type_event, row_id, name, age, gender, address) VALUES ('I', NEW.*);
    -- Return new row
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger that calls the function after each insert on table person
CREATE OR REPLACE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW
EXECUTE PROCEDURE fnc_trg_person_insert_audit();

-- Insert example record
INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');