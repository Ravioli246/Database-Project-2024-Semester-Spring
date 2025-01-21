-- Fun little efficient query that labels all books from the 20th century as 'Legendary'
-- and also adds a ' - Special Anniversary Edition' suffix to the title

UPDATE lookup_view
SET 
    book_title = book_title || ' - Special Anniversary Edition',
    book_format = 'Collector Edition',
    rarity = COALESCE(rarity, 'Legendary')
WHERE 
    release_date < '2000-01-01'
RETURNING 
    book_id, book_title, book_format, rarity;
