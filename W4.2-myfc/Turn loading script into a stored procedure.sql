-- Step 7: Create stored procedure to load the table
CREATE OR ALTER PROCEDURE load_total_customers
AS
BEGIN
    TRUNCATE TABLE tbl_total_customers;

    INSERT INTO tbl_total_customers (TotalCustomers)
    SELECT TotalCustomers
    FROM vw_total_customers;
END;
