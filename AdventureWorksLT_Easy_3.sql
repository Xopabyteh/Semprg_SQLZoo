SELECT SUM(OrderQty)
FROM SalesOrderDetail
INNER JOIN Product ON SalesOrderDetail.ProductID = Product.ProductID
WHERE Product.ListPrice > 1000
