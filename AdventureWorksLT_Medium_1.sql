SELECT sod.SalesOrderID,
       sod.UnitPrice
FROM SalesOrderDetail sod
WHERE sod.SalesOrderID IN (
    SELECT SalesOrderID
    FROM SalesOrderDetail
    GROUP BY SalesOrderID -- Am of orders
    HAVING COUNT(*) = 1 -- Count
);