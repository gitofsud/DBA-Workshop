# Managing Storage Space

* Space is automatically managed by the Oracle Database server. It generates alerts about potential problems and recommends possible solutions.

## Oracle Managed Files (OMF)

* No need to bother about file names and storage requirements. Oracle provides a unique file name.

* Eliminates the need for DBA to directly managed OS files.

* Allows operations to be specified in terms of objects and not files.

* Reduces the chance of overwriting a file. Avoids accidental corruption of data files.

* Free-space management with bitmaps ("locally manged")
    - **Automatic Segment Space Management**

For example, the following statement creates tablespace mytbs1 with automatic segment-space management

        CREATE TABLESPACE mtbs1
        DATAFILE '/u01/oracle/data/mytbs01.dbf' SIZE 500M
        EXTENT MANAGEMENT LOCAL
        SEGMENT SPACE MANAGEMENT AUTO;

* **Automatic data file extension**
    - So the files can grow automatically based on the amount of data in the files

* Proactive space management (Default thresholds and server-generated alerts)
