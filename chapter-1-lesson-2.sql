-- ex. 1
-- Try to figure out why the query failed.
/*
  SELECT custid, MAX(orderid) AS maxorderid
  FROM Sales.Orders
  GROUP BY custid;
*/
select custid, max(orderid) as maxorderid
from Sales.Orders
group by custid;

-- ex. 2
-- Fix a Problem with Aliasing
/*
  SELECT shipperid, SUM(freight) AS totalfreight
  FROM Sales.Orders
  GROUP BY shipperid
  HAVING totalfreight > 20000.00;
*/
select shipperid, sum(freight) as totalfreight
from Sales.Orders
group by shipperid
having sum(freight) > 20000.0;