# DEMOS

### Backup Control File to Trace Files

1. Set Environment

2. Login as SYSDBA

3. Create readable version of Control File

        ALTER DATABASE BACKUP controlfile TO trace;

4. See this in alert log, which is in trace directory
        
        $ cd ORACLE_BASE/diag/rdbms/orcl/ORCL/trace
        $ tail alert_ORCL.log

5. View the trace file from locating got using alert log


### Syntax and Clauses in RMAN Backup

1. Connect to RMAN as sysbackup

        $ rman target "'/ as sysdba'"

2. View objects

        RMAN> REPORT SCHEMA

3. Simple Backup

        RMAN> BACKUP DATABASE;

4. Backup particular PDB

        RMAN> BACKUP PLUGGABLE DATABASE PDB1;

5. Backup pieces of DB in Container System (tablespace example)

        RMAN> BACKUP TABLESPACE PDB1:{tablespace_name}

6. Physicall define backupset

        RMAN> BACKUP AS BACKUPSET DATABASE;


### Creating Image Copies for Backups

1. Login to RMAN as SYSBACKUP user

2. Report Schema

3. Backup as copy

        RMAN> BACKUP AS COPY DATAFILE '{path of datafile}';

4. Backup all 

        RMAN> BACKUP AS COPY ARCHIVELOG LIKE '%arc%';


### Creating a Whole Backups Container or Noncontainer DB System

1. Connect RMAN as SYSBACKUP

2. RMAN> BACKUP DATABASE PLUS ARCHIVELOG;

### Create Partial PDB Backups

1. Connect RMAN as SYSBACKUP

2. Report Schema

3. Backup from single PDB

        BACKUP TABLESPACE {tablespace_name};

4. Backup Tablespace from multiple PDB

        BACKUP TABLESPACE {tab1} {tab2};


### Maintaining Block Change Tracking File

1. Set Environment

2. Login as SYSDBA

3. ALTER SYSTEM SET DB_CREATE_FILE_DEST = '/u01/app/oracle/oradata/ORCL';

4. ALTER DATABASE ENABLE BLOCK CHANGE TRACKING USING FILE '/home/oracle/ctf.dbf';

5. To disable

        ALTER DATABASE DISABLE BLOCK CHANGE TRACKING;