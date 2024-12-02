-- Each employees most commonly disposed material and its count
WITH DisposalOnlyEmployees AS (
    SELECT 
        e.employee_id,
        e.name
    FROM 
        employee e
    WHERE 
        e.employee_id IN (SELECT DISTINCT employee_id FROM disposal)
          AND e.employee_id NOT IN (SELECT DISTINCT employee_id FROM archival_assignment)
),
MostCommonMaterial AS (
    SELECT 
        d.employee_id,
        d.material_of_book,
        COUNT(*) AS material_count,
        RANK() OVER (PARTITION BY d.employee_id ORDER BY COUNT(*) DESC) AS rank
    FROM 
        disposal d
    GROUP BY 
        d.employee_id, d.material_of_book
)
SELECT 
    doe.employee_id,
    doe.name,
    mcm.material_of_book AS most_common_material,
    mcm.material_count
FROM 
    DisposalOnlyEmployees doe
JOIN 
    MostCommonMaterial mcm ON doe.employee_id = mcm.employee_id
WHERE 
    mcm.rank = 1
ORDER BY 
    mcm.material_count DESC;
