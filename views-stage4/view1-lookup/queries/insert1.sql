-- Sample easy insert statement that easily inserts a book into the database with the given info

INSERT INTO lookup_view (
    book_id,
    book_title,
    release_date,
    page_count,
    book_format,
    description,
    isbn,
    language,
    rarity,
    author_name,
    genre,
    publisher_name
)
VALUES (
    7381927364,
    'The Heart of Databases',
    '2025-01-01',
    400,
    'Hardcover',
    'A comprehensive guide to databases.',
    43210123,
    'English',
    'Rare',
    'Zachary Albacrosster',
    'Technology',
    'Tech Publishers'
);
