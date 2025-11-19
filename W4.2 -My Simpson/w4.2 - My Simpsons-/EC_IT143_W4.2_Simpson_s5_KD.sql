/*********************************************************************
STEP 5.1 — Turn the view into a table (SELECT INTO)
*********************************************************************/
SELECT *
INTO tbl_total_simpson_members
FROM vw_total_simpson_members;


/*********************************************************************
STEP 5.2 — Refine the table architecture
*********************************************************************/
DROP TABLE IF EXISTS tbl_total_simpson_members;

CREATE TABLE tbl_total_simpson_members (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    TotalSimpsonMembers INT NOT NULL
);