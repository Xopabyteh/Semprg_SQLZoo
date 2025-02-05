SELECT CompanyName
FROM Customer
INNER JOIN CustomerAddress ON Customer.CustomerID = CustomerAddress.CustomerID
INNER JOIN Address ON CustomerAddress.AddressID = Address.AddressID
WHERE Address.City = 'Dallas'