SELECT 
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    GROUP_CONCAT(DISTINCT product ORDER BY product SEPARATOR ',') AS products  -- GROUP_CONCAT() 專門用於在 GROUP BY 子句中合併多個行的值
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;
