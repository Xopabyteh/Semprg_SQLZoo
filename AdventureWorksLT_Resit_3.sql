-- List the name and addresses of companies containing the word 'Bike' (upper or lower case) and companies containing 'cycle' (upper or lower case). Ensure that the 'bike's are listed before the 'cycles's.

SELECT * FROM Address
WHERE AddressID IN (
    SELECT AddressID FROM Customer
    WHERE CompanyName LIKE '%bike%'
    ORDER BY CompanyName
)
OR AddressID IN (
    SELECT AddressID FROM Customer
    WHERE CompanyName LIKE '%cycle%'
    ORDER BY CompanyName
);