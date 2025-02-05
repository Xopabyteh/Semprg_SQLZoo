SELECT 
    c.CompanyName,
    soh.SubTotal,
    SUM(sod.OrderQty * p.Weight) AS TotalWeight
FROM SalesOrderHeader soh
JOIN Customer c 
    ON soh.CustomerID = c.CustomerID
JOIN SalesOrderDetail sod 
    ON soh.SalesOrderID = sod.SalesOrderID
JOIN Product p 
    ON sod.ProductID = p.ProductID
GROUP BY soh.SalesOrderID, c.CompanyName, soh.SubTotal
ORDER BY soh.SubTotal DESC;
