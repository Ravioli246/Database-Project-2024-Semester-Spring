-- All books disposed by a given employee ("Zachary Frost") in disposal in a given year ("2023")
DEALLOCATE find_disposals;

PREPARE find_disposals(text, int) AS
SELECT 
    d.book_id,
    b.title,
    d.disposal_method,
    d.material_of_book,
    d.date AS disposal_date
FROM 
    disposal d
JOIN 
    book b ON d.book_id = b.book_id
JOIN 
    employee e ON d.employee_id = e.employee_id
WHERE 
    e.name = $1
    AND EXTRACT(YEAR FROM d.date) = $2
ORDER BY 
    d.date DESC;

EXECUTE find_disposals('Zachary Frost', 2023);
