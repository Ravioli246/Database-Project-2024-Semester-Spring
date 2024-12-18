-- Show disposed books but also additional information like
-- employee_name, for example to create an extended chart
SELECT b.title AS book_title, 
       d.disposal_method, 
       d.material_of_book, 
       d.date AS disposal_date, 
       e.name AS employee_name
FROM public.disposal d
JOIN public.book b ON d.book_id = b.book_id
JOIN public.employee e ON d.employee_id = e.employee_id
ORDER BY d.date DESC;
