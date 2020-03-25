# SQL Loader

* It is a bulk loader utility used for moving data from external files into the Oracle

* Control file usage

        sqlldr control=/u01/app/oracle/emp.ctl log=/u01/app/oracle/emp.log 

* Control file content

        Load Data
        INFILE '/u01/app/oracle/emp.csv'
        APPEND
        INTO Table emp_load
        FIELDS TERMINATED BY ',' 
        (empno,
        fname,
        lname
        )