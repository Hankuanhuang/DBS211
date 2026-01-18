 /*
   Name       : Han Kuan Huang
   Oracle ID  : dbs211_253nbb15
   Student ID : 141140244    
   Date       : 
   Purpose    : DBS211C50_Lab06
*/


/*Q1*/
Begin, Commit, Begin Transaction, Commit Transaction

/*Q2*/
CREATE TABLE newEmployees AS
SELECT * FROM employees
DELETE FROM newEmployees;
COMMIT;
/*Q3*/
SET AUTCOMMIT OFF;
SET TRANSACTION READ WRITE;

/*Q4*/
INSERT ALL
INTO newEmployees(EMPLOYEENUMBER, LASTNAME, FIRSTNAME, EXTENSION, EMAIL, OFFICECODE, REPORTSTO, JOBTITLE)
VALUES(1001, 'Huang', 'Ken', 'x1234', 'ken@myseneca.ca', 1, NULL, 'Developer')
INTO newEmployees(EMPLOYEENUMBER, LASTNAME, FIRSTNAME, EXTENSION, EMAIL, OFFICECODE, REPORTSTO, JOBTITLE)
VALUES(1002, 'Chou', 'Reese', 'x2345', 'Reese@myseneca.ca', 1, NULL, 'Designer')
INTO newEmployees(EMPLOYEENUMBER, LASTNAME, FIRSTNAME, EXTENSION, EMAIL, OFFICECODE, REPORTSTO, JOBTITLE)
VALUES(1003, 'Chan', 'Leo', 'x3456', 'leo@myseneca.ca', 2, NULL, 'Developer')
SELECT * FROM dual;

/*Q5*/
SELECT *
FROM newEmployees;

/*Q6*/
ROLLBACK;

SELECT * FROM newEmployees;

/*Q7*/
INSERT ALL
    INTO newEmployees (EMPLOYEENUMBER, LASTNAME, FIRSTNAME, EXTENSION, EMAIL, OFFICECODE, REPORTSTO, JOBTITLE)
    VALUES (1001, 'Huang', 'Ken', 'x1234', 'ken@myseneca.ca', 1, NULL, 'Developer')
    INTO newEmployees (EMPLOYEENUMBER, LASTNAME, FIRSTNAME, EXTENSION, EMAIL, OFFICECODE, REPORTSTO, JOBTITLE)
    VALUES (1002, 'Chou', 'Reese', 'x2345', 'reese@myseneca.ca', 1, NULL, 'Designer')
    INTO newEmployees (EMPLOYEENUMBER, LASTNAME, FIRSTNAME, EXTENSION, EMAIL, OFFICECODE, REPORTSTO, JOBTITLE)
    VALUES (1003, 'Chan', 'Leo', 'x3456', 'leo@myseneca.ca', 2, NULL, 'Developer')
SELECT * FROM dual;

COMMIT;
SELECT * FROM newEmployees;
//  three row only

/*Q8*/
UPDATE newEmployees
SET jobtitle = 'unknown';

SELECT * FROM newEmployees;

/*Q9*/
COMMIT;

/*Q10*/
ROLLBACK;

SELECT *
FROM newEmployees
WHERE jobtitle = 'unknown';
//a: There all rows (3) are still 'unknown'
//b: The rollback command was not effective becuase the changes were already committed in task9
//c:  task6 hadn't committed the insert yet. task10 already committed it

/*Q11*/
DELETE FROM newEmployees;
SELECT * FROM newEmployees;

/*Q12*/
CREATE VIEW vwNewEmps AS
SELECT *
FROM newEmployees
ORDER BY lastName, firstName;

/*Q13*/
ROLLBACK;

SELECT * FROM newEmployees;
//a: If you didn't commit will have the data back, but if not committed will not be notthing back
//b: Not effective, because the didn't committed

/*Q14*/
INSERT ALL
INTO newEmployees(EMPLOYEENUMBER, LASTNAME, FIRSTNAME, EXTENSION, EMAIL, OFFICECODE, REPORTSTO, JOBTITLE)
VALUES(1001, 'Huang', 'Ken', 'x1234', 'ken@myseneca.ca', 1, NULL, 'Developer')
INTO newEmployees(EMPLOYEENUMBER, LASTNAME, FIRSTNAME, EXTENSION, EMAIL, OFFICECODE, REPORTSTO, JOBTITLE)
VALUES(1002, 'Chou', 'Reese', 'x2345', 'Reese@myseneca.ca', 1, NULL, 'Designer')
INTO newEmployees(EMPLOYEENUMBER, LASTNAME, FIRSTNAME, EXTENSION, EMAIL, OFFICECODE, REPORTSTO, JOBTITLE)
VALUES(1003, 'Chan', 'Leo', 'x3456', 'leo@myseneca.ca', 2, NULL, 'Developer')
SELECT * FROM dual;

/*Q15*/
SAVEPOINT insertion;


/*Q16*/
UPDATE newEmployees
SET jobTitle = 'unknown';

SELECT EMPLOYEENUMBER, LASTNAME, FIRSTNAME, jobTitle
FROM newEmployees;

/*Q17*/
ROLLBACK TO insertion;

SELECT * FROM newEmployees;
//The jobtitle go back to developer and designer. the unknown are undone

/*Q18*/
ROLLBACK;

SELECT * FROM newEmployees;
//The table will be empty, becasue the rollback undid entire transaction(the inserts, update, and savepoint)

/*Q19*/
REVOKE ALL ON newEmployees FROM PUBLIC;

/*Q20*/
GRANT SELECT ON newEmployees TO dbs211_253ncc07;

/*Q21*/
GRANT INSERT, UPDATE, DELETE ON newEmployees TO dbs211_253ncc07;

/*Q22*/
REVOKE ALL ON newEmployees FROM dbs211_253ncc07;

