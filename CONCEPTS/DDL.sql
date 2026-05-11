-- CREATE NEW TABLE
create table persons (
	id int not null,
	person_name varchar(50) not null,
	birth_date date,
	phone varchar(15) not null,
	constraint pk_persons PRIMARY key (id)
);

-- ALTER TABLE (ADD)
alter table persons
add email varchar(50) not null;

-- Alter table (DROP)
alter table persons
drop column phone;

-- DROP TABLE
drop table persons;