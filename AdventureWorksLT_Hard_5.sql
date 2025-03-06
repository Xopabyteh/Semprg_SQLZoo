WITH TopCities AS (
    -- Top city := city with the highest total sales
    SELECT a.City, a.StateProvince, SUM(soh.SubTotal) AS TotalSales
    FROM SalesOrderHeader soh
    JOIN Customer c ON soh.CustomerID = c.CustomerID
    JOIN Address a ON c.CustomerID = a.AddressID
    GROUP BY a.City, a.StateProvince
    ORDER BY TotalSales DESC
    LIMIT 3
)
SELECT 
    tc.City,
    pc.Name AS ProductCategory,
    SUM(sod.OrderQty * sod.UnitPrice) AS TotalSalesValue
FROM SalesOrderDetail sod
-- Joins hell
JOIN SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
JOIN Customer c ON soh.CustomerID = c.CustomerID
JOIN Address a ON c.CustomerID = a.AddressID
JOIN Product p ON sod.ProductID = p.ProductID
JOIN ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
JOIN TopCities tc ON a.City = tc.City
GROUP BY tc.City, pc.Name
ORDER BY tc.City, TotalSalesValue DESC;
