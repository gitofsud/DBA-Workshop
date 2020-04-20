# Backup and Recovery

## Configuring for Recoverability

1. Scheduling regular backups
2. Multiplexing control files
3. Multiplexing redo log groups
4. Retaining archived copies of redo logs

### Configure Control File

1. View Control Files

        SQL> SELECT name FROM v$controlfile;

2. To create another control file, we need to shutdown DB first. We use immediate to shut it down in a consistent mode

        SQL> SHUTDOWN IMMEDIATE;

3. Exit from SQL

4. Copy one control file from the above query to another location

5. To let Oracle DB to use that other control file, we have to edit pfile i.e. initORCL.ora.
    
    * Find control files line, and append the path of new control file to the end

6. Login to SQLPLUS / AS SYSDBA, so that it uses the new pfile

        SQL> CREATE spfile FROM pfile

8. DO ls-l to check for timestamp if it's updated or not

9. Startup the database

10. View control files to validate it again.


### Configure Fast Recovery Area

1. Login as SYSDBA

2. Look at settings of recovery destination and size

        SQL> SHOW PARAMETER db_recovery_file_dest;

3. Change size accordingly

        SQL> ALTER SYSTEM SET db_recovery_file_dest_size = 30G scope=both;

4. Look at settings again


### Add Redo file to Redo Group Demo

1. Login as SYSDBA

2. Take a log at redo logs

        SQL> SELECT group#, status, member FROM v$logfile;

3. Find status of the groups

        SQL> SELECT group#, members, archived FROM v$log;

3. Add log for one or for all groups

        SQL> ALTER DATABASE ADD LOGFILE MEMBER '{group_path with new file}' TO GROUP 1;

4. Run same queries to view again

5. If they are invalid, to make them valid, we have to perform log switches the times there are number of groups

        SQL> ALTER SYSTEM SWITCH LOGFILE;


### Enable ARCHIVELOG Mode

1. Login as SYSDBA

2. Issue log list command

        SQL> ARCHIVE LOG LIST;

3. If not in log mode, we need DB to be in mount state. So shutdown and open in mount mode.

        SQL> SHUTDOWN IMMEDIATE;
        SQL> STARTUP MOUNT;
        SQL> ALTER DATABASE ARCHIVELOG;
        SQL> ALTER DATABASE OPEN;

4. Issue log list command again to check



## Using Recovery Manager


### Connection RMAN and Target DB

1. Make sure environment is set for DB

        . oraenv

2. Connect using RMAN

        rman target "/ as sysbackup'"

3. Backup

        backup database;

4. Plus Archivelog

        backup database plus archivelog;

5. Delete backup not in retention period

        delete obsolete;

6. Exit


### SQL and RMAN

        RMAN> SELECT name, dbid, log_mode FROM v$database;
        RMAN> exit

### Manage setting

1. View all config

        RMAN> show all;
        
2. Show one config

        RMAN> show controlfile autobackup format;

3. Delete config

        RMAN> configure backup optimization clear;