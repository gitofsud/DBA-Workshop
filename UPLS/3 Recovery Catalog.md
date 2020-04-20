# Recovery Catalog

## Comparison

* Control File
    - Simpler administration
    - Default

* Recovery Catalog
    - Replicates control file data
    - Stores more backup history
    - Services many targets
    - Stores RMAN scripts
    - Provides more protection options for metadata


## Creating a Recovery Catalog

### Configure a Recovery Catalog

1. Login as SYSDBA

2. Create tablespace in recovery catalog database

        SQL> CREATE TABLESPACE rcatbs DATAFILE '{path}.dbf' SIZE 15M REUSE;

### Create Owner

CREATE USER rcatowner IDENTIFIED BY oracle_4U TEMPORARY TABLESPACE TEMP DEFAULT TABLESPACE RCATBS QUOTA UNLIMITED ON rcatbs;

GRANT recovery_catalog_owner TO rcatowner;

### Create Catalog

1. Open RMAN

2. Connect to catalog

        RMAN> CONNECT CATALOG rcatowner/oracle_4U@rcat

3. Create catalog

        RMAN> CREATE CATALOG;



## Managing Target DB Records

### Register DB in Recovery Catalog

1. From the instance where DB is located, run rman target and send it to "catalog" - name created above and provide user and pass of catalog owner - It will connect to target DB and recovery catalog DB at same time

        rman target / catalog rcatowner/oracle_4U@rcat

2. Register DB

        register database;

3. After resync is completed, exit.

### Manually Resynchronization Recovery Catalog

1. From the instance where DB is located, run rman target and send it to "catalog" - name created above and provide user and pass of catalog owner - It will connect to target DB and recovery catalog DB at same time

        rman target / catalog rcatowner/oracle_4U@rcat

2. Resync

        resync catalog;