-- Selecting all the pyromaniacs to make a bar chart showing who burned how many books
SELECT * FROM public.pyromaniacs

-- Getting all the archival employees who make more then 60,000 dollars and making a pie chart for thos employees
-- to visualize what precentage each person makes in comparison to everyone else
SELECT name, salary
FROM archival_employees
WHERE salary > 60000
