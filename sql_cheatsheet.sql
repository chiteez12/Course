-- This is a cheatsheet for learning sql. It shall be updated regularly. This is helpful for almost everyone who are working with mysql. Please provide feedbacks. It really means a lot.

-- Creating a database:
create database course;

-- Selecting the database:
use course;

-- Creating a table:
create table studentdata(
	roll_no int primary key,
    name varchar(50) not null default 'unknown',
    marks int not null default 50
    );
-- Selecting data:
select * from studentdata;

/* To drop data:
drop database course;
*/ 

-- renaming the table;
rename table studentdata to students;
select * from students;

-- Altering table:
-- Add a column:
alter table students add gender enum('Male', 'Female', 'Others');   
desc students;

-- Modifying a column:
alter table students modify gender varchar(50);

-- Dropping a column:
alter table students drop gender varchar(50);

-- Rearranging the columns:
alter table students modify roll_no int after name;
alter table students modify roll_no int first;

-- inserting data
insert into students values (1, 'a', 54), (2, 'b', 65);
insert into students (roll_no, name) values (3, 'c'); -- column specific

-- updating data
update students set marks = 64 where roll_no = 3;
update students set marks = 75, name = 'abhay' where roll_no = 1; -- update multiple columns

-- Deleting data
delete from students where roll_no = 3;

-- Drop the table/database
drop table students;
drop database course;

-- Add a constraint:
alter table students add constraint unique_name unique(name); -- unique_name is the constraint's name

-- Add check constraint:
alter table students add constraint chk_dob check(dob > '2007-01-01');
