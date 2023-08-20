SELECT stu.student_id, stu.student_name, sub.subject_name, COUNT(exam.subject_name) AS attended_exams
FROM Students AS stu
CROSS JOIN Subjects AS sub
LEFT JOIN Examinations AS exam ON sub.subject_name = exam.subject_name AND stu.student_id = exam.student_id
GROUP BY stu.student_id, sub.subject_name
ORDER BY stu.student_id, sub.subject_name;
