# Duplicate of DB

* Use Cases
    - Test backup and recovery procedures
    - Recover objects by creating an export and importing the objects into the production database

* Create a duplicate database
    - With RMAN DUPLICATE command
    - On same or separate hosts
    - With identical content or subset of source
    - Performed by auxiliary channels for backup based duplication


## Duplicating an Active DB with "Push"

- Push method based on image copies
- Via EM or RMAN command line
- With network
- With customized spfile

## Comparing Push and Pull

- Push process is based on image copies
- Pull process is based on backup sets
    * RMAN uses pull method when it finds:
        - Using BACKUPSET
        - SECTION SIZE
        - Encryption
        - Compression

    * The pull method requires connections to target and auxiliary instances

## Duplicating a DB with Target Connection

* RMAN connects to target (source DB instance)
* RMAN connects to auxiliary instance

## Duplicating DB with Recovery Catalog

* RMAN connects to recovery catalog instance for backup metada
* RMAN connects to auxiliary instance, which must have access to RMAN backups

### Duplicating DB without Recovery Catalog or Target Connection

* RMAN connects to auxiliary instance, which must have access to a backup location