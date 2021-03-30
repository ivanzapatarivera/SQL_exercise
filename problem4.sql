-- 1. You must create a list in Excel of all dates from 7/1/2019 to 12/31/2019, 
-- in order to create the INSERT statement. Comment below with a description of what EXCEL
-- functions you used to create the data, copy-pasting the entire functions including the = sign

-- 	FUNCTIONS USED
-- 		=A1 + 1
-- 		=IF(B1 + 1 < $A$2, B1 + 1, "")
-- 		=TEXT(B1,"('YYYY-MM-DD'),")

-- 	STEPS
-- 		Entered dates 2019-07-03 in cell A1 and 2019-12-31 in cell A2.
-- 		Entered =A1 + 1 in cell B1.
-- 		Entered =IF(B1 + 1 < $A$2, B1 + 1, "") in cell B2.
-- 		Autofilled function in B2 down to cells B2 to B182.
-- 		Created mask with =TEXT(B1,"('YYYY-MM-DD'),") function in cell C1.
-- 		Autofilled function in C2 down to cells C2 to C182.

use da_bootcamp_zapatarivera;

DROP TABLE IF EXISTS date_dim;
CREATE TABLE IF NOT EXISTS date_dim (
	TheDate date PRIMARY KEY,
    TheYear int,
    TheMonth int,
    TheMonthName varchar(9), 
    TheDay int,
    TheDayOfWeek int,
    TheDayOfWeekName varchar(9),
    YYYYQQ char(6)
);

UPDATE date_dim 
set 
	TheYear = YEAR(TheDate),
    TheMonth = MONTH(TheDate),
    TheMonthName = MONTHNAME(TheDate),
    TheDay = DAY(TheDate),
    TheDayOfWeek = DAYOFWEEK(TheDate),
    TheDayOfWeekName = DAYNAME(TheDate),
    YYYYQQ = CONCAT(TheYear, 'Q', quarter(TheDate))
;

SELECT * FROM date_dim;

/*** 
	INSERT into date_dim only column date_full. A few lines are provided.
	You must use Excel to generate the data. HINT: Use TEXT to convert a date value to YYYY-MM-DD, 
	then concatenate to get ('YYYY-MM-DD'), format
***/
-- INSERT INTO data_dim (The Date) VALUES
-- ('2019-07-01'),
-- ('2019-07-02'),
-- ('2019-07-03'),
-- ...
-- ('2019-12-31')
-- Query to insert records into data_dim table is avaliable in file 'problem4_seeder.sql'

-- 	3. Sales ($) for each item_description broken down by day of the week.
-- 	Columns should be: Item Description, Day of Week, Sales Total
SELECT 	item_description AS 'Item Description', 
		TheDayOfWeekName AS 'Day of Week', 
        CONCAT('$ ', SUM(quantity * item_price)) AS 'Sales Total'
	FROM item_details
    RIGHT JOIN sales_orders
		ON item_details.item_id = sales_orders.item_id
    RIGHT JOIN date_dim 
		ON sales_orders.order_date = date_dim.TheDate
        WHERE item_description <> ''
    GROUP BY item_description, TheDayOfWeekName
    ORDER BY item_description, TheDayOfWeek
	;   

-- 4. Total Quantity Sold by Product by Quarter. Columns should be: Item_ID, Quarter YYYYMM, Total Quantity
SELECT 	sales_orders.item_id AS 'Item_ID', 
		YYYYQQ AS 'Quarter YYYYMM', 
        SUM(quantity) AS 'Total Quantity'
	FROM item_details
    RIGHT JOIN sales_orders
		ON item_details.item_id = sales_orders.item_id
	RIGHT JOIN date_dim
		ON sales_orders.order_date = date_dim.TheDate
        WHERE sales_orders.item_id <> ''
	GROUP BY item_id, YYYYQQ
    ORDER BY item_id, YYYYQQ
    ;