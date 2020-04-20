# Initialization Parameters & Parameters Files

* When you start a DB instance, it reads instance configuration parameters (initialization parameters) from initialization parameters file (Parameter file).

* Parameter files located: **$ORACLE_HOME/dbs**

## Parameter Files

### 1. Server Parameter File (spfile)

* It is binary file (preferred choice)
* Database can read and write on it
* You can use **alter system** command for changing Parameters.
* It is automatically created by DBCA when you create CDB.
* Default name for spfile is : **spfile<sid>.ora** Example: spfileorcl.ora

### 2. Text Initialization Parameter File (pfile)

* It is a text file containing parameter values in name/value pairs
* The database can only read it
* You should edit it manually and restart the instance to refresh the parameter values
* Sample pfile name: **init.ora**


## Search Order

When we do startup, the following search takes place:

1. spfile{sid}.ora
2. spfile.ora
3. init{sid}.ora (pfile)

If the files are unable to be found, then you have to specify it during startup

SQL> startup pfile=pfilename


## Uses of Initialization Parameters

* Optimize performance by adjusting memory structures
* Set DB-wide defaults, such as amount of space initially allocated for a context area where it is created (**context area**: area for processing an SQL statement)
* Set DB limits, such as max number of DB users
* Specify names of files or directories required by DB.
* All initialization parameters are optional. Oracle has a default value for each parameter.


## Creation of pfile

        SQL> CREATE pfile='initorcl.ora' FROM spfile;

* After shutdown, it will start using pfile if spfile is not found.

* To check if spfile or pfile was used:

        SQL> show parameter spfile;

    If value of spfile is null, we are using pfile.


### Creating non default name for spfile or pfile

        CREATE pfile='test.ora' FROM spfile;

* Example:

        SHOW PARAMETER max_idle_time;

    - Edit in test.ora, add "max_idle_time=10"

* Startup

        startup pfile='test.ora'

    - We will get error as it is non default name, so we need to provide path also.

        startup pfile='{path}/test.ora'