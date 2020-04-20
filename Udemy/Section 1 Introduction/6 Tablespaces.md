# Tablespaces

* SYSTEM 
    - Core functionality
    - Stores data dictionary
    - Automatically created, cannot rename or drop

* SYSAUX
    - Auxiliary tablespace to SYSTEM
    - Reduces load on SYSTEM
    - Automatically created, cannot rename or drop

* TEMP
    - Used to manage space for sort and join operations

* UNDO
    - Used to roll back, or undo changes to DB
        * Rollback transactions when ROLLBACK statement is issued
        * Recover the DB
        * Provide read consistency

* USERS
    - Stores users objects and data
