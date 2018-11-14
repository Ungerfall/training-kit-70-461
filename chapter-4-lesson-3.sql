/*
clean up
*/
DELETE FROM Production.Suppliers WHERE supplierid > 29;
IF OBJECT_ID('Sales.RankedProducts', 'V') IS NOT NULL DROP VIEW Sales.RankedProducts;
IF OBJECT_ID('HR.GetManagers', 'IF') IS NOT NULL DROP FUNCTION HR.GetManagers;

/*
basic except
*/
SELECT empid
FROM Sales.Orders
WHERE custid = 1

EXCEPT

SELECT empid
FROM Sales.Orders
WHERE custid = 2;

/*
return employees who handled orders for both customer 1 and customer 2.
*/
select empid
from Sales.Orders
where custid = 1

INTERSECT

select empid
from Sales.Orders
where custid = 2;
