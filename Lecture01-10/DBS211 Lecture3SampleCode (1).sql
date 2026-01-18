DESC employees;

SELECT *
FROM employees;

select count(*)                         --min,max,avg,sum.......
FROM employees;

SELECT employeenumber,lastname,email AS "email"
FROM employees;

SELECT * 
FROM employees
WHERE employeenumber >1076;

SELECT * 
FROM employees
WHERE EMPLOYEENUMBER=1102 ;  

select * 
from orders 
order by orderdate
DESC;

SELECT * 
FROM ORDERS
WHERE STATUS= 'Shipped';

SELECT * 
FROM ORDERS
WHERE UPPER(STATUS)= 'SHIPPED';        --upper(status)='SHIPPED'

WHERE upper(STATUS)='ON HOLD';

SELECT * 
FROM ORDERS 
WHERE lower(status) = 'shipped'
ORDER BY  ordernumber
DESC;


SELECT * 
FROM orders 
FETCH NEXT 10 ROWS ONLY;


SELECT * 
FROM orders 
WHERE rownum between 1 and 10;

SELECT * 
FROM orders 
WHERE rownum < 5;

SELECT *
FROM CUSTOMERS
WHERE  customernumber IN (103,131) ;         ----customernumber=103 OR
                                                  --customernumber=131;

SELECT ordernumber AS "Num",comments
FROM orders
WHERE comments is null;

SELECT ordernumber AS "id",status,comments
FROM orders
WHERE comments IS NOT NULL;


SELECT  firstname,Lastname,
        UPPER(firstname),LOWER(Lastname),
        LENGTH(Lastname),firstname || ' ' || lastname  AS Fullname
FROM employees;

SELECT firstname,
       SUBSTR(firstname,2,3),Lastname,firstname || ' ' || lastname  AS "Fullname"
FROM employees;

SELECT *
FROM offices
WHERE city like 'NYC';        

SELECT *
FROM offices;

SELECT *
FROM offices
WHERE CITY LIKE '_o%';

SELECT sysdate
FROM dual; 

select 2*7
from dual;

SELECT 2 * 7 AS Output
FROM dual;

INSERT INTO employees
values(1802,'Apted','Ali',2006,'aa@gamil.com',6,1102,'Agent'); 

--how many values?
select * 
from employees
where employeenumber=1621;

update employees
set lastname='Li'
where employeenumber=1621;

select *  
from employees
where employeenumber=1802;

delete 
from employees
where employeenumber=1621;         --without where clause???

select *
from employees;
