use littlelemondb;
DROP PROCEDURE IF EXISTS AddValidBooking;
DROP FUNCTION IF EXISTS Validate;

DELIMITER \\

CREATE FUNCTION Validate(RecordsFound INTEGER, message VARCHAR(255)) RETURNS INTEGER DETERMINISTIC
BEGIN
    IF RecordsFound IS NOT NULL OR RecordsFound > 0 THEN
        SIGNAL SQLSTATE 'ERR0R' SET MESSAGE_TEXT = message;
    END IF;
    RETURN RecordsFound;
END \\

CREATE PROCEDURE AddValidBooking(IN BookingID INT,IN Tablenumber INT, IN CustomerID INT,IN BookingSlot varchar(50), IN BookingDate Date)
	BEGIN
		DECLARE `_rollback` BOOL DEFAULT 0;
		DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
		START TRANSACTION;
        
        SELECT Validate(COUNT(*), CONCAT("Table ", TableNumber, " is already booked"))
        FROM bookings
        WHERE BookingDate = BookingDate AND TableNo = TableNumber;
        
		INSERT INTO bookings
		VALUES (BookingID,TableNumber,CustomerID,BookingSlot,BookingDate);
		
		IF `_rollback` THEN
			SELECT CONCAT("Table ", TableNumber, " is already booked.") As BOOKING_STATUS;
			ROLLBACK;
		ELSE
			COMMIT;
		END IF;
    END \\
    
DELIMITER ;

CALL AddValidBooking(9,9,5,"5:00 PM","2023-12-01");