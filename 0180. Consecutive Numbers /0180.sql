-- solution 1
WITH ConsecutiveNums AS (
    SELECT 
        num,
        LAG(num) OVER (ORDER BY id) AS prev_num1,  -- LAG(num) OVER (ORDER BY id) 獲取當前行的前一行數值
        LAG(num, 2) OVER (ORDER BY id) AS prev_num2  -- LAG(num, 2) OVER (ORDER BY id) 獲取當前行的前兩行數值
    FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums
FROM 
  ConsecutiveNums
WHERE 
  num = prev_num1 AND num = prev_num2;

-- solution 2
SELECT 
    DISTINCT l1.num AS ConsecutiveNums
FROM 
    Logs l1
JOIN 
    Logs l2 ON l1.id = l2.id - 1
JOIN 
    Logs l3 ON l1.id = l3.id - 2
WHERE 
    l1.num = l2.num AND l2.num = l3.num;
