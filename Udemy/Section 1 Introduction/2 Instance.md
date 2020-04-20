# Instance In-Depth

* Memory
    - System Global Area (SGA)
    - Program Global Area (PGA)

* Processes
    - Background processes
    - Server Processes


## Server Processes

- Oracle starts it to handle client processes
- Perform work for client program
- Each server process has its own cache dedicated for each connecting client
    * It is called **PGA**

### PGA

* It is a non-shared memory region reserved only for specific user session connected to that specific server process

* It contains data and control information used by server processes when sorting data, joining large tables together as part of SQL statement


### Oracle Shared Server Processes

* Client user processes connect to a dispatcher.
* The dispatcher can support multiple client connections concurrently