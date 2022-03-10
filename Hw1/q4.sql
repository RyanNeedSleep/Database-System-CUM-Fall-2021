.header on


-- 1. if it is not casted to float, it will be treated as integar even after the division
-- 2. Be aware of "NULL" in the data, they will not be counted and cannot be compared
-- 3. INNER join can help us to lookup with foreign with "ON"
-- 4. Be aware of the keywords. There will not be any warning if you use then as table name.

SELECT Shipper.CompanyName AS Shipper_name, 
ROUND(CAST(SUM(RequiredDate < ShippedDate) AS FLOAT(5,2)) * 100.0 / CAST(COUNT(DISTINCT Orders.Id) AS FLOAT(5,2)),2) AS Delay_percent  FROM `Orders`
INNER JOIN `Shipper`
ON Orders.ShipVia = Shipper.Id
GROUP BY Orders.ShipVia;

/* SELECT ShippedDate */
/* FROM Orders */
/* WHERE (RequiredDate is null or ShippedDate is null); */
