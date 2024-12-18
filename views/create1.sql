-- A view of all the books that start with the letter D
CREATE VIEW books_starting_with_D AS
SELECT book_id, title
FROM book
WHERE title LIKE 'D%'
WITH CHECK OPTION
