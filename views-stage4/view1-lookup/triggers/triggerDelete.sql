CREATE OR REPLACE FUNCTION lookup_view_delete_trigger()
RETURNS TRIGGER AS $$
BEGIN
    -- Delete all info from relevant lookup tables
    DELETE FROM written_in WHERE id = OLD.book_id;
    DELETE FROM written_by WHERE id = OLD.book_id;
    DELETE FROM type_of WHERE id = OLD.book_id;
    DELETE FROM published_by WHERE id = OLD.book_id;

    -- Then delete book entry itself
    DELETE FROM book WHERE id = OLD.book_id;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;
