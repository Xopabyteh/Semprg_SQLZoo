-- Show the total order value for each CountryRegion. List by value with the highest first.
-- Zadání říká "CountryRegion", ale v db je pro příkaz "CountyRegion" :facepalm:

SELECT 
    a.CountyRegion,
    SUM(soh.SubTotal) AS TotalOrderValue
FROM SalesOrderHeader soh
JOIN Customer c ON soh.CustomerID = c.CustomerID
JOIN Address a ON c.CustomerID = a.AddressID
GROUP BY a.CountyRegion
ORDER BY TotalOrderValue DESC;
