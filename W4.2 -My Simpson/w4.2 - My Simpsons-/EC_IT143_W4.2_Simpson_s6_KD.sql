/*********************************************************************
STEP 6 — Load the table from the view
*********************************************************************/
TRUNCATE TABLE tbl_total_simpson_members;

INSERT INTO tbl_total_simpson_members (TotalSimpsonMembers)
SELECT TotalSimpsonMembers
FROM vw_total_simpson_members;