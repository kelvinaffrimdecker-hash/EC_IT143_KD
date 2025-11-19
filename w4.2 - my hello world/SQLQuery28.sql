/*
File: EC_IT143_W4.2_hello_world_s7_simple_xx.sql
Purpose: Step 7 - Simple stored procedure to load player count
Author: [Kelvin Decker]
Date: [11/18/2025]

Stored Procedure: usp_LoadTeamPlayerCount
Description: Clears and reloads the player count table
*/


CREATE OR ALTER PROCEDURE usp_LoadTeamPlayerCount
AS
BEGIN
    -- Clear the table
    TRUNCATE TABLE tbl_TeamPlayerCount;
    
    -- Insert data from view
    INSERT INTO tbl_TeamPlayerCount (
        TotalPlayers,
        CountDate
    )
    SELECT 
        TotalPlayers,
        CountDate
    FROM vw_TeamPlayerCount;
    
    PRINT 'Player count loaded successfully';
END;
GO