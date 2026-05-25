
--- Data Queries - Basic Level-
-- List all flights and their current status ordered by departure datetime
SELECT Flight_Number,
       Status, Departure_Datetime
FROM Flight
ORDER BY Departure_Datetime ASC;
--Show all passengers ordered alphabetically
SELECT *FROM Passenger
ORDER BY Full_Name ASC;
--List all aircraft and capacity from largest to smallest
SELECT Registration_Number,  Model,Capacity
FROM Aircraft
ORDER BY Capacity DESC;
--Show only distinct booking classes
SELECT DISTINCT Class
FROM Booking;
-- Flights with Delayed or Cancelled status
SELECT *FROM Flight
WHERE Status IN ('Delayed','Cancelled');
--Omani passengers
SELECT *FROM Passenger
WHERE Nationality = 'Omani';
--Airports ordered by country
SELECT *FROM Airport
ORDER BY Country ASC;

