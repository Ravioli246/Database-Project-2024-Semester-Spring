-- Updated the books starting with D view to include all columns. Now attempting to insert a book starting with F
-- even though we used a check condition, so it shouldnt work
INSERT INTO books_starting_with_D (book_id, title, author,rarity,genre)
VALUES (1029463947, 'Fantasy Adventure', 'John Doe', 'Rare', 'Fantasy');

-- Inserting a Disposal worker into the Archivist view. It doesnt work because it goes against the check, but it 
-- did put it into the table that this view is based off of
INSERT INTO archival_employees (employee_id, age, salary, role, name)
VALUES (2020, 30, 40000, 'Disposal Worker', 'John Doe');

-- Trying to insert a new book into the book table. It will reflect in the fantasy authors view
INSERT INTO book (book_id, title, author, rarity, genre)
VALUES (67893, 'The book of things 2', 'Some dude again', 'Common', 'Fantasy');

-- Making a new disposal entry where on of our pyromaniacs burns another book.
-- We shall see if it updates the view
-- After this ran we see that it added another tally to employee number 1024 for number of books burned
INSERT INTO disposal
VALUES (17, 67890, 1024, 'Incineration', 'Paper', '2024-02-02')
