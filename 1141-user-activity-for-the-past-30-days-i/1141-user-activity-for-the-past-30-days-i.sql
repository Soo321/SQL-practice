# Write your MySQL query statement below
SELECT
activity_date AS day,
COUNT(user_id) AS active_users
FROM ( SELECT DISTINCT user_id, activity_date
    From Activity
    WHERE activity_date BETWEEN "2019-06-28" AND "2019-07-27" ) AS new
group by activity_date ;