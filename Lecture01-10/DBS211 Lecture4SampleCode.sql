
DROP TABLE COURSES;

CREATE TABLE COURSES(
COURSECODE CHAR(6) PRIMARY KEY,
COURSENAME VARCHAR(15),
courseDesc VARCHAR(30));

SELECT *
FROM COURSES;

INSERT INTO courses
VALUES ('DBS211','DATABASE','Oracle');

INSERT ALL
INTO COURSES
VALUES('dbs311','dbms','AdvancedDB')
INTO COURSES
VALUES('OPS400','OS','IBM system')
INTO COURSES
VALUES('ACT123','ACCOUNTING','MS')
SELECT * FROM DUAL;


SELECT COURSECODE,COURSEDESC 
FROM COURSES
WHERE lower(COURSEDESC )like '%b%';

UPDATE COURSES
SET COURSEname='NYC'
WHERE coursecode = 'dbs311';

Delete  
From courses;

select *       
from courses
where upper(coursename)='OS';

select city from offices;

desc offices;

SELECT COUNT(*)      
FROM offices;

select COUNT(state)      
from offices;          ----7 ?????

select COUNT(officecode)      
from offices
where lower(city) like 'paris'; 


DROP TABLE Players;

CREATE TABLE players (                         
  pID       INT   PRIMARY KEY,  
  plname    varchar   (20) not null,
  pfname    varchar   (20) not null,
  teamID INT );
  
drop table teams;
 
CREATE TABLE teams ( 
	teamID       INT, 	
	teamname     VARCHAR(15) NOT NULL,
       maxplayers   INT DEFAULT 0,
       shirtcolor   VARCHAR(10),
       fieldID      INT,
       PRIMARY KEY (teamID));
       
insert into teams(teamid,teamname)
values(10,'raptors');
 
select * 
from teams;

drop table teams;  

CREATE TABLE teams (
teamID INT PRIMARY KEY, 
teamName VARCHAR(15) NOT NULL, 
maxPlayers INT DEFAULT 0, 
shirtColor VARCHAR(10), 
fieldID INT, 
CONSTRAINT maxplayers_ck CHECK (maxPlayers BETWEEN 0 AND 25));

DROP TABLE FIELDS;

CREATE TABLE fields (
 fieldID INT PRIMARY KEY,
 fieldname varchar(15),
 Address varchar(50), 
 Manager varchar(25)
 ); 
 
 drop table teams;
 
CREATE TABLE teams (
teamNUM INT PRIMARY KEY,      
teamName VARCHAR(15) NOT NULL, 
maxPlayers INT DEFAULT 0, 
shirtColor VARCHAR(10), 
fieldID INT, 
CONSTRAINT maxPlayer_chk CHECK (maxPlayers BETWEEN 0 AND 25), 
CONSTRAINT team_field_fk FOREIGN KEY (fieldID) 
            REFERENCES fields(fieldID) 
); 

SELECT * 
FROM FIELDS;

delete from teams;
delete from fields;
SELECT * 
FROM TEAMS;

INSERT INTO FIELDS(FIELDID)
VALUES(30);

INSERT INTO TEAMS(TEAMNUM,teamname,FIELDID)
VALUES(10,'raptors',30);

SELECT *
FROM fields;

SELECT *
FROM teams;

INSERT INTO fieldS(FIELDID)
VALUES(30);

ALTER TABLE players 
        ADD date_of_birth DATE; 



desc players;
DESC TEAMS;

ALTER TABLE players
   ADD CONSTRAINT PLAYER_TEAMS_FK
   FOREIGN KEY (teamid)
   REFERENCE TEAMS(TEAMID));
   
--drop constraint
ALTER TABLE teams DROP CONSTRAINT  maxPlayer_chk;

--Copy data

INSERT INTO target_table (column1, column2,.... )
   SELECT column1,
       column2,
       ....
   FROM source_table
  [WHERE conditions];

--Copy table with data

drop table newoffices;

CREATE TABLE NEWOFFICES AS 
(SELECT * FROM OFFICES);

SELECT * FROM NEWOFFICES;


--Copy table without data
DROP TABLE playersnew;
CREATE TABLE playersnew AS 
(SELECT * FROM Players
WHERE 100=200) ;             -- how about where 1=2;

CREATE TABLE new_table AS 
(SELECT column_1, 
	         column_2, 
                ... 
                column_n 
FROM old_table);


DROP TABLE playersnew;
DROP TABLE fields;
DROP TABLE  players;
DROP TABLE  teams;

