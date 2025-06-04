EXEC sys.sp_cdc_enable_db

Select is_CDC_enabled from MASTER.SYS.Databases
where name = 'AutoTest'