/*
  a table aliase.
*/
select
  S.shipperid
  ,companyname
  ,phone
from Sales.Shippers S

/*
  a column aliase.
*/
select
  S.shipperid
  ,companyname
  ,phone AS [phone number]
from Sales.Shippers S
