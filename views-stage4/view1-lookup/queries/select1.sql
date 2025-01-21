-- Easily and efficiently selects all the lookup tables for 'Romance' books released from 2026 and on

SELECT DISTINCT
    author_name,
    book_title,
    release_date,
    genre,
    language,
    publisher_name
FROM 
    lookup_view
WHERE 
    release_date > '2016-01-01'
    AND genre = 'Romance'
ORDER BY 
    release_date ASC;
