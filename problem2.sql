DROP TABLE IF EXISTS item_details;

CREATE TABLE item_details (
    item_id INT AUTO_INCREMENT NOT NULL,
    item_price FLOAT NOT NULL, 
    item_description VARCHAR(50) NOT NULL,
    Primary Key (item_id)
);