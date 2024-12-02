-- Updated biography books to common rarity
UPDATE book

SET rarity = 'Common'

WHERE genre = 'Biography';
