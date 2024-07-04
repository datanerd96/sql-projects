-- Query 1: Retrieve all columns from the nomnom table
SELECT *
FROM nomnom;

-- Query 2: Retrieve distinct neighborhoods from the nomnom table
SELECT DISTINCT neighborhood
FROM nomnom;

-- Query 3: Retrieve distinct cuisine types from the nomnom table
SELECT DISTINCT cuisine
FROM nomnom;

-- Query 4: Retrieve restaurants offering Chinese cuisine
SELECT *
FROM nomnom
WHERE cuisine = 'Chinese';

-- Query 5: Retrieve restaurants with reviews of 4 and above, renaming 'name' column to 'Restaurant'
SELECT name AS 'Restaurant'
FROM nomnom
WHERE review >= 4;

-- Query 6: Retrieve Italian restaurants with price rating $$$, showing all columns
SELECT *
FROM nomnom
WHERE cuisine = 'Italian' AND price LIKE '%$$$%';

-- Query 7: Search for restaurants with 'meatball' in their name
SELECT *
FROM nomnom
WHERE name LIKE '%meatball%';

-- Query 8: Retrieve restaurant names and neighborhoods in Midtown, Downtown, or Chinatown
SELECT name AS 'Restaurant', neighborhood
FROM nomnom
WHERE neighborhood IN ('Midtown', 'Downtown', 'Chinatown');

-- Query 9: Retrieve restaurant names and health grades that are pending (NULL values)
SELECT name AS 'Restaurant', health
FROM nomnom
WHERE health IS NULL;

-- Query 10: Retrieve top 10 restaurants based on reviews, showing restaurant name and review score
SELECT name AS 'Restaurant', review
FROM nomnom
ORDER BY review DESC
LIMIT 10;

-- Query 11: Transform review ratings into descriptive categories using CASE statement
SELECT name,
    CASE
        WHEN review > 4.5 THEN 'Extraordinary'
        WHEN review > 4 THEN 'Excellent'
        WHEN review > 3 THEN 'Good'
        WHEN review > 2 THEN 'Fair'
        ELSE 'Poor'
    END AS 'Rating'
FROM nomnom;

