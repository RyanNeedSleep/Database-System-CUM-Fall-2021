.header on


/*
 1. if you have "CREATE VIEW" a table, it will not be updated as you run it again
 Unless you use "CREATE OR REPLACE(not supported in Sqlite)", "AlTER VIEW" 
 */

DROP VIEW IF EXISTS [Order_with_ProductName];
CREATE VIEW [Order_with_ProductName] AS 
SELECT  Orders.Id, Orders.CustomerId, OrderDetail.ProductId, Product.ProductName
FROM Orders
LEFT JOIN OrderDetail
ON CAST(OrderDetail.Id AS INT) = Orders.Id
LEFT JOIN Product
ON Product.Id = CAST(OrderDetail.ProductId AS INT)
LIMIT 3;


SELECT * FROM Order_with_ProductName;
