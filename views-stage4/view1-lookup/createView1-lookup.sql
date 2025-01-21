CREATE OR REPLACE VIEW lookup_view AS
SELECT 
    b.id AS book_id,
    b.title AS book_title,
    b.release_date AS release_date,
    b.page_count AS page_count,
    b.format AS book_format,
    b.description AS description,
    b.isbn AS isbn,
    l.name AS language,
    r.rarity_level AS rarity,
    a.first_name || ' ' || a.last_name AS author_name,
    g.name AS genre,
    p.name AS publisher_name,
    p.phone_number AS publisher_contact,
    p.website AS publisher_website
FROM 
    book b
LEFT JOIN written_in wi ON b.id = wi.id
LEFT JOIN language l ON wi.language_id = l.language_id
LEFT JOIN rarity r ON b.id = r.id
LEFT JOIN written_by wb ON b.id = wb.id
LEFT JOIN author a ON wb.author_id = a.author_id
LEFT JOIN type_of to_genre ON b.id = to_genre.id
LEFT JOIN genre g ON to_genre.genre_id = g.genre_id
LEFT JOIN published_by pb ON b.id = pb.id
LEFT JOIN publisher p ON pb.publisher_id = p.publisher_id;
