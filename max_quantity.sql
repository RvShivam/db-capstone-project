use littlelemondb;
Drop Procedure If Exists GetMaxQuantity;
CREATE Procedure GetMaxQuantity()  
SELECT 
MAX(Quantity) as MAX_QUANTITY_IN_ORDER
From orders;

Call GetMaxQuantity()