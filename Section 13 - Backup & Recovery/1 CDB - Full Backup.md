# CDB - Backup and Recovery

## Backup

1. Make sure that DB is up and running

2. Login to RMAN

        rman target=/

3. In order to see any available backup, do this

        list backup of database;

4. To list the any archived logs files, do this
        
        list archivelog all;

note: if you did not find any files this mean no redo logs switch happened, the redo logs still no filled yet.

5. Now we will do this command

        backup database plus archivelog;

6. Make sure from the backup

        list backup of database;

note: the backup contains backup sets 
each set contains pieces 

7. Use this to list the control file
    
        list backup of controlfile;

8. Use this to list the spfile
    
        list backup of spfile;

9. Let us do some transactions in pluggable database orclpdb
Then we restore that backup : )

## Restore the backup

10. Restore the backup

        RUN
        {
        SHUTDOWN IMMEDIATE; 
        STARTUP MOUNT;
        RESTORE DATABASE;
        RECOVER DATABASE;
        ALTER DATABASE OPEN;
        }


11. Make sure that all changes that you did has been restored
Yes: this mean the restoring will get the archived log that has been generated after the backup time.
