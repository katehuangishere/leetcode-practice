WITH CumulativeWeight AS (
  SELECT 
    person_name,
    turn,
    weight,
    SUM(weight) OVER (ORDER BY turn) as total_weight  -- 計算累計重量
  FROM Queue
)
SELECT 
  person_name
FROM CumulativeWeight
WHERE total_weight <= 1000
ORDER BY turn DESC
LIMIT 1;
