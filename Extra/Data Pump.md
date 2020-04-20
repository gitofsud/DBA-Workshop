* Create directory at OS level

        mkdir -p /u02/dp_exp_dir

* Create a directory

        SQL> create directory datapump '/u02/dp_exp_dir';

* Grant permissions on directory 

        SQL> grant read, write on directory datapump to system;

* To view directory information

        SQL> select * from dba_directories;


## EXPDP

* To know options of datapump export

        expdp help=y

* To take database level export

        expdp directory=datapump dumpfile=fullprod.dmp logfile=fullprod.log full=y

* To take schema level export

        expdp directory=datapump dumpfile=scott_bkp.dmp logfile=scott_bkp.log schemas='SCOTT'

* To take table level export

        expdb directory=datapump dumpfile=emp_bkp.dmp lofile=emp_bkp.log tables='SCOTT.EMP'

* To take row level export

        expdp directory=datapump dumpfile=emprows_bkp.dmp logfile=emprows_bkp.log tables='SCOTT.EMP' query=\"where deptno=10\"


## IMPDP

* To know options of datapump import

        impdp help=y

* To import full database

        impdp directory=datapump dumpfile=fullprod.dmp logfile=imp_fullprod.log full=y

* To import a schema

        impdp directory=datapump dumpfile=scott_bkp.dmp logfile=imp_schema.log remap_schema='SCOTT:SCOTT'
        impdp directory=datapump dumpfile=scott_bkp.dmp logfile=imp_schema.log remap_schema='SCOTT:ABC'

* To import a table

        impdp directory=datapump dumpfile=emp_bkp.dmp logfile=imp_emp.log tables='EMP' remap_schema='SCOTT:SCOTT'

* To import a table to another user

        impdp directory=datapump dumpfile=exp_bkp.dmp logfile=imp_emp.log tables='EMP' remap_schema='SCOTT:SYTEM'

* To import tables to another tablespace

        impdp directory=datapump dumpfile=emp_bkp.dmp logfile=imp_emp.log tables='EMP' remap_schema='SCOTT:SCOTT' remap_tablespace='MYDATA:MYTBS'