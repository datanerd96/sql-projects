-- Retrieve all columns from the startups table
SELECT *
FROM startups;

-- Find the highest amount of funding raised by any startup
SELECT MAX(raised) AS highest_amount_raised
FROM startups;

-- Find the highest amount of funding raised by a startup in the 'Seed' stage
SELECT MAX(raised) AS max_amount_raised_in_seed_stage
FROM startups
WHERE stage = 'Seed';

-- Find the oldest founding year among the startups
SELECT MIN(founded) AS oldest_founded_year
FROM startups;

-- Calculate the average valuation across all startups
SELECT AVG(valuation) AS average_valuation
FROM startups;

-- Calculate the average valuation by category
SELECT category, AVG(valuation) AS average_valuation
FROM startups
GROUP BY category;

-- Calculate the average valuation by category, rounded to two decimal places
SELECT category, ROUND(AVG(valuation), 2) AS average_valuation
FROM startups
GROUP BY category;

-- Calculate the average valuation by category, rounded and ordered from highest to lowest
SELECT category, ROUND(AVG(valuation), 2) AS average_valuation
FROM startups
GROUP BY category
ORDER BY average_valuation DESC;

-- Count the number of companies in each category
SELECT category, COUNT(*) AS total_companies
FROM startups
GROUP BY category;

-- Count the number of companies in each category, only including categories with more than 3 companies
SELECT category, COUNT(*) AS total_companies
FROM startups
GROUP BY category
HAVING COUNT(*) > 3
ORDER BY total_companies DESC;

-- Calculate the average number of employees by location
SELECT location, ROUND(AVG(employees), 2) AS average_employees
FROM startups
GROUP BY location;

-- Calculate the average number of employees by location, only including locations with an average above 500 employees
SELECT location, ROUND(AVG(employees), 2) AS average_employees
FROM startups
GROUP BY location
HAVING AVG(employees) > 500;

