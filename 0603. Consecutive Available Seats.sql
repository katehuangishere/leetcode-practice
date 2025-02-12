```
Find all the consecutive available seats in the cinema.

Return the result table ordered by seat_id in ascending order.

The test cases are generated so that more than two seats are consecutively available.

The result format is in the following example.

Input: 
Cinema table:
+---------+------+
| seat_id | free |
+---------+------+
| 1       | 1    |
| 2       | 0    |
| 3       | 1    |
| 4       | 1    |
| 5       | 1    |
+---------+------+
Output: 
+---------+
| seat_id |
+---------+
| 3       |
| 4       |
| 5       |
+---------+
```
-- Method 1
SELECT DISTINCT c1.seat_id
FROM Cinema c1
JOIN Cinema c2
ON ABS(c1.seat_id - c2.seat_id) = 1 -- 確保 座位 c1 和 c2 是相鄰的
WHERE c1.free = 1 AND c2.free = 1 -- 確保 這兩個座位都是可用的
ORDER BY c1.seat_id;

-- Method 2
SELECT seat_id
FROM (
    SELECT seat_id,
           LAG(free) OVER (ORDER BY seat_id) AS prev_free,
           LEAD(free) OVER (ORDER BY seat_id) AS next_free
    FROM Cinema
) t
WHERE t.prev_free = 1 OR t.next_free = 1
ORDER BY seat_id;
