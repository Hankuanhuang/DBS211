SELECT *
FROM office;
//thelast command have to add ;

SELECT employeenumber
FROM employees
WHERE officecode = 1; //have to add the ;

SELECT customernumber,
       customername,
       contactfirstname,
       contactlastname,
       phone
FROM customers
WHERE LOWER(CITY) = 'paris';


SELECT customernumber,
       contactlastname || ', ' || contactfirstname AS "firstname,lastname",
       phone
FROM customers
WHERE lOWER(COUNTRY) = 'canada';
// can not forgot the ; at the last line a statement

SELECT DISTINCT customernumber //DISTINCT WILL MAKE THE REPEAT THE SAME CUSTOMER
FROM PAYMENTS
ORDER BY customernumber;

SELECT customernumber,
       checknumber,
       amount
FROM payments
WHERE amount NOT between 30000 and 65000
ORDER BY amount DESC;

SELECT *
FROM orders
WHERE STATUS = 'Cancelled';

SELECT productname
FROM products
WHERE LOWER(productname) like '%co%';
//have to caution about the %__% <- have to use like keywords

SELECT *
FROM customers
WHERE LOWER(contactfirstname) like 's%e%';

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
VALUES (
             8888,
             'HUANG',
             'KEN',
             'X0000',
             'hhuang143@myseneca.ca',
             4,
             1088,
             'Cashier'
);

SELECT *
FROM employees
WHERE employeenumber = 8888;

UPDATE employees
SET jobtitle = 'Head Cashier'
WHERE employeenumber = '8888';


DELETE FROM employees
WHERE employeenumber = 8888;
    /// This statement can delete/rempve the specific data i want to
    
DELETE FROM employees
WHERE employeenumber IN (7777, 8888);
    /// in this statement can remove multiple value in one command

