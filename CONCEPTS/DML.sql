-- INSERT values
insert into customers (id,first_name,country,score)
values 
(6,'Anna','USA',NULL),
(7,'Sam',NULL,100)

select * from customers;

insert into customers (id,first_name)
values
(8,'Sahra')

-- Insert value using select

insert into persons (id,person_name,birth_date,phone) 
select id,
first_name,
null,
'Unknown' 
from customers;

select * from persons;

-- MODIFY

update customers
set score = 0
where id = 6;

update customers
set score = 0,
	country ='UK'
where id = 8;

update customers
set score = 0
where score is NULL;

-- DELETE
delete from customers
where id > 5;

-- Delete all data from persons
delete from persons;
--or
truncate table persons;

select * from customers;
select * from persons;
