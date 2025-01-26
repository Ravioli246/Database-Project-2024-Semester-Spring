-- We delete the country north korea and that causes all entries in upkeep to dissappear (thanks to delete cascade) and thus removes all 
-- north korea entries from our view.
DELETE FROM country
WHERE name = 'North Korea';
