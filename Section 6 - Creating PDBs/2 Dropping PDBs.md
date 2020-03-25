# Dropping PDBs

* Close the PDB

        ALTER PLUGGABLE DATABASE {pdb_name} CLOSE IMMEDIATE;

* Unplug PDB in xml

        ALTER PLUGGABLE DATABASE {pdb_name} UNPLUG INTO '/{path}/{pdb_name}.xml';

* Drop PDB  

        DROP PLUGGABLE DATABASE {pdb_name} INCLUDING DATAFILES;

* Delete the folder in **oradata** if you want to delete datafiles.