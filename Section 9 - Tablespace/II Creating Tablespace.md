# Creating Tablespace

* Creating tablespace is an allocation of space in DB that can contain schema objects.

* Statement:

        create tablespace

* OR 

        dbca

* 3 Types of Tablespace:
    - **Permanent tablespace** - contains persistent schema objects. Objects in permanent tablespaces are stored in data files.
    - **Undo tablespace** - is a type of permanent tablespace used by Oracle DB to manage undo data
    - **Temporary tablespace** - contains schema objects only for duration of a session.

* Prerequisites:
    - DB must be opened
    - create tablespace system privilege

## About

### 1. File name and size

* You must specify DATAFILE or TEMPFILE clause when creating a tablespace, this will specify name and location of data file or temp file.

* A tablespace must have at least one data file or temp file.

* You must specify initial file size.

* AUTOEXTEND ON - to automatically extend file when it is full. You need to specify increment amount + maxsize.

* bigfile or smallfile - to override default tablespace type

    - **Bigfile tablespace** - contains only one data file or temp file, which can contain up to approx 4 billion blocks
    - **Smallfile tablespace** - traditional Oracle tablespace, contains 1022 data files or temp files, each of which contains approx 4 billion blocks.

### 2. Availability

* online or offline - to make tablespace available or not available
    - Can be used with temporary tablespace
    - Online is default
* DBA_tablespaces indicates whether each tablespace is online or offline.

### 3. Block Size

* BLOCKSIZE to specify nonstandard block size.
* DB_CACHE_SIZE and atleast one DB_nK_CACHE_SIZE - parameter must be set
* You cannot specify nonstandard block sizes for temporary tablespace
* Default - 8 KB

### 4. Extent Management

* EXTENT MANAGEMENT - specifies how extents of tablespace will be managed

* AUTOALLOCATE - specifies that tablespace is system managed.

* UNIFORM - specifies tablespace is managed with uniform extents of SIZE bytes. Default SIZE is 1 mb.
    - All extents of temporary tablespace are of uniform size, so keyword is optional.
    - You must specify UNIFORM to specify SIZE
    - You cannot specify UNIFORM for undo tablespace

* If not specified AUTOALLOCATE OR UNIFORM, then
    - Default is UNIFORM for temporary tablespace
    - AUTOALLOCATE for all other types of tablespaces

### 5. Logging Clause

* Specify default logging attributes of all tables, indexes, views withing tablespace.
* Logging clause specifies creation of DB object will be logged in redo log file (LOGGING) or no (NOLOGGING)
* Default is LOGGING
* Not valid for temporary or undo tablespace.

### 6. Segment Management Clause

* **AUTO** - If you want DB to manage free space of segments in tablespace using bitmap
* **MANUAL** - If you want DB to manage free space of segments in tablespace using free lists

### 7. Data Segment Compression

* Disabled by default