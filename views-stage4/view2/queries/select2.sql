-- I want a list of the employee who resotred the most books for a country, for each country
SELECT 
    employee_id,
    country_name,
    upkept_books_count AS maxamountfromcountry
FROM restorationist_upkeep_summary
WHERE (country_name, upkept_books_count) IN (
    SELECT 
        country_name, 
        MAX(upkept_books_count) 
    FROM restorationist_upkeep_summary
    GROUP BY country_name
);
