DROP TABLE IF EXISTS item_details;

CREATE TABLE item_details (
    item_id VARCHAR(10) NOT NULL,
    item_price FLOAT NOT NULL, 
    item_description VARCHAR(50) NOT NULL,
    Primary Key (item_id)
);

INSERT INTO item_details
VALUES
    ('itm001',2,'Avocado (ind)'),
    ('itm002',60,'Apple Bag'),
    ('itm003',0.5,'Lemons (ind)'),
    ('itm004',2,'Banana (lb)'),
    ('itm005',3,'Broccoli (head)')
;

SELECT * FROM item_details;