-- Selects from lookup_view all the Authors who start with A,
-- counts their number of books, and returns theur average page count

SELECT 
    publisher_name,
    COUNT(book_id) AS total_books,
    AVG(page_count) AS avg_page_count
FROM lookup_view
WHERE author_name LIKE 'A%'
GROUP BY publisher_name
ORDER BY avg_page_count DESC;
