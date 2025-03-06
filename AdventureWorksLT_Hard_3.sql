SELECT
    sod.ProductID,
    p.Name AS ProductName,
    SUM(sod.OrderQty * sod.UnitPrice) AS TotalSalesValue
FROM SalesOrderDetail sod
JOIN Product p ON sod.ProductID = p.ProductID
GROUP BY sod.ProductID, p.Name
ORDER BY TotalSalesValue DESC
LIMIT 1;