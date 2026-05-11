/*Comment
this*/

--Comment

-- Select All the columns
select * from customers;

select * from orders;

-- Select only few columns

select first_name,country,score from customers;

-- Select with conditions (where)

select first_name,country from customers where score>500;

select * from customers where country='Germany';

-- Sort the data using order by

select * from customers order by score;

select * from customers order by score desc;

-- Nested sorting

select * from customers order by country,score desc;

-- Aggregate Function - Group by

select country, sum(score), count(id) as total_score from customers group by country;

-- Having caluse

select country, sum(score), count(id) as total_score from customers group by country having sum(score)>800;

-- Filter after filter

select country, sum(score), count(id) as total_score from customers where score>400 group by country having sum(score)>800;


select country, avg(score) as Average_Score from customers where score!=0 group by country having avg(score)>430;

-- Distinct (Remove Duplicates)

select distinct country from customers;

-- Top to limit data

select * from customers order by score desc limit 4;

select * from orders order by order_date desc limit 2;

-- Multiple 

select * from customers;
select * from orders;

select 'HI' as static_string;


