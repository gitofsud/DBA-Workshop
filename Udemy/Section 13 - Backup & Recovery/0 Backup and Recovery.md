# Backup and Recovery Concepts

## DBA Responsibilites

### 1. Protect the database from failure wherever possible

### 2. Increase mean time between failures (MTBF)

* Ensures hardware is reliable
* Operating system maintenance
* Advanced configuration options (RAK & Oracle DataGuard)

### 3. Protect critical components by using rendundancy

### 4. Decrease mean time to recover (MTTR)

* Practicing recovery procedures in advance
* Configuring so that they are readily available when needed

### 5. Minimize the loss of data

* Archive Log Files
* Flashback technology

## Recovery

* Complete
* Incomplete

### Redo Logs and Archived Redo Logs

* **Oracle Redo Logs** - contain a log all transactions applied to Oracle database. Every single insert, delete or update statement is recorded in the redo logs.

* **Oracle Database** - requires at least two Redo Log Files at any given time, as it writes to them in a cyclic manner.

* **Database Writes** - to first Redo Log File, and once that Redo Log File is filled up, the database will start writing to the second Redo Log File. This is called a **Redo Log Switch**.

* **Archiver Process** - is responsible to copy Oracle redo log files to remote storage device after redo log switch has occurred.

### Redo Log Groups

Redo Log Groups allow us to store copy of each Redo Log in more than one location. They are critical to function of DB.

It is called **multiplexing the Redo Logs**.

Each file in Redo Log group is called a member. If we multiplex our Oracle Redo Logs and use Redo Log groups, the Oracle log writer background process will write to a group and all of its members at same time, instead of just writing to individual Redo Log.


### Point-in-time Recovery

To perform point-in-time recovery using combination of **database backups** and **database archived read logs**, there are prerequisites:

1. Oracle Database should be set to ARCHIVELOG mode.

        ARCHIVE LOG LIST;

2. Need to have a DB backup

3. Need to have all archived read logs DB generated


## Oracle Backup Technologies

1. User-managed hot backups
    - DBA takes periodic backups of DB data files and review logs using OS commands.

2. Oracle Recovery Manager (RMAN)
    - is a command line utility that can take DB backup, manage them as well as perform DB recovery.

3. Data Pump
    - DB export-import utility. (It creates logical exports of DB)

4. Flashback
    - Used as quick way to recover from human errors. Not suited for recovering from media or disk failure, as it won't work if DB is offline.


### Enable ARCHIVELOG mode

* When Archive mode is enabled, Oracle turns each active redo log file into an archived redo log file when it finishes writing to it.

* Archive mode is essential for running online or hot backups in Oracle, as well as for enabling Oracle's Flashback Database technologies.

* Process
    - Connect sys as sysdba
    - Make sure you are in the root
    - Run: ARCHIVE LOG LIST;
        - If option is enabled, its great
        - If disabled, then

                shutdown immediate;
                startup mount;
                alter database archivelog;
                alter database open;
                alter pluggable database all open;


### Configuring Fast Recovery Area

* The fast recovery area that provides centralized storage for backup and recovery files.

* It is an Oracle managed directory file system, or Oracle automatic storage management disk group.

* It is usually used to store Oracle archived redo logs, the database flashback change logs and RMAN backup sets

* Two parameters control fast recovery area
    - db_recovery_file_dest
        
            alter system set DB_RECOVERY_FILE_DEST='/u01/data'

    - db_recovery_file_dest_size
            
            alter system set DB_RECOVER_FILE_DEST_SIZE=20G;

* To see DB_RECOVERY

        show parameter db_rec

### Dropping Pluggable Databases

        show pdbs;
        drop pluggable database <pdb-name> including datafiles;

        # If database is open, close it
        alter pluggable database all close;