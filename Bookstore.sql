-- creating the Bookstore database 
CREATE Database BookStore;
USE BookStore;
 
-- creating Books1 table 
CREATE TABLE Books1
(
    id INT,
    name VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price INT NOT NULL
 );
 
-- Creaying Books2 table 
CREATE TABLE Books2
(
    id INT,
    name VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price INT NOT NULL
 );
 
-- inserting values to the tables 
INSERT INTO Books1
VALUES
(1, 'Book1', 'Cat1', 1800),
(2, 'Book2', 'Cat2', 1500),
(3, 'Book3', 'Cat3', 2000),
(4, 'Book4', 'Cat4', 1300),
(5, 'Book5', 'Cat5', 1500),
(6, 'Book6', 'Cat6', 5000),
(7, 'Book7', 'Cat7', 8000),
(8, 'Book8', 'Cat8', 5000),
(9, 'Book9', 'Cat9', 5400),
(10, 'Book10', 'Cat10', 3200);
 
-- inserting values to the Books2 table 
INSERT INTO Books2
VALUES
(6, 'Book6', 'Cat6', 5000),
(7, 'Book7', 'Cat7', 8000),
(8, 'Book8', 'Cat8', 5000),
(9, 'Book9', 'Cat9', 5400),
(10, 'Book10', 'Cat10', 3200),
(11, 'Book11', 'Cat11', 5000),
(12, 'Book12', 'Cat12', 8000),
(13, 'Book13', 'Cat13', 5000),
(14, 'Book14', 'Cat14', 5400),
(15, 'Book15', 'Cat15', 3200); 

SELECT * FROM Books1;
SELECT * FROM Books2;

-- using UNION to return unique values in both tables 
SELECT *
FROM Books1
UNION
SELECT *
FROM Books2;  

-- using UNION ALL to return all values including the duplicates 
SELECT *
FROM Books1
UNION ALL
SELECT *
FROM Books2;  

-- Using INNER JOIN (returns only rows that are common in both Books1 and Books2 depending on the chosen field 'id')
SELECT *
FROM Books1 AS B1
INNER JOIN Books2 AS B2
ON B1.id = B2.id; 

-- Using LEFT JOIN (Returns all records in the left table (B1) and records similar in both tables based on the chosen shared field (id)) 
SELECT *
FROM Books1 AS B1
LEFT JOIN Books2 AS B2    
ON B1.id = B2.id;    -- returns 10 rows 




