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