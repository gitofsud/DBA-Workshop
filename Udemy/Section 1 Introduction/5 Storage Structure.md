# Logical Storage Structure

## Database

* Tablespaces
    - Logical storage groups to store DB constructs such as tables and indexes
    - It stored DB files
    - Made of Segments

* Segment
    - Set of Extents (one or more)
    - Allocated for logical structures such as table and index

* Extent
    - Set of contiguous Oracle Data Blocks
    - It is efficient when allocating space

* Oracle Data Block
    - Stored in DB blocks
    - 1 Block = 8 K by default
    - Contains one or more rows


## Storage System

* SAN - Storage Area Network
* NAS - Network Attached Storage
* NFS - Network File System
* ASM - Automatic Storage Management
* Exadata