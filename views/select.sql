-- Select all the books that start with D and have the word engineered in them
SELECT *
FROM books_starting_with_d
WHERE title ILIKE '%engineered%';

-- Select all the archival employees who make at least 85,000 dollars
SELECT name, salary
FROM archival_employees
WHERE salary > 85000

-- Make a view of all authors who wrote a fantasy book with 
-- the columns author name, genre, and book id
CREATE VIEW fantasy_authors AS
SELECT author, genre, book_id
FROM book
WHERE genre = 'Fantasy'
WITH CHECK OPTION

-- Select from the pyromaniacs all those who burned less then 200 books
-- This will give an empty list because we only took those who burned at 
-- least 360 books to make our view
SELECT *
FROM pyromaniacs
WHERE books_burned < 200
