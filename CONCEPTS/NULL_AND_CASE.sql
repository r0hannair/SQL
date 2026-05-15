--COALESCE
select shipaddress,billaddress, coalesce(shipaddress,billaddress,'N/A') from sales.orders;

select customerid,
score,
avg(score) over() avgscores,
avg(coalesce(score,0)) over() avgscores2
from sales.customers;

select customerid,firstname,lastname,concat(firstname,' ',lastname) as FullNAME, score,
coalesce(score,0)+10 as scorewithbonus
from sales.customers;

select customerid, score
from sales.customers order by score;

--NULLIF
select nullif(shipaddress,'0') from sales.orders;

select orderid,sales,quantity,
sales/nullif(quantity,0) as price
from sales.orders;

select * from sales.customers where score is not null;

--ISNULL
select * from sales.customers c left join sales.orders o on c.customerid=o.customerid where o.customerid is null;

--CASE
select customerid,score,
case when score>600 then 'High'
when score>400 then 'Medium'
else 'Low'
end
from sales.customers order by score desc;

select category, sum(sales) as totalsales
from(
select orderid,sales,
case when sales>50 then 'High'
when sales>20 then 'Medium'
else 'Low'
end category
from sales.orders)t group by category order by totalsales desc;

select employeeid,firstname,lastname,gender,
case when gender='M' then 'Male'
when gender='F' then 'Female'
else 'Not Available'
end gendertext
from sales.employees;

select employeeid,firstname,lastname,gender,
case gender when 'M' then 'Male'
when 'F' then 'Female'
else 'Not Available'
end gendertext
from sales.employees;

select customerid,lastname,score,
case
when score is null then 0
else score
end scoreclean,
avg(case
		when score is null then 0
		else score
	end) over() avgcustomerclean,
avg(score) over() avgcustomer
from sales.customers;


select customerid,lastname,score,
avg(coalesce(score,0)) over() avgcustomer
from sales.customers;

select
customerid,
sum(case when sales>30 then 1
else 0 end) as Total_orders_high_sales,
count(*) as TotalOrders
from sales.orders
group by customerid
order by customerid;
