-- Deletes (employee 1019, and type donation, and material paper) books
DELETE FROM disposal

WHERE employee_id = 1019 AND method = 'Donation’

AND material_of_book = 'Paper';
