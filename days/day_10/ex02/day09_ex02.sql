-- Function for logging delete in table person_audit
CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit()
RETURNS TRIGGER AS $$
BEGIN
  -- Insert all values of the old row into table person_audit
  INSERT INTO person_audit (type_event, row_id, name, age, gender, address)
  VALUES ('D', OLD.*);
  -- Return old row
  RETURN OLD;
END;
$$ LANGUAGE plpgsql;

-- Trigger that calls the function after each delete on table person
CREATE OR REPLACE TRIGGER trg_person_delete_audit
AFTER DELETE ON person
FOR EACH ROW
EXECUTE PROCEDURE fnc_trg_person_delete_audit();

-- Delete example record
DELETE FROM person
WHERE id = 10;