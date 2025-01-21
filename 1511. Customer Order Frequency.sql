```
Write an SQL query to report the customer_id and customer_name of customers who have spent at least $100 in each month of June and July 2020.

Return the result table in any order.

The query result format is in the following example.

Customers
+--------------+-----------+-------------+
| customer_id  | name      | country     |
+--------------+-----------+-------------+
| 1            | Winston   | USA         |
| 2            | Jonathan  | Peru        |
| 3            | Moustafa  | Egypt       |
+--------------+-----------+-------------+
Product
+--------------+-------------+-------------+
| product_id   | description | price       |
+--------------+-------------+-------------+
| 10           | LC Phone    | 300         |
| 20           | LC T-Shirt  | 10          |
| 30           | LC Book     | 45          |
| 40           | LC Keychain | 2           |
+--------------+-------------+-------------+
Orders
+--------------+-------------+-------------+-------------+-----------+
| order_id     | customer_id | product_id  | order_date  | quantity  |
+--------------+-------------+-------------+-------------+-----------+
| 1            | 1           | 10          | 2020-06-10  | 1         |
| 2            | 1           | 20          | 2020-07-01  | 1         |
| 3            | 1           | 30          | 2020-07-08  | 2         |
| 4            | 2           | 10          | 2020-06-15  | 2         |
| 5            | 2           | 40          | 2020-07-01  | 10        |
| 6            | 3           | 20          | 2020-06-24  | 2         |
| 7            | 3           | 30          | 2020-06-25  | 2         |
| 9            | 3           | 30          | 2020-05-08  | 3         |
+--------------+-------------+-------------+-------------+-----------+
Result table:
+--------------+------------+
| customer_id  | name       |  
+--------------+------------+
| 1            | Winston    |
+--------------+------------+ 
Winston spent $300 (300 * 1) in June and $100 ( 10 * 1 + 45 * 2) in July 2020.
Jonathan spent $600 (300 * 2) in June and $20 ( 2 * 10) in July 2020.
Moustafa spent $110 (10 * 2 + 45 * 2) in June and $0 in July 2020.
```

-- <method 1>
SELECT customer_id, name
FROM Customers
WHERE customer_id IN(
  SELECT c.customer_id
  FROM Product p 
  JOIN Orders o ON p.product_id = o.product_id
  JOIN Customers c ON o.customer_id = c.customer_id
  WHERE MONTH(o.order_date) = 6
  GROUP BY c.customer_id
  HAVING SUM(p.price * o.quantity) >= 100
)
AND customer_id IN(
  SELECT c.customer_id
  FROM Product p 
  JOIN Orders o ON p.product_id = o.product_id
  JOIN Customers c ON o.customer_id = c.customer_id
  WHERE MONTH(o.order_date) = 7
  GROUP BY c.customer_id
  HAVING SUM(p.price * o.quantity) >= 100
);

-- <method 2>
WITH MonthlySpending AS (
    SELECT 
        c.customer_id,
        c.name,
        MONTH(o.order_date) as month,
        SUM(p.price * o.quantity) as total_spending
    FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN Product p ON o.product_id = p.product_id
    WHERE MONTH(o.order_date) IN (6, 7)
    GROUP BY c.customer_id, c.name, MONTH(o.order_date)
)
SELECT DISTINCT m1.customer_id, m1.name
FROM MonthlySpending m1
JOIN MonthlySpending m2 ON m1.customer_id = m2.customer_id
WHERE 
  m1.month = 6 
  AND m2.month = 7 
  AND m1.total_spending >= 100 
  AND m2.total_spending >= 100;
