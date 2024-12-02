-- Shelves with the most books on them in a given archive room ("26")
DEALLOCATE find_shelves;

PREPARE find_shelves(int) AS
SELECT 
    s.shelf_number,
    COUNT(aa.book_id) AS book_count
FROM 
    shelf s
LEFT JOIN 
    archival_assignment aa ON s.archive_number = aa.new_archive_room AND s.shelf_number = aa.new_shelf
WHERE 
    s.archive_number = $1
GROUP BY 
    s.shelf_number
ORDER BY 
    book_count DESC;

EXECUTE find_shelves(26);
