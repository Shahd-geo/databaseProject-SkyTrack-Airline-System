# SkyTrack Airline System

## Project Description

SkyTrack Airline System is a database management project developed using SQL Server.

The system is designed to manage airline operations including:

* Airports
* Aircraft
* Flights
* Passengers
* Bookings
* Crew Members

The project demonstrates important database concepts such as:

* ERD design
* Mapping relationships
* SQL table creation
* Constraints
* Data insertion
* UPDATE and DELETE operations
* Basic, Medium, and Advanced SQL queries

---

# ERD Diagram

![ERD](01-ERD)

---

# Mapping Diagram

![Mapping](02-Mapping)
---

# Main Entities

The database contains the following entities:

* Airport
* Aircraft
* Flight
* Passenger
* Passenger_Phone
* Booking
* CrewMember
* FlightCrew

---

# Main Relationships

* One airport can be related to many flights.
* One aircraft can be assigned to many flights.
* One passenger can make many bookings.
* One flight can contain many bookings.
* Many crew members can work on many flights through the FlightCrew table.
* Passenger phone numbers were separated into a separate table because phone numbers are multi-valued attributes.

---

# Mapping Decisions

## Flight Table

Foreign keys were added in the Flight table:

* Origin_Airport → references Airport(IATA_Code)
* Destination_Airport → references Airport(IATA_Code)
* Registration_Number → references Aircraft(Registration_Number)

## Booking Table

Foreign keys added:

* National_ID → references Passenger(National_ID)
* Flight_Number → references Flight(Flight_Number)

## FlightCrew Table

The FlightCrew table was created to solve the many-to-many relationship between Flight and CrewMember.

## Passenger_Phone Table

Passenger phone numbers were separated because one passenger can have multiple phone numbers.

---

# Problems Faced and Solutions

During DELETE operations, some rows could not be deleted because they were referenced by foreign key constraints in related tables.

For example:

* Flights were referenced in Booking and FlightCrew tables.

## Solution

The related child records were deleted first before deleting the parent row.

This helped maintain referential integrity in the database.

---

# Difference Between WHERE and HAVING

## WHERE

WHERE filters rows before grouping.

Example:

```sql
SELECT *
FROM Flight
WHERE Status = 'Completed';
```

## HAVING

HAVING filters grouped data after using GROUP BY.

Example:

```sql
SELECT Flight_Number,
COUNT(*) AS Total_Bookings
FROM Booking
GROUP BY Flight_Number
HAVING COUNT(*) > 1;
```

---

# Most Useful Query

The most useful query was the FINAL CHALLENGE query because it combines multiple tables and provides a complete flight summary including:

* Flight information
* Airports
* Aircraft details
* Total passengers
* Total crew members
* Total revenue

This query demonstrates advanced SQL concepts such as:

* Multiple JOINs
* Aggregate Functions
* GROUP BY
* LEFT JOIN

---

# SQL Query Example

Example of aggregate functions and query execution in SQL Server:

![SQL Query](Screenshot%202026-05-24%20165709.png)

---

# Additional File

* Full-Project-Work.sql contains the complete SQL development process step-by-step with comments.

---

# Project Files Structure

database-project/

├── 01-ERD/

├── 02-Mapping/

├── 03-Create-Tables.sql

├── 04-Insert-Data.sql

├── 05-Update-Delete.sql

├── 06-Queries-Basic.sql

├── 07-Queries-Medium.sql

├── 08-Queries-Advanced.sql

├── Full-Project-Work.sql

└── README.md

---

# Technologies Used

* SQL Server
* GitHub
* ERD Design
* Relational Database Modeling

