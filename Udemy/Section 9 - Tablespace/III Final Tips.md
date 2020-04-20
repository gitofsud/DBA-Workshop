# Altering and Dropping Tablespaces

* When you create a tablespace, it is initially Read Write tablespace

* Use ALTER TABLESPACE statement to 
    - take tablespace offline or online, 
    - add data files or temp files to it, or 
    - make it a read-only tablespace

* A tablespace can be in one of three different statuses or states:
    - Read Write
    - Read Only
    - Offline with one of following options
        - Normal
        - Temporary
        - Immediate

* Add space to existing tablespace by either adding data files to tablespace or change size of existing data file

* Use DROP TABLESPACE statement to drop a tablespace and its contents from DB if you no longer need its content