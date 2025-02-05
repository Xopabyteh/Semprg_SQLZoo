SELECT DISTINCT p.Name AS ProductName,
                c.CompanyName
FROM SalesOrderHeader soh
INNER JOIN SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Product p ON sod.ProductID = p.ProductID
INNER JOIN ProductModel pm ON p.ProductModelID = pm.ProductModelID
INNER JOIN Customer c ON soh.CustomerID = c.CustomerID
WHERE pm.Name = 'Racing Socks';