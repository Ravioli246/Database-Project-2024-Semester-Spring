-- Updating the book from samoa to have a publisher from another country. The query ran but the table still had a samoa row because
-- we didnt chnage the actual underlying table to the view, only a different table.
UPDATE published_by
SET publisher_id = 22
WHERE id = (
    SELECT b.id
    FROM book b
    WHERE b.title = 'New Book from Samoa'
);
