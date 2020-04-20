# Demo

## Duplicating a DB

Open two terminal windows to perform duplication

1. Prepare the system
    - cd to $ORACLE_BASE and create a directory for new DB fra i.e. dbtest_fra

2. Add a directory under the dbtest_fra directory called orcl

3. Add a directory for dbtest_fra within the oradata directory

4. Create a service name entry using netca
    - service name = dbtest
    - protocol = tcp
    - host fully qualified name = edvmr1p0.us.oracle.com
    - set port to 1521 if not already set
    - do not test