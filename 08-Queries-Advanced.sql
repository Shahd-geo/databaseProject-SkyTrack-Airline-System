-- Data Queries - Advanced Level  -

-- Flight + airports + aircraft + total passengers( Include flights that have no bookings - LEFT JOIN )
SELECT F.Flight_Number,
       A1.Name AS Origin_Airport,
       A2.Name AS Destination_Airport,
       AC.Model,
       COUNT(B.Booking_ID) AS Total_Passengers
FROM Flight F
LEFT JOIN Airport A1
ON F.Origin_Airport = A1.IATA_Code
LEFT JOIN Airport A2
ON F.Destination_Airport = A2.IATA_Code
LEFT JOIN Aircraft AC
ON F.Registration_Number = AC.Registration_Number
LEFT JOIN Booking B
ON F.Flight_Number = B.Flight_Number
GROUP BY
F.Flight_Number,
A1.Name,
A2.Name,
AC.Model;

--Passengers who never made booking
SELECT Full_Name FROM Passenger
WHERE National_ID NOT IN
(
SELECT National_ID
FROM Booking
);

-- Flight revenue > 500
SELECT Flight_Number,

       SUM(Price) AS Total_Revenue
FROM Booking
GROUP BY Flight_Number
HAVING SUM(Price) > 500
ORDER BY Total_Revenue DESC;

-- Crew members assigned to more than one flight
SELECT C.Full_Name,
   COUNT(FC.Flight_Number) AS Total_Flights
FROM CrewMember C
JOIN FlightCrew FC
ON C.License_Number = FC.License_Number
GROUP BY C.Full_Name
HAVING COUNT(FC.Flight_Number) > 1;

--Average booking price above overall average
SELECT Flight_Number,AVG(Price) AS Average_Price
FROM Booking
GROUP BY Flight_Number
HAVING AVG(Price) >
(
SELECT AVG(Price)
FROM Booking
);
-- Flight with highest bookings
SELECT TOP 1

       F.Flight_Number,

       A1.Name AS Origin,

       A2.Name AS Destination,

       COUNT(B.Booking_ID) AS Total_Bookings

FROM Flight F
JOIN Booking B
ON F.Flight_Number = B.Flight_Number
JOIN Airport A1
ON F.Origin_Airport = A1.IATA_Code
JOIN Airport A2
ON F.Destination_Airport = A2.IATA_Code
GROUP BY
F.Flight_Number,
A1.Name,
A2.Name
ORDER BY Total_Bookings DESC;

-- Statistics for each booking class (Aggregate Functions)
SELECT Class,
       SUM(Price) AS Total_Revenue,
       COUNT(*) AS Number_Of_Bookings,
       AVG(Price) AS Average_Price,
       MAX(Price) AS Highest_Price,
       MIN(Price) AS Lowest_Price
FROM Booking
GROUP BY Class;
-- Passengers booked cancelled flights
SELECT P.Full_Name,
       B.Flight_Number,
       B.Booking_Date
FROM Passenger P
JOIN Booking B
ON P.National_ID = B.National_ID
JOIN Flight F
ON B.Flight_Number = F.Flight_Number
WHERE F.Status = 'Cancelled';

--Flights with pilot and flight attendant
SELECT F.Flight_Number,
       COUNT(FC.License_Number) AS Total_Crew,
       F.Departure_Datetime
FROM Flight F
JOIN FlightCrew FC
ON F.Flight_Number = FC.Flight_Number
JOIN CrewMember C
ON FC.License_Number = C.License_Number
WHERE C.Role IN ('Pilot','Flight Attendant')
GROUP BY
F.Flight_Number,
F.Departure_Datetime
HAVING COUNT(DISTINCT C.Role) = 2;

--FINAL CHALLENGE--
SELECT F.Flight_Number,

       A1.City AS Origin_City,

       A2.City AS Destination_City,

       AC.Model,

       AC.Manufacturer,

       COUNT(DISTINCT B.Booking_ID)
       AS Total_Passengers,

       COUNT(DISTINCT FC.License_Number)
       AS Total_Crew,

       SUM(B.Price) AS Total_Revenue

FROM Flight F

LEFT JOIN Airport A1
ON F.Origin_Airport = A1.IATA_Code

LEFT JOIN Airport A2
ON F.Destination_Airport = A2.IATA_Code

LEFT JOIN Aircraft AC
ON F.Registration_Number = AC.Registration_Number

LEFT JOIN Booking B
ON F.Flight_Number = B.Flight_Number

LEFT JOIN FlightCrew FC
ON F.Flight_Number = FC.Flight_Number
GROUP BY
F.Flight_Number,
A1.City,
A2.City,
AC.Model,
AC.Manufacturer
ORDER BY Total_Revenue DESC;