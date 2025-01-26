-- Attempt to update the view directly. However views are virtual tables and you cant do that with them so it will fail.
UPDATE restorationist_upkeep_summary
SET upkept_books_count = 1
