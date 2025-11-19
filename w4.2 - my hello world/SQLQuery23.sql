/*
File: EC_IT143_W4.2_hello_world_s3_xx.sql
Purpose: Step 3 - Ad hoc query to count total players
Author: [Your Name]
Date: [Current Date]

This query counts the total number of players in the team
Based on the database structure, we'll need to identify the correct table
*/
USE [MyFC]
GO

-- First, let's explore what tables are available
SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE';

-- Based on the table exploration, we'll count players
-- Assuming we have a Players table or similar
SELECT COUNT(*) AS TotalPlayers
FROM [dbo].[tblPlayerDim];