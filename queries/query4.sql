-- Average number of books in each archive type
SELECT 
    a.book_type,
    AVG(book_count.total_books) AS average_books
FROM 
    archive a
JOIN 
    shelf s ON a.archive_number = s.archive_number
LEFT JOIN (
    SELECT 
        aa.new_archive_room AS archive_number,
        COUNT(aa.book_id) AS total_books
    FROM 
        archival_assignment aa
    GROUP BY 
        aa.new_archive_room
) book_count ON a.archive_number = book_count.archive_number
GROUP BY 
    a.book_type
ORDER BY 
    average_books DESC;
