-- Updates donation method for a certain employee and material
UPDATE disposal

SET method = ‘Donation'

WHERE employee_id = 1011 AND material_of_book = 'Paper';
