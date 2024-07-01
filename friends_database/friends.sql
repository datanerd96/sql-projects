-- Create a table named 'friends' with columns 'id', 'name', and 'birthday'
CREATE TABLE friends (id INTEGER, name TEXT, birthday DATE);

-- Insert a row into the 'friends' table
INSERT INTO friends (id, name, birthday)
VALUES (1, 'Ororo Munroe', '1940-05-30');

-- Select all columns and rows from the 'friends' table
SELECT *
FROM friends;

-- Insert another row into the 'friends' table
INSERT INTO friends (id, name, birthday)
VALUES (2, 'Aubrey Graham', '1999-11-8');

-- Insert a third row into the 'friends' table
INSERT INTO friends (id,name, birthday)
VALUES (3, 'Gunna Smith', '1999-12-6');

-- Select all columns and rows from the 'friends' table
SELECT *
FROM friends;

-- Update the name of the friend with id 1 to 'Storm'
UPDATE friends
SET name = 'Storm'
WHERE id = 1;

-- Select all columns and rows from the 'friends' table
SELECT *
FROM friends;

-- Add a new column 'email' to the 'friends' table
ALTER TABLE friends
ADD COLUMN email TEXT;

-- Update the email of the friend with name 'Storm'
UPDATE friends 
SET email = 'storm@codecademy.com';

-- Delete the row where the name is 'Storm'
DELETE FROM friends
WHERE name = 'Storm';

-- Select all columns and rows from the 'friends' table
SELECT * 
FROM friends;

-- Set the email to NULL for the friends with id 2 and 3
UPDATE friends
SET email = NULL
WHERE id IN (2, 3);

-- Select all columns and rows from the 'friends' table
SELECT * 
FROM friends;

