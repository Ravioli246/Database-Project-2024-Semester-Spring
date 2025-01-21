CREATE OR REPLACE FUNCTION lookup_view_update_trigger()
RETURNS TRIGGER AS $$
DECLARE
    new_author_id INT;
    new_publisher_id INT;
    new_genre_id INT;
    new_language_id INT;
BEGIN
    -- First update the book table
    UPDATE book
    SET 
        title = NEW.book_title,
        release_date = NEW.release_date,
        page_count = NEW.page_count,
        format = NEW.book_format,
        description = NEW.description,
        isbn = NEW.isbn
    WHERE id = OLD.book_id;

    -- Handles missing author
    SELECT author_id INTO new_author_id
    FROM author
    WHERE first_name || ' ' || last_name = NEW.author_name;
    IF new_author_id IS NULL THEN
        INSERT INTO author (author_id, first_name, last_name, date_of_birth, biography)
        VALUES (
            -- Generates new author_id, names, DOB, bio
            author_id
            split_part(NEW.author_name, ' ', 1)
            split_part(NEW.author_name, ' ', 2)
            '1984-11-07',
            'Nowhere Town'
        )
        RETURNING author_id INTO new_author_id;
    END IF;

    -- Handles missing publisher
    SELECT publisher_id INTO new_publisher_id
    FROM publisher
    WHERE name = NEW.publisher_name;
    IF new_publisher_id IS NULL THEN
        INSERT INTO publisher (publisher_id, name, phone_number, website)
        VALUES (
            -- Generates new publisher_id, name, default number, and site
            publisher_id,
            NEW.publisher_name,
            '059-555-8193',
            'testing-website.com'
        )
        RETURNING publisher_id INTO new_publisher_id;
    END IF;

    -- Rest of lookup tables
    UPDATE written_by
    SET author_id = new_author_id
    WHERE id = OLD.book_id;

    UPDATE written_by
    SET author_id = new_author_id
    WHERE id = OLD.book_id;

    UPDATE written_in
    SET language_id = new_language_id
    WHERE id = OLD.book_id;

    UPDATE type_of
    SET genre_id = new_genre_id
    WHERE id = OLD.book_id;

    UPDATE published_by
    SET publisher_id = new_publisher_id
    WHERE id = OLD.book_id;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;
