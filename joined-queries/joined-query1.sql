-- List all the upkeeps including employee_name and the book_title,
-- to give an extended look at the information of the upkeeps
-- in an extended table through two joins
SELECT DISTINCT e.name AS employee_name, 
       b.book_id, 
       b.title AS book_title, 
       u.reason_for_upkeep, 
       u.tools_used, 
       u.date
FROM public.employee e
JOIN public.upkeep u ON e.employee_id = u.employee_id
JOIN public.book b ON u.book_id = b.book_id
ORDER BY b.book_id ASC, e.name, u.date DESC;
