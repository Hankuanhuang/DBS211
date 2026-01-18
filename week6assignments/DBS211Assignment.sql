-- ***********************
-- Name: Han-Kuan Huang
-- ID: 141140244
-- Date: 2025/09/25
-- Purpose: Assignment 1 DBS211
-- ***********************

/* Q1 */
SELECT e.employeenumber,
       e.lastname || ', ' || e.firstname AS "employee name",
       o.phone,
       e.extension,
       o.city,
       NVL(TO_CHAR(e.reportsto), 'Unknown') AS managerid,
       CASE
         WHEN m.employeenumber IS NULL THEN 'Unknown'
         ELSE m.lastname || ', ' || m.firstname
       END AS managername
FROM employees e
JOIN offices o
  ON e.officecode = o.officecode
LEFT JOIN employees m
  ON e.reportsto = m.employeenumber
WHERE e.reportsto IS NULL
ORDER BY o.city, e.employeenumber;

/* Q2 */
SELECT e.employeenumber,
       e.firstname || ' ' || e.lastname AS Fullname,
       o.phone,
       e.extension,
       o.city
FROM employees e
JOIN offices o
    ON e.officecode = o.officecode
Where o.city IN('NYC', 'Tokyo','Paris')
ORDER BY o.city, e.employeenumber;

/* Q3 */
SELECT e.employeenumber,
       e.firstname || ' ' || e.lastname AS fullname,
       o.phone,
       e.extension,
       o.city,
       e.reportsto AS manager_id,
       m.firstname || ',' || m.lastname AS manager_name
FROM employees e
JOIN offices o
    ON e.officecode = o.officecode
LEFT JOIN employees m
    ON e.reportsto = m.employeenumber
WHERE o.city IN ('NYC','Tokyo','Paris')
ORDER BY o.city, e.employeenumber;

/* Q4 */
SELECT m.employeenumber AS "Manager ID",
       m.firstname || ' ' || m.lastname AS "Manager Name",
       o.country AS "Country",
       CASE
        WHEN m.reportsto IS NULL THEN 'Does not report to anyone'
        ELSE 'REPORTS to ' || r.firstname || ' ' || r.lastname || '(' || r.jobtitle || ')'
    END AS "Reports To"
FROM employees m
JOIN offices o
    ON m.officecode = o.officecode
LEFT JOIN employees r
    ON m.reportsto = r.employeenumber
WHERE m.employeenumber IN(
    SELECT DISTINCT reportsto
    FROM employees
    WHERE reportsto IS NOT NULL
    )
ORDER BY m.employeenumber;

/* Q5 */
SELECT 
    c.customernumber,
    c.customername,
    p.productcode,
    p.msrp AS "Old Price",
    ROUND(p.msrp * 0.9, 2) AS "New Price"
FROM customers c
JOIN orders o 
    ON c.customernumber = o.customernumber
JOIN orderdetails od 
    ON o.ordernumber = od.ordernumber
JOIN products p 
    ON od.productcode = p.productcode
WHERE p.productvendor = 'Exoto Designs'
  AND od.quantityordered > 55
ORDER BY c.customernumber, p.productcode;

/* Q6 */
SELECT DISTINCT a.priceeach AS "Maximum Price"
FROM orderdetails a
LEFT JOIN orderdetails b
  ON a.productcode = b.productcode
 AND b.priceeach   > a.priceeach
WHERE a.productcode = 'S10_1678'
  AND b.priceeach IS NULL;
