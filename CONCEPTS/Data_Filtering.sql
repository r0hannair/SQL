-- Filter Data
-- Compaisons
select * from customers where country='USA';

select * from customers where country <> 'Germany' -- != or <>

select * from customers where score > 500;

select * from customers where score >= 500;

select * from customers where score < 500;

select * from customers where score <= 500;

-- Logical Operator

select * from customers where country = 'USA' and score > 500;

select * from customers where country = 'USA' or score > 500;

select * from customers where not score < 500;

-- Between

select * from customers where score between 100 and 500;

-- in / not in

select * from customers where country in ('USA','Germany');

select * from customers where country not in ('USA','Germany');

-- like

select * from customers where country like 'U%'


select * from customers where country like 'U_'