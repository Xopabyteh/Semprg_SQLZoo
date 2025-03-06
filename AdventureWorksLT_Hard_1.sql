-- For every customer with a 'Main Office' in Dallas show AddressLine1 of the 'Main Office' and AddressLine1 of the 'Shipping' address - if there is no shipping address leave it blank. Use one row per customer.

SELECT R.CustomerID, R.MainOfficeAddress, Shipping.AddressLine1 AS ShippingAddress
FROM
    (SELECT MainOfficeCustomer.CustomerID, MainOffice.AddressLine1 AS MainOfficeAddress
    FROM Customer AS MainOfficeCustomer
    JOIN CustomerAddress ON MainOfficeCustomer.CustomerID = CustomerAddress.CustomerID
    JOIN Address AS MainOffice ON CustomerAddress.AddressID = MainOffice.AddressID 
    WHERE MainOffice.City = 'Dallas' AND CustomerAddress.AddressType = 'Main Office') AS R
LEFT JOIN
    (SELECT Customer.CustomerID, Address.AddressLine1 
    FROM Customer
    JOIN CustomerAddress ON Customer.CustomerID = CustomerAddress.CustomerID
    JOIN Address ON CustomerAddress.AddressID = Address.AddressID 
    WHERE CustomerAddress.AddressType = 'Shipping') AS Shipping
ON R.CustomerID = Shipping.CustomerID;

