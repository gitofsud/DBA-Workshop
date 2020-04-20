# Background Processes

These are bunch of dedicated server-side processes running in background

* Database Writer (DBWn)
    - responsible for writing contents of DB buffers to data files on disk

* Log Writer (LGWR)
    - responsible for writing redo records from redo log bufferin memory into a physical disk

* Checkpoint Process (CKPT)
    - It handles database checkpoints
    - It syncs data blocks in memory from buffer to data files

* System Monitor (SMON)
    - Performs recovery during startup sequence of Oracle Instance if required
    - Responsible for cleaning up unused temporary segments

* Process Monitor (PMON)
    - Performs process recovery when user process or session fails
    - Responsible for cleaning up changes made to blocks in DB buffer cache and release resource used by previous failed user session.

* Recover Process (RECO)
    - Used as part of distributed database transactions
    - **Distributed transactions** are transactions that involve multiple DB, and should either commit a rollback on both DB at once

* Listener registration process (LREG)
    - It is responsible for registering the Oracle instance with Oracle network listener
    - The listener accepting remote incoming user connections

* Arciver Process (ARCn)
    - It is responsible to copy Oracle redo log files to remote storage device after a redo log switch has ocurred.