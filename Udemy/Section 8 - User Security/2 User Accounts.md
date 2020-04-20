# User Accounts

* Unique Username - Cannot exceed 30 bytes, no special chars and must start with a letter

* Authentication - Password

* Default and temporary Tablespace

* User Profile - Set of resources and password restrictions assigned to the user

* Initial Consumer Group - Used by Resource Manager

* Account Status - Users can access only **open** accounts.

* Grant others with admin options as follows:

        GRANT CREATE SESSION TO user WITH ADMIN OPTION;


## Oracle supplied Admin accounts

* **SYS**
    - Can perform all admin functions
    - All base tables and views for DB data dictionary are stored in SYS schema
    - SYS user is granted the SYSDBA privilige which enables user to perform admin task such as backup and recovery

* **SYSTEM**
    - Can perform all admin functions except:
        * Backup and Recovery
        * Database Upgrade


* **Oracle Data Guard** 
    - Provides management, monitoring and automation software to create and maintain one or more standby DB to protect Oracle data from failures, disasters, human error and data corruptions while providing high availability for mission critical applications

* **Transparent Data Encryption (TDE)**
    - Enables to encrypt sensitive data that you store in tables and tablespaces


## User Profile

- It is a named set of resource limits and password parameters that restrict DB usage and DB instance resources for a user.
- If you assign a profile to user, that user can not exceed those limits
- Every user, including admin is assigned to only one profile
- By default, when you create a user, it will be assigned to default profile, unless you specified another profile.

### Two ways to assign a profile

* **Common** 
    - It is replicated in all current and future containers

* **Locally**
    - Profile assignment occurs in one PDB


## Resource parameters

* In a profile, you can control
    - CPU resources
        * Limited on per-session or per-call basis

    - Network and memory
        * Connect time
        * Idle time
        * Concurrent sessions
        * Private SGA
    
    - Disk I/O resource

* Profiles also allow composite limits, ie combination of above