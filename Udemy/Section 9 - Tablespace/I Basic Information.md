# Basic Information

* **Tablespace** - Logical storage groups that can be used to store logical DB constructs, such as tables and indexes. Logically it stores DB files.
    * **Segment** - set of extents, one or more extents, allocated for certain logical structures inside DB (ex: table, index)
        * **Extent** - set of contiguous Oracle Data Blocks, it is much more efficient when allocating space.
            * **Oracle Data Block** - Oracle data stored in DB blocks. 1 Block = 8 K by default. It contains one or more rows.


## Tablespaces

All the following tablespaces exist in CDB as well as PDBS.

### SYSTEM tablespace

* Used for core functionality
* Stores data dictionary (belong to sys schema)
* Oracle create system tablespace automatically when DB is created
* You cannot rename or drop the SYSTEM tablespace

### SYSAUX tablespace

* It is auxillary tablespace to SYSTEM tablespace
* It reduces load on SYSTEM tablespace
* Oracle creates it automatically when DB is created
* You cannot rename or drop the SYSAUX tablespace

### TEMP tablespace

* It is used to manage space for DB sort and joining operations and for storing temporary tables.

### UNDO tablespace

* It is used to roll back, or undo changes to DB
    - Roll back transactions when a ROLLBACK statement is issued
    - Recover the DB
    - Provide read consistency

### USERS tablespace

* Stores users objects and data
* Every DB should have a tablespace for permanent user data that is assigned to users. Otherwise, user objects will be created in SYSTEM tablespace, which is not good practice.

## How Table Data is Stored

### Data Block

* If an entire row can be inserted into a single data block, then Oracle stores the row as one row piece.
* If all of a row's data cannot be inserted into a single data block or if an update to an existing row causes the row to outgrow its data block, then Oracle stores the row using multiple row pieces.
* A data block usually contains only one row piece for each row.
* When Oracle must store a row in more than one row piece, it is chained across multiple blocks.

### Block Content

* **Block Header**
    - Contains segment type (table or index)
    - Contains block address
    - Contains row directory
    - Block header grows downward from top

* **Free Space**
    - Enable block header and row data to grow

* **Row Data**
    - It is actual data for rows
    - It grows upward from bottom