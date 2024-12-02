-- Number of shredded or burned books in 2023
SELECT 
    COUNT(*) AS books_disposed_count
FROM (
    SELECT 
        book_id
    FROM 
        disposal
    WHERE 
        disposal_method = 'Shredding' 
        AND EXTRACT(YEAR FROM date) = 2023

    UNION ALL

    SELECT 
        book_id
    FROM 
        disposal
    WHERE 
        disposal_method = 'Burning' 
        AND EXTRACT(YEAR FROM date) = 2023
) disposed_books;
