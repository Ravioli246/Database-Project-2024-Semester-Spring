-- SQL join that reassigns all of Michaela's August 2024 upkeep
-- assignments to Traci Smith
UPDATE public.upkeep u
SET employee_id = e2. employee_id
FROM public. employee el
JOIN public. employee e2 ON e2. name = 'Traci Smith'
WHERE u. employee_id = el. employee_id
  AND el. name = 'Michaela Moore'
  AND u.date BETWEEN '2024-08-01' AND '2024-08-31';
