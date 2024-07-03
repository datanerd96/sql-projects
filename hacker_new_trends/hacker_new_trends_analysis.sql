-- Query 1: Retrieve the top 5 stories with the highest scores
SELECT title, score
FROM hacker_news
ORDER BY score DESC
LIMIT 5;

-- Query 2: Calculate the total score of all stories
SELECT SUM(score) AS total_score
FROM hacker_news;

-- Query 3: Find users with a combined score of more than 200
SELECT user, SUM(score) AS total_score
FROM hacker_news
GROUP BY user
HAVING SUM(score) > 200;

-- Step 1: Calculate the total score of all stories
SELECT SUM(score) AS total_score
FROM hacker_news;

-- Step 2: Calculate the sum of scores for users with more than 200 points
SELECT SUM(sub.total_score) AS sum_high_scorers
FROM (
    SELECT user, SUM(score) AS total_score
    FROM hacker_news
    GROUP BY user
    HAVING SUM(score) > 200
) AS sub;

-- Step 3: Calculate the percentage of total score attributed to high scorers
SELECT (SUM(sub.total_score) * 100.0) / main.total_score AS percentage
FROM (
    SELECT SUM(score) AS total_score
    FROM hacker_news
) AS main,
(
    SELECT SUM(score) AS total_score
    FROM (
        SELECT user, SUM(score) AS total_score
        FROM hacker_news
        GROUP BY user
        HAVING SUM(score) > 200
    ) AS sub
) AS sub_sum;

-- Query 4: Count occurrences of the rickroll link per offending user
SELECT user, COUNT(*) AS num_times_posted
FROM hacker_news
WHERE url = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'
GROUP BY user;

-- Query 5: Categorize stories based on their source (GitHub, Medium, New York Times, Other)
SELECT
    CASE
        WHEN url LIKE '%github.com%' THEN 'GitHub'
        WHEN url LIKE '%medium.com%' THEN 'Medium'
        WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
        ELSE 'Other'
    END AS 'Source'
FROM hacker_news;

-- Query 6: Count stories from each source and group by source category
SELECT
    CASE
        WHEN url LIKE '%github.com%' THEN 'GitHub'
        WHEN url LIKE '%medium.com%' THEN 'Medium'
        WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
        ELSE 'Other'
    END AS 'Source',
    COUNT(*) AS num_stories
FROM hacker_news
GROUP BY
    CASE
        WHEN url LIKE '%github.com%' THEN 'GitHub'
        WHEN url LIKE '%medium.com%' THEN 'Medium'
        WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
        ELSE 'Other'
    END;

-- Query 7: Explore the timestamps and format of the first 10 entries
SELECT timestamp
FROM hacker_news
LIMIT 10;

-- Query 8: Extract the hour of the day from timestamps and calculate average score and number of stories per hour
SELECT
    timestamp,
    strftime('%H', timestamp) AS hour_of_day
FROM hacker_news
GROUP BY 1
LIMIT 20;

-- Query 9: Calculate average score and number of stories per hour, rounded and filtered for NULL timestamps
SELECT
    strftime('%H', timestamp) AS hour_of_day,
    ROUND(AVG(score), 2) AS average_score,
    COUNT(*) AS num_stories
FROM hacker_news
WHERE timestamp IS NOT NULL  -- Filter out NULL timestamps
GROUP BY hour_of_day
ORDER BY hour_of_day;

-- Query 10: Refine previous query to round average scores and filter NULL timestamps for clearer analysis
SELECT
    strftime('%H', timestamp) AS hour_of_day,
    ROUND(AVG(score), 2) AS average_score,
    COUNT(*) AS num_stories
FROM hacker_news
WHERE timestamp IS NOT NULL  -- Filter out NULL timestamps
GROUP BY hour_of_day
ORDER BY average_score DESC;

