use littlelemondb;
Prepare GetOrderDetail 
From 'Select * From Orders where OrderID=?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;