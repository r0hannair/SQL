-- current timestamp
select 
orderid,
orderdate,
shipdate,
creationtime,
'2026-05-15' as hardcoded,
now() today
from sales.orders;

-- extract
select 
orderid, creationtime,
extract(day from creationtime) as DAY,
extract(month from creationtime) as MONTH,
extract(year from  creationtime) as YEAR,
extract(hour from  creationtime) as HR,
extract(minute from  creationtime) as MINS
from sales.orders;

--datepart(part,date)
select
orderid, creationtime,
date_part('year',creationtime) as dp_year,
date_part('month',creationtime) as dp_month,
date_part('day',creationtime) as dp_day,
date_part('week',creationtime) as dp_week,
date_part('quarter',creationtime) as dp_quarter,
date_part('hour',creationtime) as dp_hr
from sales.orders;

-- to get the date part
select orderid, creationtime,
to_char(creationtime,'fmMonth'),
to_char(creationtime,'fmDay'),
to_char(now(),'Day, dd Month yyyy')
from sales.orders;

-- datetrunc
select orderid,creationtime,
date_trunc('minute',creationtime) minute_dt,
date_trunc('year',creationtime) yr_dt,
date_trunc('day',creationtime) day_dt
from sales.orders;

select date_trunc('month',creationtime) creation,
count(*)
from sales.orders
group by date_trunc('month',creationtime);

-- end of month
select orderid,creationtime,
date_trunc('month',creationtime)+interval '1 month'-interval '1 day'
from sales.orders;

select to_char(orderdate,'fmmonth'),* from sales.orders where to_char(orderdate,'fmmonth')='february';
--or
select * from sales.orders where extract(month from orderdate)=2;

--
select concat('Day ',to_char(creationtime,'Dy Mon '),'Q',to_char(creationtime,'Q YYYY HH12:MI:SS AM')) from sales.orders;

select to_char(orderdate,'Mon yy'),count(*)
from sales.orders
group by to_char(orderdate,'Mon yy');

--CAST
select cast('123.54' as numeric) as String_to_Integer;
select '123.54'::numeric::integer;
select cast(124 as varchar) as INT_to_STRING;

select creationtime,
cast(creationtime as date)
from sales.orders;

-- Date calculations
select orderid, orderdate,
(orderdate+interval '2 years')::date as two_yr_later,
(orderdate+interval '2 months')::date as two_mon_later,
(orderdate+interval '-10 days')::date as ten_day_before
from sales.orders;

select employeeid,concat(firstname,lastname) as PERSON_NAME,
extract(year from age(now()::date,birthdate)) as AGE
from sales.employees;

select to_char(orderdate,'Month') as ordermonth,
round(avg(shipdate-orderdate),2) as ShippingDuration
from sales.orders group by to_char(orderdate,'Month');

--Time Gap Analysis
select orderid,orderdate currentorderdate,
lag(orderdate) over(order by orderdate) as previousorderdate,
age(orderdate,lag(orderdate) over(order by orderdate)) as differ
from sales.orders;

select
pg_input_is_valid('2025-08','date');

select orderdate,
case 
	when pg_input_is_valid(orderdate,'date')=true then cast(orderdate as date)
	else null
end neworderdate
from
(
	select '2026-08-20' as orderdate union
	select '2026-08-21' union
	select '2026-08-23' union
	select '2026-08'
)t
