-- For each order show the SalesOrderID and SubTotal calculated three ways:
-- A) From the SalesOrderHeader
-- B) Sum of OrderQty*UnitPrice
-- C) Sum of OrderQty*ListPrice

-- SELECT SalesOrderHeader.SalesOrderID, SalesOrderHeader.SubTotal, SalesOrderDetail.UnitPrice, SalesOrderDetail.OrderQty, Product.ListPrice
SELECT 
    SalesOrderHeader.SalesOrderID,
    SalesOrderHeader.SubTotal AS A,
    SUM(SalesOrderDetail.UnitPrice * SalesOrderDetail.OrderQty) AS B,
    SUM(SalesOrderDetail.OrderQty * Product.ListPrice) AS C
FROM SalesOrderHeader
JOIN SalesOrderDetail ON SalesOrderHeader.SalesOrderID = SalesOrderDetail.SalesOrderID
JOIN Product ON SalesOrderDetail.ProductID = Product.ProductID
GROUP BY SalesOrderHeader.SalesOrderID, SalesOrderHeader.SubTotal