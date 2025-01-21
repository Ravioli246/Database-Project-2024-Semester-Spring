CREATE TRIGGER look_up_delete
INSTEAD OF DELETE ON look_up
FOR EACH ROW
EXECUTE FUNCTION look_up_delete_trigger();
