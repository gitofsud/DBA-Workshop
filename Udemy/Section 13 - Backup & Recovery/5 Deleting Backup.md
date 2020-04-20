
# Deleting backup

* Remember that we use this command to do full backup for the entire database.

        backup database plus archivelog;

* Remember that we use this command to do full backup for the a specific pluggable.

        backup database orclpdb plus archivelog;

* To delete all backups

    - Do this:

            Delete backup;

    - Or

            DELETE NOPROMPT BACKUP;

    - Or
       
            DELETE BACKUP TAG 'tag_name';

* To delete specific backup

        List backup of database orclpdb
        DELETE BACKUPSET 42

