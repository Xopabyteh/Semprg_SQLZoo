-- List the SalesOrderNumber for the customer 'Good Toys' 'Bike World'

SELECT SalesOrderNumber
FROM SalesOrderHeader
WHERE CustomerID IN ('Good Toys', 'Bike World');

-- Co je SalesOrderNumber ? ? ?
-- -> Unknown column 'SalesOrderNumber' in 'SELECT'