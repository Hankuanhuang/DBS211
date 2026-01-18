 /*
   Name       : Han Kuan Huang
   Oracle ID  : dbs211_253nbb15
   Student ID : 141140244    
   Date       : 23-SEP-25
   Purpose    : DBS211C50_Lab03
*/
SET AUTOCOMMIT ON;

/*Q1*/
SELECT *
FROM offices;

/*Q2*/
SELECT employeenumber
FROM employees
WHERE officecode = 1;

/*Q3*/
SELECT customernumber,
       customername,
       contactfirstname,
       contactlastname,
       phone
FROM customers
WHERE city = 'Paris';

/*Q4*/
SELECT customernumber,
       customername,
       contactfirstname || ', ' ||contactlastname AS "lastname,firstname",
       phone
FROM customers
WHERE country = 'Canada';

/*Q5*/
SELECT DISTINCT customernumber
FROM payments
ORDER BY customernumber;

/*Q6*/
SELECT customernumber,
       checknumber,
       amount
FROM payments
WHERE amount NOT BETWEEN 30000 and 65000
ORDER BY amount DESC;

/*Q7*/
SELECT *
FROM orders
WHERE status = 'Cancelled';

/*Q8*/
SELECT productcode,
       productname,
       buyprice,
       msrp,
       (msrp - buyprice) AS markup,
       ROUND(((msrp - buyprice) / buyprice) * 100, 1) AS percmarkup
FROM products;


/*Q9*/
SELECT *
FROM products
WHERE LOWER(productname) LIKE '%co%';

/*Q10*/
SELECT *
FROM customers
WHERE LOWER(contactfirstname) LIKE 's%e%';

/*Q11*/
INSERT INTO employees(
        firstname,
        lastname,
        extension,
        employeenumber,
        email,
        jobtitle,
        officecode,
        reportsto
    )
    VALUES(
        'Han-Kuan',
        'HUANG',
        'x7000',
        7777,
        'hhuang143@myseneca.ca',
        'Cashier',
        4,
        1088
);

/*Q12*/
SELECT *
FROM employees
WHERE employeenumber = 7777;

/*Q13*/
UPDATE employees
SET jobtitle = 'Head Cashier'
WHERE employeenumber = 7777;

/*Q14*/
INSERT INTO employees(
        employeenumber,
        lastname,
        firstname,
        extension,
        email,
        officecode,
        reportsto,
        jobtitle
)
VALUES(
        6666,
        'Jackson',
        'Strom',
        'x8000',
        'jacksonstrom@myseneca.ca',
        4,
        7777,
        'Cashier'
        );
        
/*Q15*/
DELETE FROM employees
WHERE employeenumber = 7777;
// There is a foreign key by fake employee

/*Q16*/
DELETE FROM employees
WHERE employeenumber = 6666;

/*Q17*/
INSERT ALL
    INTO employees(
        firstname,
        lastname,
        extension,
        employeenumber,
        email,
        jobtitle,
        officecode,
        reportsto
    )
    VALUES(
        'Han-Kuan',
        'HUANG',
        'x7000',
        7777,
        'hhuang143@myseneca.ca',
        'Cashier',
        4,
        1088
        )
        INTO employees(
        employeenumber,
        lastname,
        firstname,
        extension,
        email,
        officecode,
        reportsto,
        jobtitle
)
VALUES(
        6666,
        'Jackson',
        'Strom',
        'x8000',
        'jacksonstrom@myseneca.ca',
        4,
        1088,
        'Cashier'
        )
SELECT * FROM dual;

/*Q18*/
DELETE FROM employees
WHERE employeenumber IN (6666, 7777)