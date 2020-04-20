# Modes

## NOMOUNT

* Instance is started, but not yet associated with DB.

    - Search for spfile, pfile
    - Read parameter file
    - Allocate SGA
    - Start BG process
    - Open alert and trach file

## MOUNT

* Instance is started, associated with DB by reading it's **control file**.

* The DB is closed to users and no availabe for normal operations

## OPEN

* Instance is started, associated with DB with it open. 

* Data contained in data files is accessible to authorized users.

* Opens data files, acquires UNDO tablespace, opens online REDO log files.



## Admin Privileges

* SYSDBA & SYSOPER are required to perform operations such as creating, starting, shutting, backing up or recovering the DB.

* SYSDBA - fully empowered but SYSOPER allows these tasks but without ability to look at user data.