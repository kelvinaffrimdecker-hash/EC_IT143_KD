/*
File: EC_IT143_W4.2_hello_world_s5.1_xx.sql
Purpose: Step 5.1 - Create table from view using SELECT INTO
Author: [Kelvin Decker]
Date: [11/18/2025]

Table: tbl_TeamPlayerCount
Source: vw_TeamPlayerCount
*/
USE [MyFC] 
GO

SELECT 
    TotalPlayers,
    CountDate
INTO tbl_TeamPlayerCount
FROM vw_TeamPlayerCount;


/*
Table: tbl_TeamPlayerCount (refined version)
*/

-- Drop existing table
IF OBJECT_ID('tbl_TeamPlayerCount', 'U') IS NOT NULL
    DROP TABLE tbl_TeamPlayerCount;
GO

-- Create table with proper architecture
CREATE TABLE tbl_TeamPlayerCount (
    PlayerCountID INT IDENTITY(1,1) PRIMARY KEY,
    TotalPlayers INT NOT NULL,
    CountDate DATETIME NOT NULL DEFAULT GETDATE(),
    LastUpdated DATETIME NOT NULL DEFAULT GETDATE()
);
GO