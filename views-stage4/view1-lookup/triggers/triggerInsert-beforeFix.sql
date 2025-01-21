CREATE OR REPLACE FUNCTION insert_into_book_view()
RETURNS TRIGGER AS $$
BEGIN
    -- First insert book and passed values into book entry
    INSERT INTO book (title, release_date, page_count, format, description, isbn)
    VALUES (NEW.book_title, NEW.release_date, NEW.page_count, NEW.book_format, NEW.description, NEW.isbn);

    -- Then insert individual entries for the lookup tables
    INSERT INTO written_in (id, language_id)
    VALUES (currval('book_id_seq'), (SELECT language_id FROM language WHERE name = NEW.language));

    INSERT INTO written_by (id, author_id)
    VALUES (currval('book_id_seq'), (SELECT author_id FROM author WHERE first_name || ' ' || last_name = NEW.author_name));

    INSERT INTO type_of (id, genre_id)
    VALUES (currval('book_id_seq'), (SELECT genre_id FROM genre WHERE name = NEW.genre));

    INSERT INTO published_by (id, publisher_id)
    VALUES (currval('book_id_seq'), (SELECT publisher_id FROM publisher WHERE name = NEW.publisher_name));

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER book_view_insert
INSTEAD OF INSERT ON book_lookup_view
FOR EACH ROW EXECUTE FUNCTION insert_into_book_view();
