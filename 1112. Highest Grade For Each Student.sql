-- Write a SQL query to find the highest grade with its corresponding course for each student. 
-- In case of a tie, you should find the course with the smallest course_id. 
-- The output must be sorted by increasing student_id.
-- The query result format is in the following example:

```
Enrollments table:
+------------+-------------------+
| student_id | course_id | grade |
+------------+-----------+-------+
| 2          | 2         | 95    |
| 2          | 3         | 95    |
| 1          | 1         | 90    |
| 1          | 2         | 99    |
| 3          | 1         | 80    |
| 3          | 2         | 75    |
| 3          | 3         | 82    |
+------------+-----------+-------+

Result table:
+------------+-------------------+
| student_id | course_id | grade |
+------------+-----------+-------+
| 1          | 2         | 99    |
| 2          | 2         | 95    |
| 3          | 3         | 82    |
+------------+-----------+-------+
```

SELECT student_id, MIN(course_id) AS course_id, grade
FROM Enrollments
WHERE (student_id, grade) IN(
  SELECT student_id, MAX(grade)
  FROM Enrollments
  GROUP BY student_id
)
GROUP BY student_id, grade
ORDER BY student_id;
