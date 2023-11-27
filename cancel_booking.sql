use littlelemondb;
DROP PROCEDURE IF EXISTS CancelBooking;
DELIMITER $$ 
CREATE PROCEDURE CancelBooking(IN booking_ID INT) 
BEGIN
Delete From bookings WHERE BookingID = booking_ID; 
SELECT CONCAT("Booking ", booking_ID, " cancelled") AS "Confirmation"; 
END$$ 
DELIMITER ; 
CALL CancelBooking(5);