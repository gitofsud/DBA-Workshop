# Backup Strategies

## Creating DB Backups

### Using RMAN Commands to Create Backups

        $ rman target /
        RMAN> CONFIGURE _
        RMAN> BACKUP DATABASE PLUS ARCHIVELOG;

### Syntax and Clauses in RMAN

* Set environment and connect

        $ export ORACLE_SID=cdb1
        $ rman TARGET /

* DATABASE keyword operates on all PDBs and CDB root or on only one PDB

        RMAN> BACKUP DATABASE;
        RMAN> RECOVER DATABASE;

* PLUGGABLE DATABASE keywords operate on individual PDBs

        RMAN> BACKUP PLUGGABLE DATABASE hr_pdb, sales_pdb;
        RMAN> RECOVER PLUGGABLE DATABASE hr_pdb;

* CDB Root

        RMAN> BACKUP PLUGGABLE DATABASE 'CSB$ROOT';

* Qualify tablespace of PDB with PDB name

        RMAN> BACKUP TABLESPACE sales_pdb:tbs2;
        RMAN> BACKUP TABLESPACE system;


### Creating Backup Sets

        RMAN> BACKUP AS BACKUPSET
                2> FORMAT '/BACKUP/df_.bus'
                3> TABLESPACE hr_data;

### Creating Image Copies

        RMAN> BACKUP AS COPY DATAFILE '/ORADATA/users_.dbf';
        RMAN> BACKUP AS COPY ARCHIVELOG LIKE '/arch%';

### Whole DB Backup

* Will get Control file and SPFILE too

        RMAN> BACKUP DATABASE PLUS ARCHIVELOG;

### CDB Backup: Whole CDB Backup

* Backup all PDBs datafiles and CDB backup file

        $ rman target /
        RMAN> BACKUP DATABASE PLUS ARCHIVELOG;

### CDB Backup: Partial

* Backup CDB root /orand individual PDB

        $ rman target /
        RMAN> BACKUP PLUGGABLE DATABASE "CDB$ROOT", sales_pdb;
        RMAN> BACKUP PLUGGABLE DATABASE hr_pdb PLUS ARCHIVELOG;

        $ rman TARGET sys@hr_pdb
        RMAN> BACKUP DATABASE;

### PDB Backup: Partial

        $ rman TARGET /
        RMAN> REPORT SCHEMA;
        RMAN> BACKUP TABLESPACE sales_pdb:tbs2;