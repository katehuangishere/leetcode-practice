```
A telecommunications company wants to invest in new countries. 
The country intends to invest in the countries where the average call duration of the calls in this country is strictly greater than the global average call duration.

Write an SQL query to find the countries where this company can invest.

Return the result table in any order.

The query result format is in the following example.

Person Table:
| id  | name     | phone_number  |
|---- |--------- |--------------|
| 3   | Jonathan | 051-1234567  |
| 12  | Elvis    | 051-7654321  |
| 1   | Moncef   | 212-1234567  |
| 2   | Maroua   | 212-6523651  |
| 7   | Meir     | 972-1234567  |
| 9   | Rachel   | 972-0011100  |

Country Table:
| name     | country_code |
|----------|--------------|
| Peru     | 051          |
| Israel   | 972          |
| Morocco  | 212          |
| Germany  | 049          |
| Ethiopia | 251          |

Calls Table:
| caller_id | callee_id | duration |
|-----------|----------|----------|
| 1         | 9        | 33       |
| 2         | 9        | 4        |
| 1         | 2        | 59       |
| 3         | 12       | 102      |
| 3         | 12       | 330      |
| 12        | 3        | 5        |
| 7         | 9        | 13       |
| 7         | 1        | 3        |
| 9         | 7        | 1        |
| 1         | 7        | 7        |

  
Result table:
+----------+
| country  |
+----------+
| Peru     |
+----------+
  
```
  
SELECT c.name AS country
FROM Country c
LEFT JOIN Person p ON c.country_code = LEFT(p.phone_number, 3)
LEFT JOIN Calls ca ON p.id = ca.caller_id OR p.id = ca.callee_id
GROUP BY c.name
HAVING avg(duration) > (SELECT AVG(duration) FROM Calls)
