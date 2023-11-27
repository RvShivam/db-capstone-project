use littlelemondb;
DROP PROCEDURE IF EXISTS UpdateBooking;
DELIMITER $$ 
CREATE PROCEDURE UpdateBooking(IN BookingID INT, IN BookDate DATE) 
BEGIN
UPDATE bookings SET BookingDate = BookDate WHERE BookingID = BookingID; 
SELECT CONCAT("Booking ", BookingID, " updated") AS "Confirmation"; 
END$$ 
DELIMITER ; 
CALL UpdateBooking(3, "2023-10-25");