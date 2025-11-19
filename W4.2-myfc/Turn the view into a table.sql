-- Step 5.1: Create a table from the view
SELECT *
INTO tbl_total_customers
FROM vw_total_customers;

-- Step 5.2: Refine the table architecture
DROP TABLE IF EXISTS tbl_total_customers;

CREATE TABLE tbl_total_customers (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    TotalCustomers INT NOT NULL
);
