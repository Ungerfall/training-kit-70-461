--1
/*
Write a query against the HR.Employees table that returns the employee ID, the full
name of the employee (concatenate the attributes firstname, space, and lastname), and
the birth year (apply a function to the birthdate attribute). Here’s one possible query
that achieves this task
*/
select
	empid as [employee ID]
	,concat(firstname, N' ', lastname) as [full name]
	,year(birthdate) as [the birth year]
from HR.Employees;
--2
/*
Write an expression that computes the date of the last day of the current month. Also write
an expression that computes the last day of the current year. Of course, there are a number of
ways to achieve such tasks. Here’s one way to compute the end of the current month.
*/
select EOMONTH(sysdatetime(), 0);
select EOMONTH(datefromparts(year(sysdatetime()), 12, 1), 0);
--3
/*
  select formatted fixed-sized string
*/
select
	productid
	,right(concat(replicate('0', 10), cast(productid as varchar(10))), 10) as str_productid
from Production.Products;
/*
  same task, but with FORMAT function
*/
select
	productid
	,format(productid, 'd10') AS str_productid
from Production.Products;