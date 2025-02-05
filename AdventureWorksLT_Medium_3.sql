SELECT pd.Description
FROM Product p
JOIN ProductModelProductDescription pmpd ON p.ProductModelID = pmpd.ProductModelID
JOIN ProductDescription pd ON pmpd.ProductDescriptionID = pd.ProductDescriptionID
WHERE p.ProductID = 736
  AND pmpd.Culture = 'fr';