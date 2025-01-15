WITH RankedSalaries AS (
    SELECT 
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        DENSE_RANK() OVER (  -- 用於處理相同薪資的情況，不會跳過排名號碼
            PARTITION BY e.departmentId   -- 按部門分組進行排名
            ORDER BY e.salary DESC  -- 在每個部門內按薪資降序排序
        ) AS salary_rank
    FROM Employee e
    JOIN Department d ON e.departmentId = d.id
)
SELECT 
    Department,
    Employee,
    Salary
FROM RankedSalaries
WHERE salary_rank <= 3
ORDER BY Department, Salary DESC;
