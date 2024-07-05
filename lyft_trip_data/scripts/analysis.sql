-- Query to select all rows from the trips table
SELECT * FROM trips;

-- Query to select all rows from the riders table
SELECT * FROM riders;

-- Query to select all rows from the cars table
SELECT * FROM cars;

-- Query to perform a cross join between riders and cars tables
SELECT *
FROM riders
CROSS JOIN cars;

-- Query to join trips with riders table using LEFT JOIN to include all trips even if rider_id has no match in riders table
SELECT 
    trips.id AS trip_id,
    trips.date,
    trips.pickup,
    trips.dropoff,
    trips.rider_id,
    riders.first AS rider_first_name,
    riders.last AS rider_last_name,
    riders.username AS rider_username,
    riders.rating AS rider_rating,
    riders.total_trips AS rider_total_trips,
    riders.referred AS rider_referred
FROM 
    trips
LEFT JOIN 
    riders ON trips.rider_id = riders.id;

-- Query to join trips with cars table using INNER JOIN to include only trips with a matching car_id in cars table
SELECT 
    trips.id AS trip_id,
    trips.date,
    trips.pickup,
    trips.dropoff,
    trips.rider_id,
    cars.id AS car_id,
    cars.model AS car_model,
    cars.OS AS car_OS,
    cars.status AS car_status,
    cars.trips_completed AS car_trips_completed
FROM 
    trips
INNER JOIN 
    cars ON trips.car_id = cars.id;

-- Query to stack rows from riders and riders2 tables on top of each other
-- Assuming both tables have the same structure
SELECT * FROM riders
UNION ALL
SELECT * FROM riders2;

-- Query to calculate the average cost of trips
SELECT AVG(cost) AS average_cost
FROM trips;

-- Query to select riders who have used Lyft less than 500 times
SELECT *
FROM riders
WHERE total_trips < 500;

-- Query to count the number of cars that are active
SELECT COUNT(*) AS active_cars
FROM cars
WHERE status = 'active';

-- Query to find the two cars with the highest trips_completed
SELECT *
FROM cars
ORDER BY trips_completed DESC
LIMIT 2;

