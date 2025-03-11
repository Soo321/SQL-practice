# Write your MySQL query statement below

WITH ValidTrips AS (
    -- Step 1: Filter only trips where both client and driver are not banned
    SELECT 
    t.request_at, 
    t.status,
    IF(status="completed","No","Yes") as cancellation
    FROM Trips t
    JOIN Users c ON t.client_id = c.users_id
    JOIN Users d ON t.driver_id = d.users_id
    WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
        AND c.banned = 'No' 
        AND d.banned = 'No'
)

-- Step 2: Calculate Cancellation Rate
SELECT 
    request_at as Day,
    ROUND(
        SUM(CASE WHEN cancellation = 'Yes' THEN 1 ELSE 0 END) 
        / COUNT(*) , 2) AS "Cancellation Rate"
FROM ValidTrips
GROUP BY request_at;