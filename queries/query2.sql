-- Hardest working day for each archive employee
WITH EmployeeBookCounts AS (
    SELECT 
        e.employee_id,
        e.name,
        aa.date AS assignment_date,
        COUNT(aa.book_id) AS books_assigned
    FROM 
        employee e
    JOIN 
        archival_assignment aa ON e.employee_id = aa.employee_id
    GROUP BY 
        e.employee_id, e.name, aa.date
),
MaxBookCounts AS (
    SELECT 
        employee_id,
        MAX(books_assigned) AS max_books_assigned
    FROM 
        EmployeeBookCounts
    GROUP BY 
        employee_id
)
SELECT 
    ebc.employee_id,
    ebc.name,
    ebc.assignment_date AS hardest_working_day,
    ebc.books_assigned AS books_assigned
FROM 
    EmployeeBookCounts ebc
JOIN 
    MaxBookCounts mbc ON ebc.employee_id = mbc.employee_id 
                      AND ebc.books_assigned = mbc.max_books_assigned
ORDER BY 
    ebc.employee_id;
