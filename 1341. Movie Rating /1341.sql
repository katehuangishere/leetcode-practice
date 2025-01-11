(
SELECT u.name AS results
FROM Users u
LEFT JOIN MovieRating m ON u.user_id = m.user_id
GROUP BY u.user_id, u.name
ORDER BY COUNT(DISTINCT m.movie_id) DESC, u.name
LIMIT 1
)
UNION ALL -- 保留所有列(包括重複的)
(
SELECT m.title AS results
FROM Movies m
LEFT JOIN MovieRating mr ON m.movie_id = mr.movie_id
WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY m.movie_id, m.title
ORDER BY AVG(mr.rating) DESC, m.title
LIMIT 1
);
