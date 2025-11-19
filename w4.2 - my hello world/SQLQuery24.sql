


/*
File: EC_IT143_W4.2_hello_world_s4_xx.sql
Purpose: Step 4 - Create a view for player count
Author: [Your Name]
Date: [Current Date]

View: vw_TeamPlayerCount
Description: Provides the total count of players in the team
*/
USE [MyFC];
GO

CREATE OR ALTER VIEW vw_TeamPlayerCount
AS
SELECT 
    COUNT(*) AS TotalPlayers,
    GETDATE() AS CountDate
FROM[dbo].[tblPlayerDim];
GO

-- Test the view
SELECT * FROM vw_TeamPlayerCount;