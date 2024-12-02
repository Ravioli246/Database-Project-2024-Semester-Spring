-- Sets method of disposal to donation for (employee 101 and paper) books
UPDATE disposal

SET method = ‘Donation'

WHERE employee_id = 1011 AND material_of_book = 'Paper';
