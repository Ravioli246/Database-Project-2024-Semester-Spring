-- Create a view of all the upkeep employees and the countries from which the books they fix come from. The view uses published by and located
-- in to find which country produces which book that has had problems, thus giving us an idea of the quality of books from certain countries.
CREATE VIEW restorationist_upkeep_summary AS
SELECT 
    e.employee_id,
    c.name AS country_name,
    COUNT(u.id) AS upkept_books_count
FROM 
employee e
JOIN 
upkeep u ON e.employee_id = u.employee_id
JOIN 
    published_by pb ON u.id = pb.id
JOIN 
    public.is_in ii ON pb.publisher_id = ii.publisher_id
JOIN 
    public.country c ON ii.country_id = c.country_id
WHERE 
    e.role = 'Restorationist'
GROUP BY 
    e.employee_id, c.name
ORDER BY 
    e.employee_id, upkept_books_count DESC;
