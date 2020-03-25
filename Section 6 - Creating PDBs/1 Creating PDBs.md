# Creating PDBs

## Introduction

### Methods to create PDBs:

* Create a PDB by using seed
* Create a PDB from non-CDB
* Clone an existing PDB or non-CDB
* Plug an unplugged PDB into different CDB
* Relocate PDB to different CDB
* Create a PDB and proxy PDB

### Tools to create PDBs

* SQL*Plus
* SQL Developer
* Enterprise Manager Cloud Control
* DBCA

## Creating PDBs from SEED

* Statement

        create pluggable database

* Copy data files from seed to new location
* It will create SYSTEM and SYSYAUX tablespaces
* It will create default schemas and common users
* DB service is automatically created

### Prerequisites

* Current container must be root
* Have priviliges - CREATE PLUGGABLE DATABASE
* CDB must be in READ WRITE mode

## Cloning PDBs

Cloning is copying a source PDB from CDB and plugging the copy into same CDB or another CDB.

### Prerequisites

* Current container must be root
* Have priviliges - CREATE PLUGGABLE DATABASE
* CDB in which PDB is being created must be in READ WRITE mode

## Unplugging and Plugging PDBs

* Unplugging a PDB is disassociating PDB from its CDB.
* Plugging in PDB is associating a PDB with CDB.
* You can plug a PDB into same or another PDB.

### Steps

1. Close the PDB
2. Unplug PDB in xml
3. Drop PDB but keep datafiles
4. Check compatibility
5. Plug PDB using xml