# Common Users vs Local users

## Common User

* It is created in root container
    - It is inherited by all PDBs in CDB, including future PDBs.

* Admin accounts such as **SYS** and **SYSTEM** users are common user.

* User defined prefix is defined in **common_user_prefix**
    - You can create common user, but you need user-defined prefix C##, C##User.

## Local User

* It is created in specific PDB

* A local user cannot have same name as common user.

* Same user and password can be created in multiple PDBs.