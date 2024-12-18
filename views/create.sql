-- A view of all the books that start with the letter D
CREATE VIEW books_starting_with_D AS
SELECT book_id, title
FROM book
WHERE title LIKE 'D%'
WITH CHECK OPTION

-- Make a view of only archival employees
CREATE VIEW Archival_Employee AS
SELECT *
FROM employee
WHERE role = 'Archivist'

-- A list of all the employees by name who have burned 
-- more then 360 books for disposal
CREATE VIEW Pyromaniacs AS
SELECT e.name, COUNT(*) AS books_burned
FROM disposal d
JOIN employee e
ON d.employee_id = e.employee_id
WHERE d.method = 'Incineration'
GROUP BY e.name
HAVING COUNT(*) > 360;

-- Make a view of all authors who wrote a fantasy book with 
-- the columns author name, genre, and book id
CREATE VIEW fantasy_authors AS
SELECT author, genre, book_id
FROM book
WHERE genre = 'Fantasy'
WITH CHECK OPTION
