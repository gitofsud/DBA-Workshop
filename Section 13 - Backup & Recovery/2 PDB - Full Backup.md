Doing backup for PLUGGABLE DB and restoring

1. Make sure that DB is up and running
2. Login to RMAN

        rman target= /

3. In order to see any available backup, do this

        list backup of database orclpdb;

4-	Now we will do this command
backup database orclpdb plus archivelog;
5-	 Make sure from the backup
list backup of database orclpdb;

note: the backup contains backup sets 
each set contains pieces 


6-	Let us do some damage and play😊
Follow with me

7-	Restore the backup
RUN 
{
RESTORE PLUGGABLE DATABASE orclpdb;
RECOVER PLUGGABLE DATABASE orclpdb;
ALTER PLUGGABLE DATABASE orclpdb open;
}

8-	Make sure that all changes that you did has been restored
Congratulation: you are expert now:)
