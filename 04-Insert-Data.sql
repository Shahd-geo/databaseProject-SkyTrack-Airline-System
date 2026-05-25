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