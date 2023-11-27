use littlelemondb;
Drop Procedure If Exists AddBooking;
Delimiter $$
Create Procedure AddBooking(In BookingID Int, In BookingDate Date, In TableNumber Int, In CustomerID Int)
Begin
Insert Into bookings (BookingID, Date, TableNumber, CustomerID)
Values(BookingID, BookingDate, TableNumber, CustomerID);
Select Concat("New Booking Added") as CONFIRMATION;
End $$ 
Delimiter ;

Call AddBooking(14, '2023-01-01', 17, 5);