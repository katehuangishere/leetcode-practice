-- Write an SQL query to report the customer_id and customer_name of customers who bought products "A", "B" but did not buy the product "C" since we want to recommend them buy this product.
-- Return the result table ordered by customer_id.
-- The query result format is in the following example.

```
Customers table:
+-------------+---------------+
| customer_id | customer_name |
+-------------+---------------+
| 1           | Daniel        |
| 2           | Diana         |
| 3           | Elizabeth     |
| 4           | Jhon          |
+-------------+---------------+

Orders table:
+------------+--------------+---------------+
| order_id   | customer_id  | product_name  |
+------------+--------------+---------------+
| 10         |     1        |     A         |
| 20         |     1        |     B         |
| 30         |     1        |     D         |
| 40         |     1        |     C         |
| 50         |     2        |     A         |
| 60         |     3        |     A         |
| 70         |     3        |     B         |
| 80         |     3        |     D         |
| 90         |     4        |     C         |
+------------+--------------+---------------+

Result table:
+-------------+---------------+
| customer_id | customer_name |
+-------------+---------------+
| 3           | Elizabeth     |
+-------------+---------------+
```

SELECT c.customer_id, c.customer_name
FROM Customers c
JOIN Orders o1 ON c.customer_id = o1.customer_id AND o1.product_name = 'A'
JOIN Orders o2 ON c.customer_id = o2.customer_id AND o2.product_name = 'B'
WHERE NOT EXISTS(
  SELECT 1  -- 只檢查是否有這筆紀錄，不返回裡面的值
  FROM Orders o3
  WHERE o3.customer_id = c.customer_id AND o3.product_name = 'C'
)
ORDER BY c.customer_id;
