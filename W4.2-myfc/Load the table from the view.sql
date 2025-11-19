-- Step 6: Load the table from the view
TRUNCATE TABLE tbl_total_customers;

INSERT INTO tbl_total_customers (TotalCustomers)
SELECT TotalCustomers
FROM vw_total_customers;