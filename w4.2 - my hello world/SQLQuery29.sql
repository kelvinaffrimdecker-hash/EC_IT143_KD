/*
File: EC_IT143_W4.2_hello_world_s8_xx.sql
Purpose: Step 8 - Execute the stored procedure
Author: [Your Name]
Date: [Current Date]
*/
USE EC_IT143_DA;
GO

-- Execute the stored procedure
EXEC usp_LoadTeamPlayerCount;

-- Show results
SELECT * FROM tbl_TeamPlayerCount;