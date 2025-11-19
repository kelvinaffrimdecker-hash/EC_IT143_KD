/*
File: EC_IT143_W4.2_hello_world_s6_xx.sql
Purpose: Step 6 - Load table from view using TRUNCATE and INSERT
Author: [Your Name]
Date: [Current Date]

Loads data from vw_TeamPlayerCount into tbl_TeamPlayerCount
*/
USE [MyFC];
GO

TRUNCATE TABLE tbl_TeamPlayerCount;

INSERT INTO tbl_TeamPlayerCount (
    TotalPlayers,
    CountDate
)
SELECT 
    TotalPlayers,
    CountDate
FROM vw_TeamPlayerCount;

-- Verify the load
SELECT * FROM tbl_TeamPlayerCount;