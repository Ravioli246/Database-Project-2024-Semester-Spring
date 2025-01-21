CREATE TRIGGER look_up_update
INSTEAD OF UPDATE ON look_up
FOR EACH ROW
EXECUTE FUNCTION look_up_update_trigger();
