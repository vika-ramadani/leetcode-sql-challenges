SELECT s.user_id, 
  ROUND(IFNULL(SUM(case when c.action='confirmed' then 1 else 0 end) / count(c.action),0), 2) AS confirmation_rate 
FROM signups s 
LEFT JOIN confirmations c 
ON s.user_id = c.user_id 
GROUP BY s.user_id 
