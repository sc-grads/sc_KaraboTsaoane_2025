CREATE TABLE SQLBackupRestoreTest(
ID INT NOT NULL,
loginname VARCHAR(100) NOT NULL ,
logindate DATETIME NOT NULL DEFAULT getdate()
)
GO
select * from SQLBackupRestoreTest

insert into SQLBackupRestoreTest (ID ,loginname ) values (1 , 'test1')
insert into SQLBackupRestoreTest (ID ,loginname ) values (2 , 'test2')
insert into SQLBackupRestoreTest (ID ,loginname ) values (3 , 'test3')
insert into SQLBackupRestoreTest (ID ,loginname ) values (4 , 'test4')
insert into SQLBackupRestoreTest (ID ,loginname ) values (5 , 'test5')

--full back up 5rows

insert into SQLBackupRestoreTest (ID ,loginname ) values (6 , 'test6')
insert into SQLBackupRestoreTest (ID ,loginname ) values (7 , 'test7')
insert into SQLBackupRestoreTest (ID ,loginname ) values (8 , 'test8')
insert into SQLBackupRestoreTest (ID ,loginname ) values (9 , 'test9')
insert into SQLBackupRestoreTest (ID ,loginname ) values (10 , 'test10')

-- diff back up 10 rows

insert into SQLBackupRestoreTest (ID ,loginname ) values (11 , 'test11')
insert into SQLBackupRestoreTest (ID ,loginname ) values (12 , 'test12')
insert into SQLBackupRestoreTest (ID ,loginname ) values (13 , 'test13')

--trans log _1 13 rows
insert into SQLBackupRestoreTest (ID ,loginname ) values (14 , 'test14')
insert into SQLBackupRestoreTest (ID ,loginname ) values (15 , 'test15')
insert into SQLBackupRestoreTest (ID ,loginname ) values (16 , 'test16')
insert into SQLBackupRestoreTest (ID ,loginname ) values (17 , 'test17')

--trans log _2 17 rows

insert into SQLBackupRestoreTest (ID ,loginname ) values (114 , 'test14')
--Mar 18 2025  2:45AM

--Mar 18 2025  2:47AM
insert into SQLBackupRestoreTest (ID ,loginname ) values (115 , 'test15')
--Mar 18 2025  2:48AM

--Mar 18 2025  2:49AM
insert into SQLBackupRestoreTest (ID ,loginname ) values (116 , 'test16')
insert into SQLBackupRestoreTest (ID ,loginname ) values (117 , 'test17')

print getdate()
--Mar 18 2025  2:45AM