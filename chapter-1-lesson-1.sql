-- selecting in non-relational way
select
	custid
	,year(orderdate)
from Sales.Orders
order by 1, 2

/*
  selecting in relational way:
    * give an alias to an attribute (column)
    * return only unique values (what set theory requires)
    * remove ordering (there is no ordering in sets)
*/
select distinct
	custid
	,year(orderdate) as orderyear
from Sales.Orders