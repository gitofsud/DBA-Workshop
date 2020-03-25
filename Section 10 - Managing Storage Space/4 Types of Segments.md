# Segments

* A segment is a set of extents allocated for certain logical structure

* Different types

    - Table and cluster
        * Note: For a partitioned table, each partition has a data segment

    - Index
        * Note: For a partitioned index, each partition has an index segment

    - Undo
        * Oracle DB maintains information to reverse changes made to DB. This information consists of records of actions of transactions, collectively known as undo.

    - Temporary
        - A temp segment is created by Oracle DB server when SQL statements needs a temp DB area to complete execution.
        - When statement finishes execution, the extents in temporary segment are returned to system for future use.
