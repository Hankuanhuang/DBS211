 /*
   Name       : Han Kuan Huang
   Oracle ID  : dbs211_253nbb15
   Student ID : 141140244    
   Date       : 
   Purpose    : DBS211C50_Lab04
*/

SET AUTOCOMMIT ON; 
/*Q1*/
CREATE TABLE Movies (
    mid         INT  PRIMARY KEY,   -- INT → NUMBER(10,0)
    title       VARCHAR2(35)  NOT NULL,
    releaseYear INT   NOT NULL,      -- INT → NUMBER(4,0)
    director    INT   NOT NULL,      -- INT → NUMBER(10,0)
    score       INT   CHECK (score > 0 AND score < 5) -- DECIMAL → NUMBER
);

CREATE TABLE Actors (
    aid        INT   PRIMARY KEY,   -- PK
    firstName  VARCHAR2(20)   NOT NULL,      -- Not Null
    lastName   VARCHAR2(30)   NOT NULL       -- Not Null
);

CREATE TABLE Castings (
    movieid  NUMBER(10,0),
    actorid  NUMBER(10,0),
    CONSTRAINT pk_castings PRIMARY KEY (movieid, actorid),
    CONSTRAINT fk_castings_movie FOREIGN KEY (movieid) REFERENCES Movies(mid),
    CONSTRAINT fk_castings_actor FOREIGN KEY (actorid) REFERENCES Actors(aid)
);
CREATE TABLE Directors (
    directorid  NUMBER(10,0)   PRIMARY KEY,   -- PK
    firstname   VARCHAR2(20)   NOT NULL,      -- Not Null
    lastname    VARCHAR2(30)   NOT NULL       -- Not Null
);
/*Q2*/
ALTER TABLE Movies
ADD CONSTRAINT fk_movies_director
FOREIGN KEY (director)
REFERENCES Directors(directorid);

/*Q3*/
ALTER TABLE Movies
ADD CONSTRAINT uq_movies_title UNIQUE (title);

/*Q4*/
INSERT INTO Directors (directorid, firstname, lastname)
VALUES (1010, 'Rob', 'Minkoff');

INSERT INTO Directors (directorid, firstname, lastname)
VALUES (1020, 'Bill', 'Condon');

INSERT INTO Directors (directorid, firstname, lastname)
VALUES (1050, 'Josh', 'Cooley');

INSERT INTO Directors (directorid, firstname, lastname)
VALUES (2010, 'Brad', 'Bird');

INSERT INTO Directors (directorid, firstname, lastname)
VALUES (3020, 'Lake', 'Bell');

INSERT INTO Movies (mid, title, releaseYear, director, score)
VALUES (100, 'The Lion King', 2019, 3020, 3.50);

INSERT INTO Movies (mid, title, releaseYear, director, score)
VALUES (200, 'Beauty and the Beast', 2017, 1050, 4.20);

INSERT INTO Movies (mid, title, releaseYear, director, score)
VALUES (300, 'Toy Story 4', 2019, 1020, 4.50);

INSERT INTO Movies (mid, title, releaseYear, director, score)
VALUES (400, 'Mission Impossible', 2018, 2010, 4.99);

INSERT INTO Movies (mid, title, releaseYear, director, score)
VALUES (500, 'The Secret Life of Pets', 2016, 1010, 3.90);

COMMIT;

/*Q5*/
-- delete first
DROP TABLE Castings ;

-- delete second
DROP TABLE Movies ;

-- and delete Actors
DROP TABLE Actors ;

-- final Directors
DROP TABLE Directors ;

/*Q6*/
CREATE TABLE employee2 AS
SELECT * FROM employees;

/*Q7*/
ALTER TABLE employee2
ADD username VARCHAR2(30);

/*Q8*/
DELETE FROM employee2;


/*Q9*/
INSERT INTO employee2 (
  employeenumber, lastname, firstname, extension, email,
  officecode, reportsto, jobtitle)
SELECT
  employeenumber, lastname, firstname, extension, email,
  officecode, reportsto, jobtitle        
FROM employees;


/*Q10*/
UPDATE employee2
SET firstname = 'Han Kuan',
    lastname  = 'Huang'
WHERE employeenumber = 1002;

/*Q11*/
UPDATE employee2
SET username = LOWER(SUBSTR(firstname, 1, 1) || lastname); 
/*Q12*/
DELETE FROM employee2
WHERE officecode = 4;

/*Q13*/
DROP TABLE employee2;


