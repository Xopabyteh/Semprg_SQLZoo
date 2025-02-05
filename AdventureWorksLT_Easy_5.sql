SELECT SUM(sod.OrderQty) AS TotalLeftRacingSocks
FROM SalesOrderHeader soh
INNER JOIN SalesOrderDetail sod 
  ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Customer c 
  ON soh.CustomerID = c.CustomerID
INNER JOIN Product p 
  ON sod.ProductID = p.ProductID
WHERE c.CompanyName = 'Riding Cycles'
  AND p.Name = 'Racing Socks, L';
