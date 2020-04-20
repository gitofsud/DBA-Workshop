# Oracle Network Environment

## Tools to configure listeners

* Oracle Net Manager (netmgr)
* Oracle Net Configuration Assistant (netca)
* Listener Control Utility
* Enterprise Manager Cloud Control
* Database Configuration Assistant - Allows to create listener when creating CDB

## Establishing a Connection and Session

1. Listener receives connect packet
2. If service name is
    - valid -> Listener will create dedicated SP
    - invalid -> Error
3. Listener connects to SP and pasess initialization info to it
4. SP checks the authentication
    - If its OK -> It creates session
5. SP acts like Agent now.

### Server Process - Responsibility

* Parsing and running any SQL statements
* Checking DB buffer cache for data blocks required to perform SQL statements
* Reading necessary data blocks on disk into database buffer cache portion of SGA, if blocks not already present in SGA
* Managing all sorting activity. 
    - Sort Area is memory area that is used to work with sorting, it is contained in portion of memory that is associated with PGA.
* Returning results to user process in such a way that application can process the information
* Reading auditing options and reporting user processes to audit destination


## Default Listener

* During DB installation, Oracle Net Configuration Assistant creates local listener named LISTENER.
    - LISTENER is automatically populated with available DB services through a feature called **dynamic service registration**
    - LISTENER listens on following TCP/IP protocol address:

            ADDRESS=(PROTOCOL=tcp) (HOST=host_name) (PORT=1521)

* Without any configuration, you can access DB instance immediately using LISTENER
* If listener name is LISTENER and it cannot be resolved
    - Protocol address of TCP/IP
    - Port Number of 1521 is assumed


## Note

* If LISTENER is not started yet, we can open SQLPLUS and execute the following command:

        ALTER SYSTEM REGISTER;