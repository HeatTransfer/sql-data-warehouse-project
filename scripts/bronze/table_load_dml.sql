CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time_overall DATETIME, @end_time_overall DATETIME, @start_time DATETIME, @end_time DATETIME;
	BEGIN TRY
		SET @start_time_overall = GETDATE();
		PRINT '=====================================================';
		PRINT 'Loading Bronze Layer';
		PRINT '=====================================================';

		PRINT '-----------------------------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '-----------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: [bronze].[crm_cust_info]';
		TRUNCATE TABLE [bronze].[crm_cust_info];
		BULK INSERT [bronze].[crm_cust_info]
		FROM 'C:\Users\shrey\Desktop\DataEngineeringMasterClass\Data Warehouse Project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Loading Completed in ' + CAST(DATEDIFF(millisecond, @start_time, @end_time) AS NVARCHAR) + ' ms';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: [bronze].[crm_prd_info]';
		TRUNCATE TABLE [bronze].[crm_prd_info];
		BULK INSERT [bronze].[crm_prd_info]
		FROM 'C:\Users\shrey\Desktop\DataEngineeringMasterClass\Data Warehouse Project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Loading Completed in ' + CAST(DATEDIFF(millisecond, @start_time, @end_time) AS NVARCHAR) + ' ms';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: [bronze].[crm_sales_details]';
		TRUNCATE TABLE [bronze].[crm_sales_details];
		BULK INSERT [bronze].[crm_sales_details]
		FROM 'C:\Users\shrey\Desktop\DataEngineeringMasterClass\Data Warehouse Project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Loading Completed in ' + CAST(DATEDIFF(millisecond, @start_time, @end_time) AS NVARCHAR) + ' ms';

		PRINT '-----------------------------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '-----------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: [bronze].[erp_cust_az12]';
		TRUNCATE TABLE [bronze].[erp_cust_az12];
		BULK INSERT [bronze].[erp_cust_az12]
		FROM 'C:\Users\shrey\Desktop\DataEngineeringMasterClass\Data Warehouse Project\datasets\source_erp\cust_az12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Loading Completed in ' + CAST(DATEDIFF(millisecond, @start_time, @end_time) AS NVARCHAR) + ' ms';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: [bronze].[erp_loc_a101]';
		TRUNCATE TABLE [bronze].[erp_loc_a101];
		BULK INSERT [bronze].[erp_loc_a101]
		FROM 'C:\Users\shrey\Desktop\DataEngineeringMasterClass\Data Warehouse Project\datasets\source_erp\loc_a101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Loading Completed in ' + CAST(DATEDIFF(millisecond, @start_time, @end_time) AS NVARCHAR) + ' ms';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: [bronze].[erp_px_cat_g1v2]';
		TRUNCATE TABLE [bronze].[erp_px_cat_g1v2];
		BULK INSERT [bronze].[erp_px_cat_g1v2]
		FROM 'C:\Users\shrey\Desktop\DataEngineeringMasterClass\Data Warehouse Project\datasets\source_erp\px_cat_g1v2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Loading Completed in ' + CAST(DATEDIFF(millisecond, @start_time, @end_time) AS NVARCHAR) + ' ms';

		SET @end_time_overall = GETDATE();

		PRINT '=====================================================';
		PRINT 'Loading Bronze Layer Completed Successfully!';
		PRINT 'Loading Completed in ' + CAST(DATEDIFF(millisecond, @start_time_overall, @end_time_overall) AS NVARCHAR) + ' ms';
		PRINT '=====================================================';
	END TRY

	BEGIN CATCH
		PRINT '=====================================================';
		PRINT 'ERROR OCCURRED DURING LOADING BRONZE LAYER';
		PRINT 'Error Message:' + ERROR_MESSAGE();
		PRINT 'Error Message:' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message:' + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT '=====================================================';
	END CATCH
END

EXEC bronze.load_bronze;
