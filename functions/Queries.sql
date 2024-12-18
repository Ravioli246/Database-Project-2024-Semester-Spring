-- Updated SQL query3 that reassigns different upkeep assignments within
-- a given timeframe from one employee to another
SELECT reassign_upkeep_to_employee('Stacey Mcconnell', 'Jerry Lyons', '2024-05-01', '2024-05-31');


-- Updated SQL query1 that returns extended upkeep details for specific emplyee in specific timeframe
SELECT * FROM get_upkeep_details_by_employee('Jerry Lyons', '2024-05-01', '2024-05-31');


-- Updated SQL query2 that can now get an employee_id from a name and search
-- through disposals of that employee_id, streamlining disposal employee search
SELECT b.title AS book_title, 
       d.disposal_method, 
       d.material_of_book, 
       d.date AS disposal_date, 
       e.name AS employee_name
FROM public.disposal d
JOIN public.book b ON d.book_id = b.book_id
JOIN public.employee e ON d.employee_id = e.employee_id
WHERE e.employee_id = get_employee_id_by_name('Zachary Frost')
ORDER BY d.date DESC;


-- Updated SQL query1 that now takes a book TITLE, not just id, and given dates,
-- and can return all the upkeeps from that book within a given timeframe.
SELECT u.upkeep_id,
       b.book_id,
       b.title AS book_title,
       e.name AS employee_name,
       u.reason_for_upkeep,
       u.tools_used,
       u.date AS upkeep_date
FROM public.upkeep u
JOIN public.book b ON u.book_id = b.book_id
JOIN public.employee e ON u.employee_id = e.employee_id
WHERE b.book_id IN (
    SELECT book_id 
    FROM get_books_by_title_and_date('Organic 3Rdgeneration Alliance', '2024-07-01', '2024-10-31')
)
ORDER BY u.date DESC, e.name;
