# Local vs Shared Undo Mode

* Two UNDO modes:
    - SHARED : One shared UNDO in CDB root for all PDB
    - LOCAL  : Each PDB has its own UNDO

* There is only one shared UNDO tablespace (in CDB root)
* There can be local UNDO tablespace in PDB

* Properties

        LOCAL_UNDO_ENABLED=true

* When is local UNDO mode required?

    - Hot cloning
    - Near-zero downtime PDB relocation

            STARTUP UPGRADE;
            ALTER DATABASE LOCAL UNDO ON;

* When DB contains some uncommited transactions and LOCAL_UNDO_ENABLED=
    - **TRUE**
        * No errors in clone
        * PDBNew will be same as PDBOld
        * Uncommited transactions will not be cloned
    - **FALSE**
        * Clone will fail and give error ORA-65035