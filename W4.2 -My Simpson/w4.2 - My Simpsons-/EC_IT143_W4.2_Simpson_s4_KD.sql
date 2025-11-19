/*********************************************************************
STEP 4 — Turn the ad hoc SQL query into a view
*********************************************************************/
CREATE VIEW vw_total_simpson_members AS
SELECT COUNT(*) AS TotalSimpsonMembers
FROM [dbo].[Family_Data];