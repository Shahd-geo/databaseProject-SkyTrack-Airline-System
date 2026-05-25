--- Data Queries - Medium Level -

-- For each flight, show the flight number, the name of the origin airport, and the name of the destinati
-- use A1 , A2 AS WE HAVE Origin ,Destination AIRPORT
SELECT F.Flight_Number,
       A1.Name AS Origin_Airport,
       A2.Name AS Destination_Airport
FROM Flight F
JOIN Airport A1
ON F.Origin_Airport = A1.IATA_Code
JOIN Airport A2
ON F.Destination_Airport = A2.IATA_Code;

--Show each booking with passenger name and flight number
SELECT B.Booking_ID,
       P.Full_Name,
       B.Flight_Number,
       B.Class,
      B.Price
FROM Booking B
JOIN Passenger P
ON B.National_ID = P.National_ID;
--Crew members assigned to flight 1
SELECT C.Full_Name,
       C.Role
FROM CrewMember C
JOIN FlightCrew FC
ON C.License_Number = FC.License_Number
WHERE FC.Flight_Number = 1;
--Completed flights with aircraft model
SELECT F.Flight_Number,
       F.Status,
       A.Model
FROM Flight F
JOIN Aircraft A
ON F.Registration_Number = A.Registration_Number
WHERE F.Status = 'Completed';
-- Passenger name with total booking(USE GROUP BY )
SELECT P.Full_Name, COUNT(B.Booking_ID) AS Total_Bookings
FROM Passenger P
JOIN Booking B
ON P.National_ID = B.National_ID
GROUP BY P.Full_Name
ORDER BY Total_Bookings DESC;
--Total revenue for each booking class
SELECT Class,
SUM(Price) AS Total_Revenue
FROM Booking
GROUP BY Class;
-- Count flights assigned to each aircraft
SELECT A.Model,
COUNT(F.Flight_Number) AS Total_Flights
FROM Aircraft A
JOIN Flight F
ON A.Registration_Number = F.Registration_Number
GROUP BY A.Model;
-- Flights with more than one booking (USE HAVING)
SELECT Flight_Number,
COUNT(Booking_ID) AS Total_Bookings
FROM Booking
GROUP BY Flight_Number
HAVING COUNT(Booking_ID) > 1;
-- Full booking details (USE JOIN)
SELECT P.Full_Name,B.Flight_Number,
       A1.Name AS Origin_Airport,
       A2.Name AS Destination_Airport,
       B.Class,
       B.Price
FROM Booking B
JOIN Passenger P
ON B.National_ID = P.National_ID
JOIN Flight F
ON B.Flight_Number = F.Flight_Number
JOIN Airport A1
ON F.Origin_Airport = A1.IATA_Code
JOIN Airport A2
ON F.Destination_Airport = A2.IATA_Code;
