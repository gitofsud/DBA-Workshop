
SELECT name, con_id FROM v$datafile WHERE con_id=<pdb$seed.con_id>;

CREATE PLUGGABLE DATABASE pdbron ADMIN USER ron IDENTIFIED BY ron
ROLES=(CONNECT)
FILE_NAME_CONVERT=('pdb$seed', 'pdbron');