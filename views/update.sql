-- Update all the books by people with intials M and J to rarity of super rare
UPDATE books_starting_with_d
SET rarity = 'Rare'
WHERE author ILIKE 'M% J%';

-- Updating one of the archival employees in the view to a different job. This will update the view and then
-- because of the check condition will remove them from the view and update the underlying table
UPDATE archival_employees
SET role = 'Restorationist'
WHERE employee_id = 1001;

-- Updating the book we just put in to another genre to see what happens. The check option should prevent the
-- update
UPDATE fantasy_authors
SET genre = 'Science'
WHERE book_id = 67893

-- Updating our entry of the insert to a different method where it will remove the tally from the employee
-- After running the code we see it removed a tally from the employee who did this disposal in pyromaniac
UPDATE disposal
SET method = 'Donation'
WHERE disposal_id = 17
