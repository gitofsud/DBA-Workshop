# Point-in-time recovery of the CDB

1.	Let us do new backup

        rman target=/
        backup database plus archivelog;

2.	Let us do some changes in pluggable orclpdb

        select TO_CHAR(sysdate,'DD-MON-YYYY HH24:MI:SS') from dual;

3. Restore

        RUN 
        {
        SHUTDOWN IMMEDIATE; 
        STARTUP MOUNT;
        SET UNTIL TIME "TO_DATE(' 29-JUN-2019 14:00:26','DD-MON-YYYY HH24:MI:SS')";
        RESTORE DATABASE;
        RECOVER DATABASE;
        ALTER DATABASE OPEN RESETLOGS;
        }

