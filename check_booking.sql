use littlelemondb;
Drop Procedure If Exists CheckBooking;
Create Procedure CheckBooking(BookDate Date, TableNumber Int)
Select Concat("Table ", TableNo, " is already booked for", BookingDate, ".") as BOOKING_STATUS
Where Exists (Select * From bookings 
			  Where BookingDate = BookDate 
				and TableNo = TableNumber );
                
Call CheckBooking('2022-11-12', 3)