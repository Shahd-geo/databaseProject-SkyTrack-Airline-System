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