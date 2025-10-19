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

-- Functions: Important sql functions
-- 1. COUNT() - counts the number of rows:
SELECT COUNT(*) FROM students;

-- 2. NOW() - returns the current date and time
SELECT NOW();

-- 3. CONCAT() - concats two strings.
SELECT CONCAT('A','B');

-- 4. LENGTH() - returns the length of a string in bytes;
SELECT LENGTH('abc');

-- 5. ROUND(num, places) - rounds off the given number to n decimal places.
SELECT ROUND(24.67, 1);

-- 6. DATEDIFF() - returns the difference between two dates (in days).
SELECT DATEDIFF('2025-06-01', '2025-05-01');

-- 7. MIN() - returns the minimum value from the given data
SELECT MIN(marks) FROM students;

-- 8. MAX() - returns the maximum value from the given data
SELECT MAX(marks) FROM students;

-- 9. SUM() - returns the total of the given data
SELECT SUM(marks) FROM students;

-- 10. AVG() - returns the average of the given data
SELECT AVG(marks) FROM students;

-- 11. IF(condition, value if True, value if False) - apply a logical condition to the given value
SELECT marks, IF(marks > 70, 'Pass', 'Fail') FROM students;


-- GROUP BY: summarises the data into groups.
SELECT * FROM books GROUP BY genre;

-- ORDER BY: Arrange the data in ascending or descending order
SELECT * FROM students ORDER BY marks DESC;
SELECT * FROM students ORDER BY marks ASC;

-- Autocommit
-- By default, sql queries change the data permanently. However, we can modify this behaviour with:
SET autocommit = 0; -- sets autocommit to false.
COMMIT; -- saves the changes done till now.

-- Now we can perform any queries without any fear of losing the data. If we do a mistake, we can go back to the previous data using:
ROLLBACK;

-- If we want to apply the changes permanently to the database, then:
COMMIT;

-- Note: DDL commands are an exception.
