/*
You are asked to write a query that returns orders that were not shipped yet. Such
orders have a NULL in the shippeddate column.
*/
SELECT orderid, orderdate, custid, empid
FROM Sales.Orders
WHERE shippeddate IS NULL;

/*
You are requested to return all orders that were placed between February 11, 2008,
and February 12, 2015
*/
SELECT orderid, orderdate, custid, empid
FROM Sales.Orders
WHERE orderdate >= '20160211' AND orderdate < '20160213';