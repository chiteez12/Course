-- This is a cheatsheet for learning SQL. It shall be updated regularly. This is helpful for almost everyone who are working with MySQL. 
-- Please provide feedbacks. It really means a lot. If you find this helpful, please share it with peole you know.
-- This cheatsheet contains queries with direct application. This shows their practical usage on a typical relation.

-- Creating a database:
CREATE DATABASE course;

-- Selecting the database:
USE course;

-- Creating a table:
CREATE TABLE studentdata (
	roll_no INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL DEFAULT 'unknown',
    marks INT NOT NULL DEFAULT 50
);

-- Selecting data:
SELECT * FROM studentdata;

-- To drop data:
DROP DATABASE course; 

-- Renaming the table:
RENAME TABLE studentdata TO students;
SELECT * FROM students;

-- Altering table:
-- Add a column:
ALTER TABLE students ADD gender ENUM('Male', 'Female', 'Others');   
DESC students;

-- Modifying a column:
ALTER TABLE students MODIFY gender VARCHAR(50);

-- Dropping a column:
ALTER TABLE students DROP gender;

-- Rearranging the columns:
ALTER TABLE students MODIFY roll_no INT AFTER name;
ALTER TABLE students MODIFY roll_no INT FIRST;

-- Inserting data:
INSERT INTO students VALUES (1, 'a', 54), (2, 'b', 65);
INSERT INTO students (roll_no, name) VALUES (3, 'c'); -- Column specific

-- Updating data:
UPDATE students SET marks = 64 WHERE roll_no = 3;
UPDATE students SET marks = 75, name = 'abhay' WHERE roll_no = 1; -- Update multiple columns

-- Deleting data:
DELETE FROM students WHERE roll_no = 3;

-- Drop the table/database:
DROP TABLE students;
DROP DATABASE course;

-- Made with love and passion!
-- Add a constraint:
ALTER TABLE students ADD CONSTRAINT unique_name UNIQUE(name); -- unique_name is the constraint's name

-- Add check constraint:
ALTER TABLE students ADD CONSTRAINT chk_dob CHECK(dob > '2007-01-01');
