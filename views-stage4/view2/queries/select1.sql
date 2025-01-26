-- Select all the countries that published at least 2600 books that then need some restoration.
SELECT 
    country_name, 
    SUM(upkept_books_count) AS total_upkept_books
FROM 
    restorationist_upkeep_summary
GROUP BY 
    country_name
HAVING 
    SUM(upkept_books_count) > 2600;
