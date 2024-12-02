-- Most reassigned books
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
    aa.book_id = (
        SELECT 
            book_id
        FROM 
            archival_assignment
        GROUP BY 
            book_id
        ORDER BY 
            COUNT(*) DESC
        LIMIT 1
    )
ORDER BY 
    aa.date DESC
LIMIT 10;
