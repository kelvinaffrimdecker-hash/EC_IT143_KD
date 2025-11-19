-- Step 4: Turn the ad hoc SQL query into a view
CREATE VIEW vw_total_customers AS
SELECT COUNT(*) AS TotalCustomers
FROM Customers;
