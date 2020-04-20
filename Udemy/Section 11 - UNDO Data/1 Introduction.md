# UNDO Data

* The Oracle DB server saves the old value (undo data) when a process changes data in a DB
* It stores the data as it exists before modifications
* Retained at least until the transaction is ended

### Usage 

* Rollback operations
* Read-consistent queries
* Oracle Flashback Query, Oracle Flashback Transaction, Oracle Flashback Table
* Recovery from failed transactions

### How transaction ends?

* User undoes a transaction (transaction rolls back)
* User ends a transaction (transaction commit)
* User executes a DDL statement, such as CREATE, DROP, RENAME or ALTER statement
* Session terminates abnormally (transaction rolls back)
* User session terminates normally with an exit (transaction commits)



## Transactions and Undo Data

* Each transaction is assigned to only one undo segment
* An undo segment can service more than one transaction at a time
* When a transaction starts, it is assigned to undo segment
    - Throughout life of transaction, when data is changed, original values are copied to undo segement
    - V$TRANSACTION - view to check which transactions are assigned to which undo segment
* Undo segments are specialized segments that are automatically created by DB server as needed to support transactions
* Undo information is stored in **undo segments** which are stored in **undo tablespace**
* You cannot create other segment types, such as tables, in the undo tablespace

### Information

* Undo segments are automatically created and always owned by SYS. Because undo segments act as circular buffer, each segment has a minimum of two extents.
* Undo tablespaces are permanent, locally managed tablespaces with automatic extent allocation. They are automatically managed by DB.
* Because undo data is required to recover from failed transactions, undo tablespaces can be recovered only while instance is in MOUNT state.


## Comparison - UNDO vs REDO

* UNDO DATA
    - Usage  : Rollback, read consistency, flashback
    - Stored : Undo segments

* Redo
    - Usage  : Rolling forward of DB changes
    - Stored : Redo Log files