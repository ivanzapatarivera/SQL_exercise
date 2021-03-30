USE da_bootcamp_zapatarivera;
DROP TABLE IF EXISTS item_details;

--  1. Create table item_details using field names (item_id, item_price, item_description), using sensible data types.
CREATE TABLE item_details (
    item_id VARCHAR(10) NOT NULL,
    item_price DECIMAL(9, 2) NOT NULL, 
    item_description VARCHAR(50) NOT NULL,
    PRIMARY KEY (item_id)
);

-- 2. INSERT all raw data provided into item_detail. COMMIT the change.
TRUNCATE TABLE item_details;
INSERT INTO item_details VALUES
    ('itm001',2,'Avocado (ind)'),
    ('itm002',60,'Apple Bag'),
    ('itm003',0.5,'Lemons (ind)'),
    ('itm004',2,'Banana (lb)'),
    ('itm005',3,'Broccoli (head)')
;
COMMIT;

-- 3. SELECT * to confirm all 5 rows are present.
SELECT * FROM item_details;

-- 4. DELETE all records for which the item price is greater-than-or-equal-to 2. 
START TRANSACTION;
DELETE FROM item_details
	WHERE item_price >= 2;
    
-- 5. SELECT * to confirm deletions. ROLLBACK the change, and SELECT * once again to confirm 5 original rows present.
SELECT * FROM item_details;
ROLLBACK;
COMMIT;

-- 6. Ah, the price for Apples was wrong. UPDATE that record to price 6 instead of 60.
UPDATE item_details SET item_price = 6
    WHERE item_description LIKE '%Apple%';

-- 7. The price of Avocados and Broccoli have doubled. UPDATE those records to reflect the price doubling.
UPDATE item_details SET item_price = item_price * 2
    WHERE item_description LIKE '%Avocado%'
    OR item_description LIKE '%Broccoli%';

-- 8. SELECT * to confirm the records are correct. COMMIT. Table item_details is ready for use in PROBLEM 3.
SELECT * FROM item_details;

-- 9. SUGGESTION: To make debugging PROBLEM 3 easier, you may wish to make note of item_details record values as of Step 8, then TRUNCATE item_details and INSERT records to match those recorded values to have a reliable starting point.
# item_id, item_price, item_description
-- ('itm001', '4.00', 'Avocado (ind)')
-- ('itm002', '6.00', 'Apple Bag')
-- ('itm003', '0.50', 'Lemons (ind)')
-- ('itm004', '2.00', 'Banana (lb)')
-- ('itm005', '6.00', 'Broccoli (head)')