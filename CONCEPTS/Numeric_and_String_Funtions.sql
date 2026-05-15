-- Concat
select first_name , country, concat(first_name,'-',country) as Country_and_Name from customers;

-- LOWER AND UPPER
select first_name , country, lower(first_name) as name_lowercase , upper(country) as country_uppercase from customers;

-- TRIM

select first_name, length(trim(first_name)) as name_length from customers where first_name!=trim(first_name);

-- Replace

select '123-456-7890' as phone, 
replace('123-456-7890', '-', '/') as clean_phone;

select 'report.txt' as file_format,
replace('report.txt','.txt','.csv') as new_file_format;

-- Length

select country, length(country) as length_country_name from customers;

-- LEFT and RIGHT

select first_name, left(trim(first_name),2), right(first_name,2) from customers;

-- SUBSTRING
select first_name, substring(trim(first_name),2,length(first_name)) as first_substringed from customers;

-- ROUND
select  3.516, round(3.516,2) as round_2,round(3.516,1) as round_1,round(3.516) as round_0;

--abs
select -10,abs(-10) as absolute_number; 

