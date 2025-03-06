SELECT 
    CASE 
        WHEN soh.SubTotal BETWEEN 0 AND 99 THEN '0-99'
        WHEN soh.SubTotal BETWEEN 100 AND 999 THEN '100-999'
        WHEN soh.SubTotal BETWEEN 1000 AND 9999 THEN '1000-9999'
        ELSE '10000-' 
    END AS OrderRange,
    COUNT(soh.SalesOrderID) AS NumOrders,
    SUM(soh.SubTotal) AS TotalValue
FROM SalesOrderHeader soh
GROUP BY OrderRange
ORDER BY MIN(soh.SubTotal);
