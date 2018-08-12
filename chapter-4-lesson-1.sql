/*
Write a query that matches customers with their respective orders, returning only
matches. You are not required to return customers with no related orders. 
*/
select c.custid, c.companyname, o.orderid, o.orderdate
from sales.customers c
inner join sales.orders o on c.custid = o.custid;

/*
Revise your query to also include customers without orders.
Alter the join type to a left outer join, as follows
*/
select c.custid, c.companyname, o.orderid, o.orderdate
from sales.customers c
left outer join sales.orders o on c.custid = o.custid;

/*
Return only customers without orders. 
*/
select c.custid, c.companyname, o.orderid, o.orderdate
from sales.customers c
left outer join sales.orders o on c.custid = o.custid
where o.custid is null;

/*
Write a query that returns all customers, but match orders only if they were placed in
February 2008.
*/
select c.custid, c.companyname, o.orderid, o.orderdate
from sales.customers c
left outer join sales.orders o on c.custid = o.custid
where o.orderdate >= '20080201' and o.orderdate < '20080301';
