-- method 1
WITH RankedDepartments AS (
    SELECT 
        employee_id,
        department_id,
        ROW_NUMBER() OVER (
            PARTITION BY employee_id
            ORDER BY CASE 
                        WHEN primary_flag = 'Y' THEN 1
                        ELSE 2
                     END
        ) AS rank
    FROM 
        Employee
)
SELECT 
    employee_id,
    department_id
FROM 
    RankedDepartments
WHERE 
    rank = 1;

-- method 2
SELECT 
    e.employee_id,
    e.department_id
FROM 
    Employee e
LEFT JOIN Employee p
ON 
    e.employee_id = p.employee_id AND p.primary_flag = 'Y'
WHERE 
    e.primary_flag = 'Y' OR p.primary_flag IS NULL;
