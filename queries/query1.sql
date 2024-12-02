-- Get the shelves with the highest number of books in all archives
SELECT 
    s.archive_number,
    s.shelf_number,
    COUNT(b.book_id) AS total_books
FROM 
    shelf s
LEFT JOIN 
    archival_assignment aa ON s.archive_number = aa.new_archive_room AND s.shelf_number = aa.new_shelf
LEFT JOIN 
    book b ON aa.book_id = b.book_id
GROUP BY 
    s.archive_number, s.shelf_number
ORDER BY 
    total_books DESC;
