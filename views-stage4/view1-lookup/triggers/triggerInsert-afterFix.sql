CREATE OR REPLACE FUNCTION lookup_view_insert_trigger()
RETURNS TRIGGER AS $$
DECLARE
-- Declares new id's for handling duplicates
    new_author_id INT;
    new_publisher_id INT;
    new_genre_id INT;
    new_language_id INT;
BEGIN
    -- First update the book entry itself
    INSERT INTO book (id, title, release_date, page_count, format, description, isbn)
    VALUES (NEW.book_id, NEW.book_title, NEW.release_date, NEW.page_count, NEW.book_format, NEW.description, NEW.isbn);

        -- PROBLEMATIC MISSING CASES/DUPLICATES: author, publisher:

    -- Handles missing author
    SELECT author_id INTO new_author_id
    FROM author
    WHERE first_name || ' ' || last_name = NEW.author_name;
    IF new_author_id IS NULL THEN
        INSERT INTO author (author_id, first_name, last_name, date_of_birth, biography)
        VALUES (
            -- Generates new author_id, names, DOB, bio
            author_id,
            split_part(NEW.author_name, ' ', 1),
            split_part(NEW.author_name, ' ', 2),
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
    INSERT INTO genre (genre_id, name, description)
    VALUES (
        new_genre_id,
        NEW.genre,
        NEW.description
    )
    INSERT INTO written_by (language_id, name)
    VALUES (
        new_language_id,
        NEW.language
    );
    INSERT INTO written_by (id, author_id)
    VALUES (
        NEW.book_id,
        new_author_id
    );
    INSERT INTO written_in (id, language_id)
    VALUES (
        NEW.book_id,
        new_language_id
    );
    INSERT INTO type_of (id, genre_id)
    VALUES (
        NEW.book_id,
        new_genre_id
    );
    INSERT INTO published_by (id, publisher_id)
    VALUES (
        NEW.book_id,
        new_publisher_id
    );

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;
