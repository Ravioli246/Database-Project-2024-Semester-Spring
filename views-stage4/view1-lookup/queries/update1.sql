-- Selects rare titles with more than 500 pages, and sorts by how many languages they are in

UPDATE lookup_view
SET 
    book_title = 'The Updated Title of Databases',
    release_date = '2024-01-01',
    page_count = 450,
    book_format = 'Paperback',
    description = 'An updated guide to databases.',
    isbn = 98765432,
    language = 'Spanish',
    rarity = 'Common',
    author_name = 'Frederick Gonepigs',
    genre = 'Science',
    publisher_name = 'Newly Refreshed Tech Publishers'
WHERE book_id = 7381927364;
