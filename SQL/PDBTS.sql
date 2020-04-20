-- 10.1 SEGMENTS

SHOW user;

SHOW con_name;

SELECT DBMS_METADATA.GET_DDL('TABLESPACE', 'T1') FROM dual;

SELECT * FROM dba_tablespaces WHERE tablespace_name='T1';

CREATE USER alex IDENTIFIED BY alex DEFAULT TABLESPACE T1;

GRANT CREATE SESSION, CREATE TABLE, UNLIMITED TABLESPACE TO alex;

SELECT * FROM dba_users WHERE username='ALEX';

CREATE TABLE ALEX.EMP (EMP_ID NUMBER, NAME VARCHAR2(100), NOTE VARCHAR2(1000));

SELECT * FROM DBA_TABLES
WHERE TABLE_NAME='EMP'
AND OWNER='ALEX';

-- Oracle have not created segment as there are no rows in table
SELECT * FROM DBA_SEGMENTS
WHERE OWNER='ALEX'
AND SEGMENT_NAME='EMP';

INSERT INTO ALEX.EMP VALUES (1, 'ALEX', 'My Way');
COMMIT;

SELECT * FROM dba_extents
WHERE owner='ALEX'
AND SEGMENT_NAME='EMP';

-- Let us insert 1000 rows

BEGIN
    FOR i IN 1..1000
    LOOP
    INSERT INTO ALEX.EMP VALUES (i, 'TEST', 'test comments');
    END LOOP;
    COMMIT;
END;