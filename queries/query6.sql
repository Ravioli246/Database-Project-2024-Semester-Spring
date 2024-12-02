-- Descending most common reasons for upkeep need
SELECT 
    u.reason_for_upkeep AS upkeep_reason,
    COUNT(*) AS frequency
FROM 
    upkeep u
GROUP BY 
    u.reason_for_upkeep
ORDER BY 
    frequency DESC;
