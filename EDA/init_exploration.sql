/*===================================================================
Initial Exploration
-- Explore all the database objects like the tables, schemas, columns
=====================================================================*/

-- Explore all objects in the DB
SELECT * FROM INFORMATION_SCHEMA.TABLES;

-- Explore all columns in the DB
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_customers';
