-- JOINS

-- Inner Join

select 
c.id, 
c.first_name,
o.order_id,
o.sales
from customers c inner join orders o on c.id=o.customer_id;

--Left Join

select * from customers c left join orders o on c.id=o.customer_id;

-- Right Join

select * from customers c right join orders o on c.id=o.customer_id;

select * from orders o left join customers c on o.customer_id=c.id;

-- Full Join

select * from customers c full join orders o on c.id=o.customer_id;

-- Left Anti Join

select * from customers c left join orders o on c.id=o.customer_id where o.customer_id is null;

-- Right Anti Join

select * from customers c right join orders o on c.id=o.customer_id where c.id is null;

select * from orders o left join customers c on o.customer_id=c.id where c.id is null;

select * from customers c full join orders o on o.customer_id=c.id where o.customer_id is null or c.id is null;

-- Cross Join
-- All Possible Join - Cartesian Join

select * from customers cross join orders;

-- Multiple Join

SET search_path TO sales;
SET search_path TO public;

select * from orders;

select o.orderid,(c.firstname || ' ' || c.lastname) as customername, 
p.product,o.sales,p.price, (e.firstname || ' ' || e.lastname) as salespersonname
from orders o left join customers c on c.customerid=o.customerid 
left join products p on p.productid=o.productid
left join employees e on e.employeeid=o.salespersonid;

