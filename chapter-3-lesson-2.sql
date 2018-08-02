/*
You start this step with the query you wrote in step 3 of Exercise 1. You are given a
requirement to add secondary ordering by shipped date, descending. Add shipperid
DESC to the ORDER BY clause, as follows.
*/
SELECT orderid, empid, shipperid, shippeddate
FROM Sales.Orders
WHERE custid = 77
ORDER BY shipperid, shippeddate DESC;

/*
You are asked to revise the query from step 1 by guaranteeing deterministic ordering.
You need to define a tiebreaker. For example, define orderid DESC as a tiebreaker, as
follows.
*/
SELECT orderid, empid, shipperid, shippeddate
FROM Sales.Orders
WHERE custid = 77
ORDER BY shipperid, shippeddate DESC, orderid DESC;