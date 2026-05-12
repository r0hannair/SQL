-- SET

--UNION

select c.firstname,c.lastname  from sales.customers c
union
select e.firstname,e.lastname from sales.employees e;

-- UNION ALL

select c.firstname,c.lastname  from sales.customers c
union all
select e.firstname,e.lastname from sales.employees e;

-- EXCEPT

select c.firstname,c.lastname  from sales.customers c
except
select e.firstname,e.lastname from sales.employees e;

-- INTERSECT

select c.firstname,c.lastname  from sales.customers c
intersect
select e.firstname,e.lastname from sales.employees e;

select 
'orders' as sourcetable,
o.orderid, o.productid, o.customerid, o.salespersonid, 
o.orderdate, o.shipdate, o.orderstatus, o.shipaddress, 
o.billaddress, o.quantity, o.sales, o.creationtime 
from sales.orders o
union
select 
'ordersarchive' as sourcetable,
oa.orderid, oa.productid, oa.customerid, oa.salespersonid, 
oa.orderdate, oa.shipdate, oa.orderstatus, oa.shipaddress, 
oa.billaddress, oa.quantity, oa.sales, oa.creationtime 
from sales.ordersarchive oa
order by orderid;


