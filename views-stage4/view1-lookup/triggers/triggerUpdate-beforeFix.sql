CREATE OR REPLACE FUNCTION loop_up_update_trigger()
RETURNS TRIGGER AS $$
BEGIN
    -- First update the book entry itself
    UPDATE book
    SET 
        title = NEW.book_title,
        release_date = NEW.release_date,
        page_count = NEW.page_count,
        format = NEW.book_format,
        description = NEW.description,
        isbn = NEW.isbn
    WHERE id = OLD.book_id;

    -- Then update subsequent lookup tables
    UPDATE written_in
    SET language_id = (SELECT language_id FROM language WHERE name = NEW.language)
    WHERE id = OLD.book_id;

    UPDATE written_by
    SET author_id = (SELECT author_id FROM author WHERE first_name || ' ' || last_name = NEW.author_name)
    WHERE id = OLD.book_id;

    UPDATE type_of
    SET genre_id = (SELECT genre_id FROM genre WHERE name = NEW.genre)
    WHERE id = OLD.book_id;

    UPDATE published_by
    SET publisher_id = (SELECT publisher_id FROM publisher WHERE name = NEW.publisher_name)
    WHERE id = OLD.book_id;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;
