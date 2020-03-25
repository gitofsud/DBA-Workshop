# Alter System

## Introduction

* **memory**

        ALTER SYSTEM SET max_idle_item=30 scope=memory;

    - Change will not be written in spfile.ora but in memory till system shutdowns

* **spfile**

        ALTER SYSTEM SET max_idle_time=50 scope=spfile;

    - Change won't take immediately but at next startup

* **Both**

        ALTER SYSTEM SET max_idle_time=20 scope=both;

    - Both for spfile and memory

* Note - max_idle_time should be less than before, so to change it to more, we have to reset it and then change

        ALTER SYSTEM RESET max_idle_time scope=both;



## Default Scope

* If spfile was used, scope - BOTH
* If pfile was used, scope - MEMORY (you cannot specify spfile)



## CONTAINER Clause

        ALTER SYSTEM SET parameter=value container

* You can specify CONTAINER clause when you set a parameter value in CDB

* A CDB uses inheritance model, so PDB inherit them from root

* A PDB can override root's settings

* If specified, CONTAINER=ALL, then it affects all PDB & CDB

* If CONTAINER=CURRENT; parameter for current. But if CDB, then all. (Default)