-- Deletes upkeep books for employee 1020 for a two year period
DELETE FROM upkeep

WHERE employee_id = 1020

AND date BETWEEN '2022-11-11' AND '2024-11-11';
