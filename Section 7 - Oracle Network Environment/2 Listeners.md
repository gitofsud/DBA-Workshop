# Listeners

## How Oracle connects to PORT?

- It searches for the confguration in following order:

    1. listener.ora 
    2. tnsnames.ora
    3. There is a default value of PORT set by Oracle, it will connect using that.



## Non default port

1. Make changes to port number in **tnsnames.ora**
2. Execute the command

        alter system set local_listener=LISTENER_ORCL;



## Creating Dynamic Listener

1. Create another LISTENER{new-name} in **tnsnames.ora** with new PORT number
2. Create another LISTENER{new-name} in **listener.ora** like following:
    1. Remove DESCRIPTION_LIST
    2. It should be like this:


            LISTNERX = 
                (DESCRIPTION =
                    (ADDRESS = (PROTOCOL = TCP) (HOST = test.com) (PORT = 1527))
                )

3. Login in SQLPLUS


        SHOW PARAMATER LOCAL;
        ALTER SYSTEM SET LOCAL_LISTENER="LISTENER_ORCL, LISTENER{new_name}";

4. In LSNRCTL,

        START LISTENER{new_name};

5. Connect using the port

        CONNECT {username}/{password}@test.com:1527/orcl.com



## Creating STATIC Listener

1. Get the following values
    * PDB_name = show global_name from global_name;
    * SID_NAME
        1. show parameter inst
        2. Copy value of "instance_name"
    * ORACLE_HOME = Directory where DB is present


2. Add the following in **listener.ora** file


        LISTNER_X = 
                (DESCRIPTION =
                    (ADDRESS = (PROTOCOL = TCP) (HOST = test.com) (PORT = 1527))
                )
        
        SID_LIST_LISTENER_X=
            (SID_LIST=
                (SID_DESC=
                    (GLOBAL_DBNAME={PDB_name}.com)
                    (SID_NAME={instance_name})
                    (ORACLE_HOME={$ORACLE_HOME})
                )
            )

Note: If status is UNKNOWN, it's because service cannot guarantee as it is manual

3. If we want to add another PORT, then just add like following in **listener.ora** and restart

        SID_LIST_LISTENER_X=
            (SID_LIST=
                (SID_DESC=
                    {OLD_VALUES as above}
                )

                (SID_DESC=
                    {NEW_VALUES as above}
                )
            )
