USE da_bootcamp_zapatarivera;
DROP TABLE IF EXISTS sales_orders;

-- 1. Create table sales_orders with 5 columns: 
-- 		   a. record_id, a Big Integer Primary Key that auto-increments with each new record added.
--         b. order_no, another Big Integer that cannot be NULL
--         c. order_date, DATE
--         d. item_id, formatted to match item_details.item_id from PROBLEM 2.
--         e. quantity, Big Integer
CREATE TABLE sales_orders (
    record_id BIGINT AUTO_INCREMENT NOT NULL,
    order_no BIGINT NOT NULL,
    order_date DATE,
    item_id VARCHAR(10) NOT NULL, -- foreign key
    quantity BIGINT,
    PRIMARY KEY (record_id)
);

-- 2. Load sales_orders with the raw data provided in pg2. You may write and leave the entire INSERT statement there.
-- For answer to Step 2, please refer to file 'problem3_seeder.sql'
-- Insert statement is as follows: 
-- TRUNCATE TABLE sales_orders;
-- INSERT INTO sales_orders (order_no, order_date, item_id, quantity) VALUES 
-- Values in file 'problem3_seeder.sql'
-- ;

-- Setting foreign_key_checks to false and setting foreign key
SET FOREIGN_KEY_CHECKS = 0;
ALTER TABLE sales_orders
ADD CONSTRAINT item_id 
FOREIGN KEY (item_id) 
REFERENCES item_details(item_id);
SET FOREIGN_KEY_CHECKS = 1;

-- 3. What is the total number of records in sales_orders? 
-- RESULT: 831
SELECT COUNT(*) FROM sales_orders;

-- 4. What is the total number of records of sales_orders INNER JOIN item_details? LEFT JOIN?
-- RESULT (INNER JOIN) : 828
-- RESULT (LEFT JOIN) : 831
SELECT COUNT(*) FROM sales_orders AS so
	INNER JOIN item_details AS id 
    ON so.item_id = id.item_id;

SELECT COUNT(*) FROM sales_orders AS so
	LEFT JOIN item_details AS id 
    ON so.item_id = id.item_id;

-- 5. Return the order_no, order_date, and the order_total for the top 10 orders in August in descending order.
SELECT order_no, order_date, (quantity * item_price) AS order_total FROM sales_orders AS orders
	LEFT JOIN item_details AS details 
    ON orders.item_id = details.item_id
    WHERE MONTH(order_date) = 8 
    ORDER BY order_total DESC
    LIMIT 10
    ;

-- 6. Return the order_no, order_date, and the total quantity for orders HAVING a total quantity greater than 10.
SELECT order_no, order_date, quantity FROM sales_orders AS orders
	JOIN item_details AS details
    ON orders.item_id = details.item_id
    HAVING orders.quantity > 10;

-- 7. Create stored procedure "total_sales_on_date" that returns total sales (in $) given a date.
DELIMITER //
CREATE PROCEDURE total_sales_on_date() 
BEGIN
	SELECT order_date, CONCAT('$ ', quantity * item_price) AS total_sales_on_date
	FROM sales_orders AS orders
	JOIN item_details AS details
	ON orders.item_id = details.item_id
	GROUP BY order_date
    ;
END //
DELIMITER ;
CALL total_sales_on_date;