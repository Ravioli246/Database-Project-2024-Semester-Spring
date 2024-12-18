-- Delete from all the books starting with D those who's genre is biography which will give a foreign key 
-- constraint error
DELETE FROM books_starting_with_d
WHERE genre = 'Biography';

-- Now deleting from book all books with the name of the fantasy book we just inserted into the view. It
-- doesnt have any dependencies so it will leave the table and also the view
DELETE FROM book
WHERE author = 'Some dude again'


-- Deleting all archivists who make more then 85,000 dollars. We will run into a foreign key constraint
DELETE FROM archival_employees
WHERE salary > 85000;

-- We have employee 'Zachary Frost' with 368 burnings. We will delete 20 of them and that should remove him 
-- from the pyromaniacs view. 
-- After running the code we see he was removed form the view because he didnt meet the criteria of deleting 
-- at least 360 books
WITH rows_to_delete AS (
    SELECT ctid
    FROM disposal
    WHERE employee_id = (
        SELECT employee_id
        FROM employee
        WHERE name = 'Zachary Frost'
    )
    AND method = 'Incineration'
    ORDER BY ctid
    LIMIT 20
)
DELETE FROM disposal
WHERE ctid IN (SELECT ctid FROM rows_to_delete);
