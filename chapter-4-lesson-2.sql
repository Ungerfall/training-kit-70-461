/*
 write a query against the Production.Products table that
groups the products by categoryid, and returns for each category the minimum unit
price.
*/
SELECT categoryid, MIN(unitprice) AS mn
FROM Production.Products
GROUP BY categoryid;
/*
define a CTE based on the previous query, and then
join the CTE to the Production.Products table to return per each category the products
with the minimum unit price
*/
WITH CatMin AS
(
 SELECT categoryid, MIN(unitprice) AS mn
 FROM Production.Products
 GROUP BY categoryid
)
SELECT P.categoryid, P.productid, P.productname, P.unitprice
FROM Production.Products AS P
 INNER JOIN CatMin AS M
 ON P.categoryid = M.categoryid
 AND P.unitprice = M.mn;
/*
 Define an inline table-valued function that accepts a supplier ID as input (@supplierid),
in addition to a number (@n), and returns the @n products with the lowest prices for
the input supplier.
*/
IF OBJECT_ID('Production.GetTopProducts', 'IF') IS NOT NULL DROP FUNCTION
Production.GetTopProducts;
GO
CREATE FUNCTION Production.GetTopProducts(@supplierid AS INT, @n AS BIGINT)
RETURNS TABLE
AS
RETURN
	SELECT productid, productname, unitprice
	FROM Production.Products
	WHERE supplierid = @supplierid
	ORDER BY unitprice, productid
	OFFSET 0 ROWS FETCH FIRST @n ROWS ONLY;
GO

SELECT * FROM Production.GetTopProducts(1, 2) AS P;
GO

/*
 return per each supplier from Japan the two products with the lowest prices
*/
SELECT productid, productname, unitprice, TP.*
FROM Production.Suppliers s
CROSS APPLY Production.GetTopProducts(s.supplierid, 2) TP
WHERE s.country = N'Japan';


-- clean up objects
IF OBJECT_ID('Production.GetTopProducts', 'IF') IS NOT NULL DROP FUNCTION
Production.GetTopProducts;