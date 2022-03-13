-- .header on

/* Think in Sets, Not Procedures */
SELECT pname, CompanyName, ContactName
FROM(
    SELECT pname, MIN(OrderDate), Customer.CompanyName, Customer.ContactName
    FROM(
        SELECT Id AS pid, ProductName AS pname
        FROM Product
        WHERE Discontinued = 1
        )
    INNER JOIN OrderDetail ON OrderDetail.ProductId = pid
    INNER JOIN Orders ON Orders.Id = OrderDetail.OrderId
    INNER JOIN Customer ON Orders.CustomerId = Customer.Id
    GROUP BY pname
    )
ORDER BY pname;

            
    

-- /*
--  1. if you have "CREATE VIEW" a table, it will not be updated as you run it again
--  Unless you use "CREATE OR REPLACE(not supported in Sqlite)", "AlTER VIEW" 
--  */


-- SELECT Product.ProductName, Customer.CompanyName, Customer.ContactName
-- FROM Orders

-- LEFT JOIN OrderDetail
-- ON CAST(OrderDetail.Id AS INT) = Orders.Id

-- LEFT JOIN Product
-- ON Product.Id = CAST(OrderDetail.ProductId AS INT)

-- LEFT JOIN Customer
-- ON Customer.Id = Orders.CustomerId
-- WHERE Product.ProductName IN (SELECT ProductName FROM Product WHERE Discontinued = 1)
-- GROUP BY Product.ProductName
-- ORDER BY Orders.OrderDate;

-- SELECT Order_new.OrderDate, Order_new.ProductName, Customer.CompanyName, Customer.ContactName
-- FROM Order_new
-- LEFT JOIN Customer
-- ON Customer.Id = Order_new.CustomerId
-- WHERE Order_new.ProductName IN (SELECT ProductName FROM Product WHERE Discontinued = 1)
-- -- GROUP BY Order_new.ProductName
-- -- ORDER BY Order_new.OrderDate 

-- LIMIT 10;

