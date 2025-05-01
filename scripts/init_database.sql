/*
============================================
Create Database and Schemas
============================================
Script Purpose:
  This script creates a new DB named 'DataWarehouse' after checking if it alreday exists. If yes, it is dropped and recreated. 
  Additionally, the script sets up three schemas within the database: bronze, sliver, gold.

WARNING:
  Running this script will drop the entire 'DataWarehouse' database if exists. All data in the DB will be permanently deleted. 
  Proceed with caution and ensure you have proper backups before running this script.
*/


USE master;
GO

-- drop and recreate the db 'DataWarehouse'
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO

-- create the database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- create schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
