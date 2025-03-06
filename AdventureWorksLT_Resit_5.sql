-- Find the best customer in each region.
-- Query too hard for me for now, this is chatGPTiberrish, but i'm not sure its correct

WITH SalesByCustomer AS (
    SELECT 
        soh.CustomerID,
        a.CountyRegion,
        SUM(soh.SubTotal) AS TotalSales
    FROM 
        SalesOrderHeader AS soh
    JOIN 
        Customer AS c ON soh.CustomerID = c.CustomerID
    JOIN 
        CustomerAddress AS ca ON c.CustomerID = ca.CustomerID
    JOIN 
        Address AS a ON ca.AddressID = a.AddressID
    GROUP BY 
        soh.CustomerID, a.CountyRegion
),
RankedCustomers AS (
    SELECT 
        CustomerID,
        CountyRegion,
        TotalSales,
        RANK() OVER (PARTITION BY CountyRegion ORDER BY TotalSales DESC) AS Rank
    FROM 
        SalesByCustomer
)
SELECT 
    CustomerID,
    CountyRegion,
    TotalSales
FROM 
    RankedCustomers
WHERE 
    Rank = 1;
