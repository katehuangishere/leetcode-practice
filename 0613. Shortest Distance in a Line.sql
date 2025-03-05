```
Write a query to find the shortest distance between two points in these points.

Input: 
Point table:
+----+
| x  |
+----+
| -1 |
| 0  |
| 2  |
+----+

The shortest distance is '1' obviously, which is from point '-1' to '0'. So the output is as below:
Output: 
+----------+
| shortest |
+----------+
| 1        |
+----------+

```
-- 笛卡爾積 + 過濾條件 + 絕對值計算 + 取最小值
-- ABS() : 取絕對值
SELECT MIN(ABS(p1.x - p2.x)) AS shortest
FROM Point p1, Point p2
WHERE p1.x > p2.x;
