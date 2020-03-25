# Point-in-time recovery of PDB

1.	Let us do new backup

        rman target=/
        backup database orclpdb plus archivelog;

2.	Let us do some changes in pluggable orclpdb

        select TO_CHAR(sysdate,'DD-MON-YYYY HH24:MI:SS') from dual;

3. Restore

        RUN 
        {
        ALTER PLUGGABLE DATABASE orclpdb CLOSE;
        SET UNTIL TIME "TO_DATE(' 29-JUN-2019 17:54:38','DD-MON-YYYY HH24:MI:SS')";
        RESTORE PLUGGABLE DATABASE orclpdb;
        RECOVER PLUGGABLE DATABASE orclpdb;
        ALTER PLUGGABLE DATABASE orclpdb OPEN RESETLOGS;
        }

