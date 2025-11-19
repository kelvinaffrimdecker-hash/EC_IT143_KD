/*********************************************************************
STEP 7 — Turn the loading script into a stored procedure
*********************************************************************/
CREATE OR ALTER PROCEDURE load_total_simpson_members
AS
BEGIN
    TRUNCATE TABLE tbl_total_simpson_members;

    INSERT INTO tbl_total_simpson_members (TotalSimpsonMembers)
    SELECT TotalSimpsonMembers
    FROM vw_total_simpson_members;
END;