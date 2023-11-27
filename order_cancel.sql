use littlelemondb;
Drop Procedure If Exists CancelOrder;
DELIMITER $$
Create Procedure CancelOrder(OrderID int)
Begin
Delete From orders Where OrderID = OrderID;
Select concat("Order ", OrderID, " has been cancelled.") as CONFIRMED; 
End$$
DELIMITER ;

Call CancelOrder(4);