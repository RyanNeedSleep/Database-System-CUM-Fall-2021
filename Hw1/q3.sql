SELECT Id, 
    ShipCountry, 
   (CASE 
    WHEN ShipCountry IN ('USA', 'Mexico', 'Canada') THEN 'NorthAmerica'
    ELSE 'OtherPlace'
    END)
FROM `Order`
LIMIT 20;
