# Modifying Initialization Parameters

* Modify parameters to set capacity limits or improve performance.
    * Use EM Express or SQL*Plus (ALTER SESSION or ALTER SYSTEM)

* Query the V$PARAMETER view for all particular initialization parameter to learn whether you make:
    * Session-level changes (ISESS_MODIFIABLE column)
    * System-level changes (ISSYS_MODIFIABLE column)
    * PDB-level changes (ISPDB_MODIFIABLE column)

* Use SCOPE clause with ALTER SYSTEM command to tell system where to update the system-level parameter

    * **MEMORY** - Indicates that the change is made in memory, takes effect immediately.
    * **SPFILE** - Indicates that the change is made in server parameter file. The new setting takes effect when the database is next shut down and started up again
    * **BOTH** - Indicates that the change is made in memory and in server parameter file (this is default)
    * **DEFERRED** - Effective for future sessions