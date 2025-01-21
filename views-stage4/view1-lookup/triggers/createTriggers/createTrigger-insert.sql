CREATE TRIGGER look_up_insert
INSTEAD OF INSERT ON look_up
FOR EACH ROW
EXECUTE FUNCTION look_up_insert_trigger();
