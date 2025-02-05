SELECT SUM(sod.OrderQty) AS TotalCranksetsSoldInLondon
FROM SalesOrderHeader soh
JOIN SalesOrderDetail sod 
  ON soh.SalesOrderID = sod.SalesOrderID
JOIN Product p 
  ON sod.ProductID = p.ProductID
JOIN ProductCategory pc 
  ON p.ProductCategoryID = pc.ProductCategoryID
JOIN Address a 
  ON soh.ShipToAddressID = a.AddressID
WHERE pc.Name = 'Cranksets'
  AND a.City = 'London';
