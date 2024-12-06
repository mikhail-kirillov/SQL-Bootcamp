-- Function for logging update in table person_audit
CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit() 
RETURNS TRIGGER AS $$
BEGIN
  -- Insert all values of the old row into table person_audit
  INSERT INTO person_audit (type_event, row_id, name, age, gender, address) VALUES ('U', OLD.*);
  -- Return old row
  RETURN OLD;
END;
$$ LANGUAGE plpgsql;

-- Trigger that calls the function after each update on table person
CREATE OR REPLACE TRIGGER trg_person_update_audit
AFTER UPDATE ON person
FOR EACH ROW
EXECUTE PROCEDURE fnc_trg_person_update_audit();

-- Update example record
UPDATE person
SET name = 'Bulat'
WHERE id = 10;

-- Update example record
UPDATE person
SET name = 'Damir'
WHERE id = 10;