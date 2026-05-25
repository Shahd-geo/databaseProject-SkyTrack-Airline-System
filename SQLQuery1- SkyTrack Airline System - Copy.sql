CREATE DATABASE SkyTrackAirlineSystemProject
USE SkyTrackAirlineSystemProject
CREATE TABLE Airport(
   Airport_ID INT IDENTITY(1,1) PRIMARY KEY,
    IATA_Code VARCHAR(10) UNIQUE NOT NULL,
    Name VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL,
    Country VARCHAR(100) NOT NULL
);
CREATE TABLE Aircraft(
    Registration_Number INT IDENTITY(1,1) PRIMARY KEY,
    Model VARCHAR(100) NOT NULL,
    Manufacturer VARCHAR(100) NOT NULL,
    Capacity INT NOT NULL
    CHECK (Capacity > 0),
    Manufacture_Year INT
);
CREATE TABLE Flight(

    Flight_Number INT IDENTITY(1,1) PRIMARY KEY,
    Departure_Datetime DATETIME NOT NULL,
    Arrival_Datetime DATETIME NOT NULL,
    Status VARCHAR(20) NOT NULL
    DEFAULT 'Scheduled',
    CHECK (Status IN
    ('Scheduled','Delayed','Cancelled','Completed')),
    Origin_Airport VARCHAR(10) NOT NULL ,
    Destination_Airport VARCHAR(10) NOT NULL,
    Registration_Number INT,
    FOREIGN KEY (Origin_Airport)
    REFERENCES Airport(IATA_Code),
    FOREIGN KEY (Destination_Airport)
    REFERENCES Airport(IATA_Code),
    FOREIGN KEY (Registration_Number)
    REFERENCES Aircraft(Registration_Number),
    CHECK (Arrival_Datetime > Departure_Datetime)
);
CREATE TABLE Passenger(
    National_ID INT IDENTITY(1,1) PRIMARY KEY,
    Full_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Nationality VARCHAR(50) NOT NULL,
    Date_Of_Birth DATE NOT NULL
);
CREATE TABLE Passenger_Phone(
    National_ID INT,
    Phone VARCHAR(20) Not NULL,
    PRIMARY KEY (National_ID, Phone),
    FOREIGN KEY (National_ID)
    REFERENCES Passenger(National_ID)
);
CREATE TABLE Booking(
    Booking_ID INT IDENTITY(1,1) PRIMARY KEY,
    Seat_Number VARCHAR(10) NOT NULL,
    Class VARCHAR(20) NOT NULL
    CHECK (Class IN
    ('Economy','Business','First')),
    Price DECIMAL(10,2) NOT NULL
    CHECK (Price > 0),
    Booking_Date  DATE NOT NULL DEFAULT GETDATE(),
    National_ID INT,
    Flight_Number INT,
    FOREIGN KEY (National_ID)
    REFERENCES Passenger(National_ID),
    FOREIGN KEY (Flight_Number)
    REFERENCES Flight(Flight_Number)
);
CREATE TABLE CrewMember(
    License_Number INT IDENTITY(1,1) PRIMARY KEY,
    Full_Name VARCHAR(100) NOT NULL,
    Role VARCHAR(30) NOT NULL
    CHECK (Role IN
    ('Pilot',
    'Co-Pilot',
    'Flight Attendant',
    'Engineer'))
);
CREATE TABLE FlightCrew(
    Flight_Number INT,
    License_Number INT,
    PRIMARY KEY
    (Flight_Number, License_Number),
    FOREIGN KEY (Flight_Number)
    REFERENCES Flight(Flight_Number),
    FOREIGN KEY (License_Number)
    REFERENCES CrewMember(License_Number)
);
-- Insert Sample Data
--INSERT INTO AIRPORT
INSERT INTO Airport
(IATA_Code, Name, City, Country)
VALUES
('MCT','Muscat International Airport','Muscat','Oman'),
('DXB','Dubai International Airport','Dubai','UAE'),
('LHR','Heathrow Airport','London','United Kingdom'),
('JFK','John F. Kennedy Airport','New York','USA'),
('DOH','Hamad International Airport','Doha','Qatar');
-- INSERT INTO AIRCRAFT
INSERT INTO Aircraft
(Model, Manufacturer, Capacity, Manufacture_Year)
VALUES
('Boeing 737','Boeing',180,2023),
('Airbus A320','Airbus',160,2025),
('Boeing 777','Boeing',350,2018),
('Airbus A380','Airbus',500,2019),
('Embraer E190','Embraer',100,2024);
-- ENSURE INSERT VALUE IN TABLES
SELECT * FROM Aircraft;
SELECT * FROM Airport;
--INSERT INTO PASSENGER
INSERT INTO Passenger
(Full_Name, Email, Nationality, Date_Of_Birth)

VALUES
('Ahmed Al-Harthi','ahmed@gmail.com','Omani','1999-05-10'),
('Sara Al-Balushi','sara@gmail.com','Omani','2002-03-15'),
('John Smith','john@gmail.com','British','1996-07-22'),
('Shahd Al-Abdali','shahd@gmail.com','Omani','2000-10-08'),
('Ali Hassan','ali@gmail.com','Qatari','1997-09-12'),
('Emily Brovn','emily@gmail.com','American','1996-02-20'),
('Mohammed Al-Lawati','mohammed@gmail.com','Omani','2001-01-17'),
('Noor Al-Shamsi','noor@gmail.com','Emirati','1998-06-30');
--INSERT INTO PASSENGER_PHONE
INSERT INTO Passenger_Phone
(National_ID, Phone)
VALUES
(1,'92345678'),
(2,'93456789'),
(3,'94567890'),
(4,'95678901'),
(5,'96789012'),
(6,'97890123'),
(7,'98901234'),
(8,'99012345');
--INSERT INTO FLIGHT
INSERT INTO Flight
(
Departure_Datetime,
Arrival_Datetime,
Status,
Origin_Airport,
Destination_Airport,
Registration_Number
)
VALUES
('2026-06-01 08:00:00',
 '2026-06-01 10:00:00',
 'Scheduled',
 'MCT',
 'DXB',
 1),
('2026-06-02 09:30:00',
 '2026-06-02 13:00:00',
 'Delayed',
 'DXB',
 'LHR',
 2),
('2026-06-03 14:00:00',
 '2026-06-03 18:00:00',
 'Cancelled',
 'DOH',
 'MCT',
 3),
('2026-06-04 06:00:00',
 '2026-06-04 09:30:00',
 'Completed',
 'LHR',
 'JFK',
 4),
('2026-06-05 11:00:00',
 '2026-06-05 13:00:00',
 'Scheduled',
 'MCT',
 'DOH',
 5),
('2026-06-06 07:00:00',
 '2026-06-06 09:00:00',
 'Completed',
 'DXB',
 'MCT',
 1),
('2026-06-07 15:00:00',
 '2026-06-07 19:00:00',
 'Delayed',
 'JFK',
 'LHR',
 2),

('2026-06-08 10:00:00',
 '2026-06-08 12:00:00',
 'Cancelled',
 'DOH',
 'DXB',
 3);
 -- INSERT INTO BOOKING

INSERT INTO Booking
(
Seat_Number,
Class,
Price,
National_ID,
Flight_Number
)
VALUES

('A1','Economy',120,1,1),
('B2','Business',350,2,2),
('C3','First',600,3,3),
('D4','Economy',150,4,4),
('E5','Business',400,5,5),
('F6','First',750,6,6),
('G7','Economy',180,7,7),
('H8','Business',500,8,8),
('I9','Economy',200,1,2),
('J10','First',900,2,4);

-- INSERT INTO CREWMEMBER

INSERT INTO CrewMember
(
Full_Name,
Role
)
VALUES
('Captain Ahmed','Pilot'),
('Salim Al-Harthi','Co-Pilot'),
('Mona Ali','Flight Attendant'),
('Shahd Al-Abdali','Engineer'),
('Fatma Said','Flight Attendant'),
('Khalid Ali','Pilot');
-- INSERT INTO FLIGHTCREW
INSERT INTO FlightCrew
(
Flight_Number,
License_Number
)

VALUES
(1,1),
(1,3),
(2,2),
(2,5),
(3,1),
(3,3),
(4,6),
(4,5),
(5,1),
(5,3),
(6,2),
(6,5),
(7,6),
(7,3),
(8,1),
(8,5);

--UPDATE and DELETE
-- Update flight status from Scheduled to Completed
UPDATE Flight
SET Status = 'Completed'
WHERE Flight_Number = 1;
SELECT * FROM Flight;
-- Change flight status from Delayed to Cancelled
UPDATE Flight
SET Status = 'Cancelled'
WHERE Flight_Number = 2;
SELECT * FROM Flight;
-- Increase Economy booking prices by 10%
UPDATE Booking
SET Price = Price * 1.10
WHERE Class = 'Economy';
SELECT * FROM Booking;
-- Update passenger phone number
UPDATE Passenger_Phone
SET Phone = '99998888'
WHERE National_ID = 1;
SELECT * FROM Passenger_Phone;
-- Change crew member role
UPDATE CrewMember
SET Role = 'Engineer'
WHERE License_Number = 2;
SELECT * FROM CrewMember;
-- Check cancelled flight before delete
SELECT *FROM Flight
WHERE Status = 'Cancelled';
-- Delete related bookings
DELETE FROM Booking
WHERE Flight_Number = 3;
-- Delete related crew assignments
DELETE FROM FlightCrew
WHERE Flight_Number = 3;
-- Delete the flight
DELETE FROM Flight
WHERE Flight_Number = 3;
-- Notes : First, the flight could not be deleted because :
-- it is referenced by Booking and FlightCrew tables..

-- Check booking before delete
SELECT *FROM Booking
WHERE Flight_Number = 8;
-- Delete booking
DELETE FROM Booking
WHERE Flight_Number = 8;
--Try deleting passenger with existing bookings
-- Check passenger before delete
SELECT *FROM Passenger
WHERE National_ID = 1;
-- Try deleting passenger
DELETE FROM Passenger
WHERE National_ID = 1;
-- The delete operation failed because the passenger
-- is referenced in the Booking table by a foreign key.
SELECT *FROM Passenger

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