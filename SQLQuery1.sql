-- trong SQL không phân biệt chữ hoa và chữ thường
-- SELECT, select, SeLect


-- Create database
--CREATE DATABASE test;

-- Drop database
--DROP DATABASE test;

--CREATE DATABASE record_company;

-- --use database record_company
--USE record_company;

-- create a table
CREATE TABLE test(

test_column INT

);

ALTER TABLE test
--thêm một cột có kiểu char với max các kí tự là 255
ADD 
another_column 
VARCHAR(255);

----drop table
--DROP TABLE test;

CREATE TABLE bands(
-- create column ID and auto add id
--the auto_increment is not supported by the SQL server. You need to use the IDENTITY property.
	id INT NOT NULL IDENTITY(1,1), 
-- tạo cột name mà không được để trống
	name VARCHAR(255) NOT NULL,
--give column id is KEY
	PRIMARY KEY (id)


);

--create a table albums
CREATE TABLE albums(
id INT NOT NULL IDENTITY(1,1),
name VARCHAR(255) NOT NULL,
release_year INT,
band_id INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (band_id) REFERENCES bands(id)

);


--add data
INSERT INTO bands (name)
-- add value in column name in table bands
VALUES ('Iron Maiden'), ('Deuce'),('Ankor');


--select data
SELECT * -- select all
SELECT * FROM bands; -- select from column name bands

SELECT name FROM bands;

--change name when you print column
SELECT id AS 'ID', name AS 'Band Name' FROM bands;

--đảo ngược hiển thị
SELECT * FROM bands ORDER BY name;


INSERT INTO albums (name,release_year,band_id)
VALUES ('The number of the beats',1885,1),
		('Power Slave',1984,1),
		('Nightmare',2018,2),
		('Nightmare',1999,3),
		('Test Albums',NULL,3)
		
SELECT * FROM albums;
SELECT name FROM albums;

--lấy các tên khác nhau
SELECT DISTINCT name FROM albums; 

--update dữ liệu
UPDATE albums
SET release_year = 1988

--select có điều kiện

SELECT *FROM albums
WHERE release_year < 2000;

SELECT * FROM albums
WHERE name LIKE '%er%' OR band_id = 2;
-- OR, AND, BETWEEN AND 

SELECT * FROM albums
WHERE release_year IS NULL;

-- DELETE 
DELETE FROM albums 
WHERE id >=6;

--join
SELECT * FROM bands
--SELECT * FROM albums
INNER JOIN albums ON bands.id = albums.band_id;

SELECT * FROM bands
--SELECT * FROM albums
LEFT JOIN albums ON bands.id = albums.band_id;

SELECT * FROM bands
--SELECT * FROM albums
RIGHT JOIN albums ON bands.id = albums.band_id;

SELECT * FROM albums
--SELECT * FROM albums
INNER JOIN bands ON bands.id = albums.band_id;



-- Aggregate Function

SELECT AVG(release_year) FROM albums;

SELECT SUM(release_year) FROM albums;

SELECT band_id, COUNT(band_id) FROM albums
GROUP BY band_id;


SELECT b.name AS band_name, COUNT(a.id) AS num_albums
FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.band_id
--WHERE num_albums = 1
WHERE b.name = 'Deuce'
GROUP BY b.id
HAVING num_albums = 1;


--drop table bands;