-- Archive employees with the most handled books
SELECT 
    e.employee_id,
    e.name,
    COUNT(DISTINCT aa.book_id) AS books_handled
FROM 
    employee e
JOIN 
    archival_assignment aa ON e.employee_id = aa.employee_id
GROUP BY 
    e.employee_id, e.name
ORDER BY 
    books_handled DESC
LIMIT 10;
