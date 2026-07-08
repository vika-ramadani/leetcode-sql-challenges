(
  SELECT u.name AS results
  FROM users u 
  JOIN MovieRating mr ON u.user_id = mr.user_id 
  GROUP BY u.name 
  ORDER BY COUNT(*) DESC, u.name ASC 
  LIMIT 1
) 
UNION ALL
(
  SELECT m.title 
  FROM movies m 
  JOIN MovieRating mr ON m.movie_id = mr.movie_id 
  WHERE date_format(mr.created_at, '%Y-%m') = '2020-02' 
  GROUP BY m.title 
  ORDER BY avg(mr.rating) DESC, m.title ASC 
  LIMIT 1
) 
