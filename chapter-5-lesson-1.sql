/*
group and aggregate data involving customers and orders.
*/
SELECT C.custid, COUNT(*) AS numorders
FROM Sales.Customers AS C
 INNER JOIN Sales.Orders AS O
 ON C.custid = O.custid
WHERE C.country = N'Spain'
GROUP BY C.custid;
GO

/*
Add the city information in the output of the query
*/
SELECT C.custid, C.city, COUNT(*) AS numorders
FROM Sales.Customers AS C
 INNER JOIN Sales.Orders AS O
 ON C.custid = O.custid
WHERE C.country = N'Spain'
GROUP BY C.custid;
GO

/*
 add city to the GROUP BY clause
*/
SELECT C.custid, C.city, COUNT(*) AS numorders
FROM Sales.Customers AS C
 INNER JOIN Sales.Orders AS O
 ON C.custid = O.custid
WHERE C.country = N'Spain'
GROUP BY C.custid, C.city;
GO

/*
GROUPING SETS
*/
SELECT C.custid, C.city, COUNT(*) AS numorders
FROM Sales.Customers AS C
 INNER JOIN Sales.Orders AS O
 ON C.custid = O.custid
WHERE C.country = N'Spain'
GROUP BY GROUPING SETS ( (C.custid, C.city), () )
ORDER BY GROUPING(C.custid);
GO