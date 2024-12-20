SELECT s.machine_id, round(avg(e.timestamp - s.timestamp), 3) AS processing_time
FROM Activity s
INNER JOIN Activity e ON s.machine_id = e.machine_id
WHERE s.activity_type = "start" AND e.activity_type = "end"
GROUP BY s.machine_id;
