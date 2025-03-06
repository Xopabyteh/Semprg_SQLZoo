-- List the ProductName and the quantity of what was ordered by 'Futuristic Bikes'

SELECT Product.Name, SalesOrderDetail.OrderQty
FROM SalesOrderDetail
JOIN Product ON SalesOrderDetail.ProductID = Product.ProductID
JOIN SalesOrderHeader ON SalesOrderDetail.SalesOrderID = SalesOrderHeader.SalesOrderID
JOIN Customer ON SalesOrderHeader.CustomerID = Customer.CustomerID
WHERE Customer.CompanyName = 'Futuristic Bikes';
