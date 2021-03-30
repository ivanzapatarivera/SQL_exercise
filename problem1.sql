Select @@autocommit;
Set @@autocommit = 0;
Select @@SQL_SAFE_UPDATES;
Set @@SQL_SAFE_UPDATES = 0;

DROP SCHEMA IF EXISTS da_bootcamp_zapatarivera; 
CREATE SCHEMA IF NOT EXISTS da_bootcamp_zapatarivera;
Use da_bootcamp_zapatarivera;

-- 1. Create a new table 'animals' with an ID column (type INT) and 2 additional columns (any name and datatype).
CREATE TABLE IF NOT EXISTS animals (
    ID INT Auto_Increment Not Null,
    Animal_Name VARCHAR(50) Not Null,
    Animal_Age INT Not Null,
    Primary Key (ID)  
);

-- 2. Add a new column to the table, then DROP one of the other columns (other than ID).
ALTER TABLE animals
ADD COLUMN 
    Animal_Class VARCHAR(50) Not Null,
DROP COLUMN
    Animal_Name,
DROP COLUMN
    Animal_Age;

-- 3. Rename the table to 'zoo_animals'
ALTER TABLE animals
RENAME zoo_animals;

-- 4. Select all records from the (empty) zoo_animals table
SELECT * FROM zoo_animals;

-- 5. Drop the table - actually, to be on the safe side, use the "if exists" condition to drop animals if it exists, and drop zoo_animals if it exists.
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS zoo_animals;