use littlelemondb;
Select 
mu.ItemName as MENU_NAME
From menu as mu
Where (Select Count(*)
       From orders as od
       Where od.MenuID = mu.MenuID
       Group By od.CustomerID
       Having Count(*) > 2)