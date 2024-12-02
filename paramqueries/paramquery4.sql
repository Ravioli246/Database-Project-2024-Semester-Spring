-- Employees who make more than a given amount ("50000") and are older than a given age ("45")
DEALLOCATE find_employees;

PREPARE find_employees(int, int) AS
SELECT 
    employee_id,
    name,
    age,
    salary,
    role
FROM 
    employee
WHERE 
    salary > $1 AND age > $2
ORDER BY 
    salary DESC;

EXECUTE find_employees(50000, 45);
