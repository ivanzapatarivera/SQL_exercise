Select @@autocommit;
Set @@autocommit = 0;
Select @@SQL_SAFE_UPDATES;
Set @@SQL_SAFE_UPDATES = 0;

DROP SCHEMA IF EXISTS da_bootcamp_zapatarivera; 
CREATE SCHEMA IF NOT EXISTS da_bootcamp_zapatarivera;
Use da_bootcamp_zapatarivera;

CREATE TABLE IF NOT EXISTS animals (
    ID INT Auto_Increment Not Null,
    Animal_Name VARCHAR(50) Not Null,
    Animal_Age INT Not Null,
    Primary Key (ID) 
);

ALTER TABLE animals
ADD COLUMN 
    Animal_Class VARCHAR(50) Not Null,
DROP COLUMN
    Animal_Name,
DROP COLUMN
    Animal_Age;

ALTER TABLE animals
RENAME zoo_animals;

SELECT * FROM zoo_animals;

DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS zoo_animals;