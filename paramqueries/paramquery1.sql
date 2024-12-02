-- Search for book assignments by title ("Optional Analyzing Challenge")
DEALLOCATE find_reassignments;

PREPARE find_reassignments(text) AS
SELECT 
    aa.book_id,
    b.title,
    aa.employee_id,
    aa.date AS assignment_date,
    aa.new_archive_room,
    aa.new_shelf
FROM 
    archival_assignment aa
JOIN 
    book b ON aa.book_id = b.book_id
WHERE 
    b.title = $1
ORDER BY 
    aa.date DESC;

EXECUTE find_reassignments('Optional Analyzing Challenge');
