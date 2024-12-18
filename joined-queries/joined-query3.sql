-- SQL join that reassigns all of Michaela's August 2024 upkeep
-- assignments to Traci Smith
SELECT u.upkeep_id, 
       u.book_id, 
       b.title AS book_title, 
       u.employee_id, 
       e.name AS employee_name, 
       u.reason_for_upkeep, 
       u.date
FROM public.upkeep u
JOIN public.employee e ON u.employee_id = e.employee_id
JOIN public.book b ON u.book_id = b.book_id
WHERE e.name = 'Michaela Moore'
  AND u.date BETWEEN '2024-08-01' AND '2024-08-31';
