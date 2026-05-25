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