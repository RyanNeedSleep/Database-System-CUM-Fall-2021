SELECT DISTINCT ShipName, substr(ShipName, 1, instr(ShipName, '-')-1) as NewShipName
FROM `Order`
WHERE instr(ShipName, '-')
ORDER BY NewShipName
LIMIT 10;





