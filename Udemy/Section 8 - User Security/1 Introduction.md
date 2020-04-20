# Administrating User Security

## Controlling User Access

1. Database Security
    - System security
    - Data Security

2. System Privileges
    - Performing a particular action within the database

3. Object Priviliges
    - Manipulating the content of the database objects

4. Schemas
    - Collection of objects such as tables, views and sequences


**Note**
    - Users and schemas are DB users
    - But, when user has objects, we call it schema


### System Priviliges

* More than 200 priviliges
* DB administrator has high-level system priviliges for tasks such as:
    - Creating new users
    - Altering users
    - Removing users
    - Removing tables
    - Backing up tables

#### Role

* A role is a named group of related priviliges that can be granted to the user.
* It makes it easier to create and maintain priviliges


### Object Priviliges

* It is a privilege or right to perform a particular action on a specific table, view, sequence or procedure.
* Object priviliges vary from object to object
* An owner has all privileges on object, and can grant it to others