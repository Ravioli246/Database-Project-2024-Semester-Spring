-- Efficient query that cleans up old, short, common title and removes them from the library

DELETE FROM lookup_view
WHERE 
    book_id IN (
        SELECT lv.book_id
        FROM lookup_view lv
        LEFT JOIN written_in wi ON lv.book_id = wi.id
        WHERE 
            lv.release_date < '1950-01-01'
            AND lv.rarity = 'Common'
            AND lv.page_count < 100
        GROUP BY lv.book_id, lv.book_title, lv.page_count, lv.rarity
        HAVING COUNT(DISTINCT wi.language_id) <= 1
    )
RETURNING 
    book_id, book_title, release_date, page_count, rarity;
