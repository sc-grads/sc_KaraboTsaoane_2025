param (
  [string]$SqlServer,
  [string]$Username,
  [string]$Password
)

$jobs = @(
  @{ Name = "Client"; PackagePath = "\SSISDB\MyPackageDemos\TimeSheet\ExtractClientNames2.dtsx" },
  @{ Name = "Employee";  PackagePath = "\SSISDB\MyPackageDemos\TimeSheet\ExtractEmployeeNames2.dtsx" },
  @{ Name = "Leave";    PackagePath = "\SSISDB\MyPackageDemos\TimeSheet\ExtractLeave2.dtsx" },
  @{ Name = "Timesheet";     PackagePath = "\SSISDB\MyPackageDemos\TimeSheet\ExtractTimesheet2.dtsx" }
)

foreach ($job in $jobs) {
  $sql = @"
IF NOT EXISTS (SELECT 1 FROM msdb.dbo.sysjobs WHERE name = N'$($job.Name)')
BEGIN
    EXEC msdb.dbo.sp_add_job @job_name = N'$($job.Name)';
    
    EXEC msdb.dbo.sp_add_jobstep
        @job_name = N'$($job.Name)',
        @step_name = N'Run SSIS Package',
        @subsystem = N'SSIS',
        @command = N'/ISSERVER "$($job.PackagePath)" /SERVER "$SqlServer"',
        @on_success_action = 1,
        @on_fail_action = 2;

    EXEC msdb.dbo.sp_add_schedule
        @schedule_name = N'RunEveryDayMidnight_$($job.Name)',
        @freq_type = 4,
        @freq_interval = 1,
        @active_start_time = 000000;

    EXEC msdb.dbo.sp_attach_schedule
        @job_name = N'$($job.Name)',
        @schedule_name = N'RunEveryDayMidnight_$($job.Name)';

    EXEC msdb.dbo.sp_add_jobserver @job_name = N'$($job.Name)';
END
"@

  Invoke-Sqlcmd -ServerInstance $SqlServer -Username $Username -Password $Password -Query $sql
}