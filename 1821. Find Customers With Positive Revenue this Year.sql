-- Write an SQL query to report the customers with postive revenue in the year 2021.
-- Return the result table in any order.
-- The query result format is in the following example:
```
Customers
+-------------+------+---------+
| customer_id | year | revenue |
+-------------+------+---------+
| 1           | 2018 | 50      |
| 1           | 2021 | 30      |
| 1           | 2020 | 70      |
| 2           | 2021 | -50     |
| 3           | 2018 | 10      |
| 3           | 2016 | 50      |
| 4           | 2021 | 20      |
+-------------+------+---------+

Result table:
+-------------+
| customer_id |
+-------------+
| 1           |
| 4           |
+-------------+
```

SELECT customer_id
FROM Customers
WHERE year = '2021' AND revenue > 0
ORDER BY customer_id;
