 /*
   Name       : Han Kuan Huang
   Oracle ID  : dbs211_253nbb15
   Student ID : 141140244    
   Date       : 
   Purpose    : DBS211C50_Lab05
*/


/*Q1*/
SELECT e.employeenumber,
       e.firstname,
       e.lastname,
       o.city,
       o.phone,
       o.postalcode
FROM employees e
JOIN offices o
    ON e.officecode = o.officecode
WHERE  LOWER(o.country) = 'france';

/*Q2*/
SELECT c.customernumber,
       c.customername,
       TO_CHAR(p.paymentdate, 'Mon DD YYYY') AS "Payment Date",
       p.amount
FROM customers c
JOIN payments p 
    ON c.customernumber = p.customernumber
WHERE LOWER(o.country) = 'Canada'
ORDER BY c.customernumber;

/*Q3*/
SELECT c.customernumber,
       c.customername
FROM customers c
LEFT JOIN payments p
    ON c.customernumber = p.customernumber
WHERE c.country = 'USA'
  AND p.customernumber IS NULL
ORDER BY c.customernumber;

/*Q4*/
CREATE OR REPLACE VIEW vwCustomerOrder AS
SELECT c.customernumber,
       o.ordernumber,
       o.orderdate,
       p.productname,
       od.quantityordered,
       od.priceeach
FROM customers c
JOIN orders o
    ON c.customernumber = o.customernumber
JOIN orderdetails od
    ON o.ordernumber = od.ordernumber
JOIN products p
    ON od.productcode = p.productcode;
SELECT * 
FROM vwCustomerOrder;

/*Q5*/  
SELECT v.customernumber,
       v.ordernumber,
       v.orderdate,
       v.productname,
       v.quantityordered,
       v.priceeach
FROM vwCustomerOrder v
JOIN orderdetails od
    ON v.ordernumber = od.ordernumber
WHERE v.customernumber = 124
ORDER BY v.ordernumber, od.orderlinenumber;

///////////////////////
SELECT *
FROM vwCustomerOrder
WHERE customerNumber = 124
ORDER BY orderNumber;
/*Q6*/
SELECT c.customernumber,
       c.contactfirstname AS firstname,
       c.contactlastname  AS lastname,
       c.phone,
       c.creditlimit
FROM customers c
LEFT JOIN orders o
    ON c.customernumber = o.customernumber
WHERE o.customernumber IS NULL
ORDER BY c.customernumber;

/*Q7*/
-- a) Create the view
CREATE OR REPLACE VIEW vwEmployeeManager AS
SELECT
    e.employeenumber,
    e.lastname,
    e.firstname,
    e.extension,
    e.email,
    e.officecode,
    e.reportsto,
    e.jobtitle,
    m.firstname AS manager_firstname,
    m.lastname  AS manager_lastname
FROM employees e
LEFT JOIN employees m
       ON e.reportsto = m.employeenumber;

SELECT *
from vwEmployeeManager;

/*Q8*/
CREATE OR REPLACE VIEW vwEmployeeManager AS
SELECT
    e.employeenumber,
    e.lastname AS employeelastname,
    e.firstname AS employeefirstname,
    e.extension,
    e.email,
    e.officecode,
    e.reportsto,
    e.jobtitle
FROM employees e
JOIN employees m
    ON e.reportsto = m.employeenumber;

SELECT *
from vwEmployeeManager
/*Q9*/
DROP VIEW vwCustomerOrder;
DROP VIEW vwEmployeeManager;
