/*
You are tasked with writing a query against the Production.Products table, returning
the five most expensive products from category 1.
*/
SELECT TOP(5)
	p.productid
	,p.unitprice
FROM Production.Products p
WHERE p.categoryid = 1
ORDER BY p.unitprice DESC;

/*
You are requested to provide solutions to turn the previous query into a deterministic
one
*/
SELECT TOP(5) WITH TIES
	p.productid
	,p.unitprice
FROM Production.Products p
WHERE p.categoryid = 1
ORDER BY p.unitprice DESC;

/*
Address the second version that breaks the ties by using productid, descending, as
follows.
*/
SELECT TOP(5)
	p.productid
	,p.unitprice
FROM Production.Products p
WHERE p.categoryid = 1
ORDER BY p.unitprice DESC
	,p.productid DESC;

/*
You are requested to write a set of queries that page through products, five at a time,
in unit price ordering, using the product ID as the tie breaker.
*/
SELECT
	p.productid
	,p.categoryid
	,p.unitprice
FROM Production.Products p
ORDER BY p.unitprice
	,p.productid
OFFSET 0 ROWS FETCH FIRST 5 ROWS ONLY;

/*
write a query that returns the next five rows (rows 6 through 10)
*/
SELECT
	p.productid
	,p.categoryid
	,p.unitprice
FROM Production.Products p
ORDER BY p.unitprice
	,p.productid
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;