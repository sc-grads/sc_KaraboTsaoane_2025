Declare @execution_id bigint
EXEC [SSISDB].[catalog].[create_execution] @package_name=N'01_ExportToFlatFileDemo.dtsx', @execution_id=@execution_id OUTPUT, @folder_name=N'MySSISDemos', @project_name=N'DataFlowTraining', @use32bitruntime=False, @reference_id=Null, @runinscaleout=False
Select @execution_id
DECLARE @var0 smallint = 1
EXEC [SSISDB].[catalog].[set_execution_parameter_value] @execution_id,  @object_type=50, @parameter_name=N'LOGGING_LEVEL', @parameter_value=@var0
EXEC [SSISDB].[catalog].[start_execution] @execution_id
GO


