-- 	   1. You must create a list in Excel of all dates from 7/1/2019 to 12/31/2019, 
--     in order to create the INSERT statement. Comment below with a description of what EXCEL
--     functions you used to create the data, copy-pasting the entire functions including the = sign

-- 	Entered dates 2019-07-03 in cell A1 and 2019-12-31 in cell A2.
-- 	Entered this formula in cell B1: =A1 + 1
-- 	Entered this formula in cell B2: =IF(B1 + 1 < $A$2, B1 + 1, "")
-- 	Autofilled formula in B2 down to cells B2 to B182.
-- 	Created mask with this formula in cell C1: =TEXT(B1,"('YYYY-MM-DD'),")
-- 	Autofilled formula in C2 down to cells C2 to C182.
