SELECT CompanyName
FROM (
    SELECT
        Sum(SalesOrderHeader.SubTotal + SalesOrderHeader.TaxAmt + SalesOrderHeader.Freight) AS TotalOrder,
        CompanyName
    FROM Customer
    INNER JOIN SalesOrderHeader ON SalesOrderHeader.CustomerID = Customer.CustomerID
    GROUP BY Customer.CustomerID
) AS OrderSummary
WHERE OrderSummary.TotalOrder > 100000