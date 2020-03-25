# Automatic UNDO Management

* Oracle provides a fully automated mechanism for managing undo information and space

* The DB manages undo segments in an undo tablespace

* Automatic undo management is default mode for newly installed DB

* When DB instance starts, the DB selects first available UNDO tablespace
    - If UNDO tablespace is unavailable, Oracle will use SYSTEM which is not reommended


## UNDO Retention Period

* Minimum amount of time that Oracle DB attempts to retain old undo information before overwriting it

* After transaction is commited, undo data is no longer needed for rollback or transaction recovery purposes.
    - However, for consistent read purposes, long-running queries may require this old undo information for producing older images of data blocks
    - Success of several Oracle Flashback features depend on availability of older undo information

* Default - 900s i.e. 15 minutes


## Categories of UNDO

* **ACTIVE**
    - Uncommited undo information
    - Required if a user wants to rollback or if transaction has failed
    - Uncommited undo information is never overwritten

* **UNEXPIRED**
    - Commited undo information
    - Old undo information with an age that is less than the current undo retention period
    - Retained for consistent read and Oracle Flashback operations

* **EXPIRED**
    - Expired undo information
    - Old undo information that is older than current undo retention period is said to be *expired* and its space is availabe to be overwritten by new transactions


### Automatic Tuning of UNDO Retention

* Oracle DB automaticall tunes the undo retention period based on how undo tablespace is configured