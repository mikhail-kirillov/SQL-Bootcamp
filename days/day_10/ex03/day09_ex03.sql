-- Drop trigger on table person
DROP TRIGGER IF EXISTS trg_person_insert_audit ON person;
DROP TRIGGER IF EXISTS trg_person_update_audit ON person;
DROP TRIGGER IF EXISTS trg_person_delete_audit ON person;

-- Drop functions
DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit();
DROP FUNCTION IF EXISTS fnc_trg_person_update_audit();
DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit();

-- Truncate table
TRUNCATE TABLE person_audit;

-- Create new function
CREATE OR REPLACE FUNCTION fnc_trg_person_audit() 
RETURNS TRIGGER AS $$
BEGIN
    -- Check if it is insert
    IF TG_OP = 'INSERT' THEN
        -- Insert all values of the new row into table person_audit
        INSERT INTO person_audit(type_event, row_id, name, age, gender, address) VALUES ('I', NEW.*);
        -- Return new row
        RETURN NEW;
    ELSEIF TG_OP = 'UPDATE' THEN -- Check if it is update
        -- Insert all values of the old row into table person_audit
        INSERT INTO person_audit (type_event, row_id, name, age, gender, address) VALUES ('U', OLD.*);
        -- Return old row
        RETURN OLD;
    ELSEIF TG_OP = 'DELETE' THEN -- Check if it is delete
        -- Insert all values of the old row into table person_audit
        INSERT INTO person_audit (type_event, row_id, name, age, gender, address)
            VALUES ('D', OLD.*);
        -- Return old row
        RETURN OLD;
    ELSE NULL;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Create trigger that calls the function after each insert, update or delete on table person
CREATE OR REPLACE TRIGGER trg_person_audit
AFTER INSERT OR UPDATE OR DELETE ON person 
FOR EACH ROW
EXECUTE PROCEDURE fnc_trg_person_audit();

-- Insert example record
INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
-- Update example record
UPDATE person SET name = 'Bulat' WHERE id = 10;
-- Update example record
UPDATE person SET name = 'Damir' WHERE id = 10;
-- Delete example record
DELETE FROM person WHERE id = 10;