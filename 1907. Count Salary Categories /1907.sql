SELECT 
    'Low Salary' as category,
    SUM(CASE WHEN income < 20000 THEN 1 ELSE 0 END) as accounts_count
FROM Accounts
UNION
SELECT 
    'Average Salary',
    SUM(CASE WHEN income BETWEEN 20000 AND 50000 THEN 1 ELSE 0 END)
FROM Accounts
UNION
SELECT 
    'High Salary',
    SUM(CASE WHEN income > 50000 THEN 1 ELSE 0 END)
FROM Accounts;
