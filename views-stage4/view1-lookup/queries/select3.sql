-- Selects rare titles with more than 500 pages, and sorts by how many languages they are in

SELECT 
    lv.book_title,
    lv.page_count,
    lv.rarity,
    COUNT(DISTINCT wi.language_id) AS language_count
FROM 
    lookup_view lv
LEFT JOIN 
    written_in wi ON lv.book_id = wi.id
WHERE 
    lv.rarity = 'Rare'
    AND lv.page_count > 500
GROUP BY 
    lv.book_title, lv.page_count, lv.rarity
HAVING 
    COUNT(DISTINCT wi.language_id) > 1
ORDER BY 
    language_count DESC, lv.page_count DESC;
