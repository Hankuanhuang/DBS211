--SQL(DML,DDL,TCL) 

-- Grant privileges to users
GRANT SELECT ON offices TO lydial;
GRANT INSERT,UPDATE, DELETE ON offices TO dbs211_233ncc55;
GRANT ALL ON offices TO lydial;

--Revoke privileges from users
REVOKE DELETE ON PART FROM dbs211203_d50;
REVOKE INSERT,UPDATE ON PART FROM dbs211203_d50;
REVOKE ALL ON offices FROM lydial;

--Auto-Commit
SET AUTOCOMMIT ON
SET AUTOCOMMIT OFF
--are two statements that can be run to change how DML statements are handled.  
--By default auto-commit is off.  If auto commit is on, 
--then DML statements are automatically committed immediately 
--upon successful execution without the need for commit.

BEGIN   --start transaction  --BEGIN transaction
--SQL statements
commit/rollback;
END;     --end

 
--DATE format setting 
--Tools/preference/Database/NLS --date format

SELECT 
   TO_DATE('2012-06-05', 'YYYY-MM-DD')      -- Oracle date format YYYY-MM-DD
FROM dual;
SELECT
  TO_DATE( '5 Jan 2017', 'DD MON YYYY' )    -- Oracle date format DD MON YYYY
FROM dual;

--because '5 Jan 2017' is not Oracle standard date format,
--you have to use the TO_DATE() function to convert it to an Oracle DATE value before storing in the table.

DELETE  
FROM players;

SELECT *
FROM PLAYERS;

drop table players;
rollback;

COMMIT; -- force to start a new transaction

CREATE TABLE players (                         
  playerID       INT   PRIMARY KEY,  
  plname    varchar   (20) not null,
  pfname    varchar   (20) not null,
  DOB date,
  Email varchar(20));
  
INSERT INTO players  
VALUES (1667, 'George', 'Dunkirk', '24-08-06','m@gmail.com');

SELECT * 
FROM players 
WHERE playerID = 1667;    -- there will be one record shown


COMMIT;
ROLLBACK;

SELECT * 
FROM players 
WHERE playerID = 1667;    -- the record is still there

DELETE from players;

--example1
--savepoint

COMMIT;   -- force starts a new transaction

INSERT INTO  players
VALUES (1667, 'George', 'Dunkirk', '28-04-86', 'gdunkirk@email.com');

SAVEPOINT A;
SELECT * 
FROM players
WHERE playerID = 1667 OR playerID = 1668;   

INSERT INTO players 
VALUES (1668, 'Henry', 'Buggles', to_date('19851203','yyyymmdd'), 'gbuggles@email.com');

SELECT * 
FROM players 
WHERE playerID = 1667 OR playerID = 1668;    -- there will be two records shown

ROLLBACK TO A;

SELECT * 
FROM players 
WHERE playerID = 1667 OR playerID = 1668;     -- only one record will be shown as 1668 was rolled back

DELETE from players;

--example2

COMMIT;   -- force starts a new transaction

INSERT INTO players  
VALUES (1667, 'George', 'Dunkirk', to_date('19860428','yyyymmdd'), 'gdunkirk@email.com');

SAVEPOINT A;

SELECT * 
FROM players 
WHERE playerID = 1667 OR playerID = 1668;    -- there will be one record shown

INSERT INTO players
VALUES (1668, 'Henry', 'Buggles', '12-05-76', 'gbuggles@email.com');

SELECT * 
FROM players 
WHERE playerID = 1667 OR playerID = 1668;    -- there will be two records shown

COMMIT;
            
ROLLBACK TO A;  -- error

SELECT * 
FROM players
WHERE playerID = 1667 OR playerID = 1668     -- Both records will be shown as they were both committed.

DELETE from players;

--example3
--a transaction is automatically committed when any DDL statement is executed
COMMIT;   -- force starts a new transaction

INSERT INTO players 
VALUES (1667, 'George', 'Dunkirk', to_date('19860428','yyyymmdd'), 'gdunkirk@email.com');

INSERT INTO players 
VALUES (1668, 'Henry', 'Buggles', to_date('19851203','yyyymmdd'), 'gbuggles@email.com');

SELECT * 
FROM players 
WHERE playerID = 1667 OR playerID = 1668;    -- there will be two records shown

CREATE OR REPLACE VIEW vsShowPlayers AS
    (SELECT * FROM players WHERE playerID = 1667 OR playerID = 1668);
    
SELECT * 
FROM vsShowPlayers;

ROLLBACK;
            
SELECT * 
FROM players 
WHERE playerID = 1667 OR playerID = 1668 ;    -- Both records will be shown as they were both committed.

