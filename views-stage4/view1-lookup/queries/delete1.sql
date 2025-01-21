-- Deletes from look_up view the previously inserted book, to showcase efficiency of the lookup view

DELETE FROM lookup_view
WHERE book_id = 7381927364;
