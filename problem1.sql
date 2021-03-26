Select @@autocommit;
Set @@autocommit;
Select @@SQL_SAFE_UPDATES;
Set @@SQL_SAFE_UPDATES = 0;

CREATE TABLE IF NOT EXISTS animals (
    ID INT Auto_Increment Not Null,
    Animal_Name VARCHAR(50) Not Null,
    Animal_Age INT(3) Not Null,
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