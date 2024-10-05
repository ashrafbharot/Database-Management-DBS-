/* 
/*Group: - 05
1.	Name: - MOHAMED ASHRAF BHAROT
•	Student ID#: 139539225
•	Email: mamabharot@myseneca.ca
2.	Name: - Fenil Hemangbhai Soni
•	Student ID#: 145416228
•	Email: fhsoni@myseneca.ca 
--------------------------------------------------------------------------------------------------

--Q1--

-- Q1 SOLUTION --
--a.):
SELECT 
  e.employeenumber,
  e.firstname,
  e.lastname,
  o.city,
  o.phone,
  o.postalcode
FROM 
  employees e,
  offices o
WHERE 
  e.officecode = o.officecode
  AND o.country = 'France';

--b.):
SELECT 
  e.employeenumber,
  e.firstname,
  e.lastname,
  o.city,
  o.phone,
  o.postalcode
FROM 
  employees e
JOIN 
  offices o ON e.officecode = o.officecode
WHERE 
  o.country = 'France';

--Q2--

SELECT
    c.customerNumber AS "Customer Number",
    c.customerName AS "Customer Name",
    TO_CHAR(p.paymentDate, 'Mon DD, YYYY') AS "Payment Date",
    p.amount AS "Amount"
FROM
    customers c
JOIN
    payments p ON c.customerNumber = p.customerNumber
WHERE
    c.country = 'Canada'
ORDER BY
    c.customerNumber;


--Q3--

SELECT customerNumber, customerName
FROM customers
WHERE country = 'USA'
AND customerNumber NOT IN (
    SELECT DISTINCT customerNumber
    FROM payments
)
ORDER BY customerNumber;

--Q4--6
a.)
CREATE VIEW vwCustomerOrder AS
SELECT
    c.customerNumber AS "Customer Number",
    o.orderNumber AS "Order Number",
    o.orderDate AS "Order Date",
    p.productName AS "Product Name",
    od.quantityOrdered AS "Quantity Ordered",
    od.priceEach AS "Price"
FROM
    customers c
JOIN
    orders o ON c.customerNumber = o.customerNumber
JOIN
    orderdetails od ON o.orderNumber = od.orderNumber
JOIN
    products p ON od.productCode = p.productCode;

b.)
SELECT * FROM vwCustomerOrder;

--Q5--

SELECT
    "Customer Number",
    "Order Number",
    "Order Date",
    "Product Name",
    "Quantity Ordered",
    "Price"
FROM
    vwCustomerOrder
WHERE
    "Customer Number" = 124
ORDER BY
    "Order Number", 
    rownum;

--Q6--

SELECT
    c.customerNumber,
    c.contactFirstName AS "First Name",
    c.contactLastName AS "Last Name",
    c.phone AS "Phone",
    c.creditLimit AS "Credit Limit"
FROM
    customers c
LEFT JOIN
    orders o ON c.customerNumber = o.customerNumber
WHERE
    o.orderNumber IS NULL;

--Q7--

CREATE VIEW vwEmployeeManager AS
SELECT
    E1.employeeNumber,
    E1.firstName AS "Employee First Name",
    E1.lastName AS "Employee Last Name",
    E1.email AS "Employee Email",
    E1.jobTitle AS "Employee Job Title",
    E1.officeCode AS "Employee Office Code",
    E1.reportsTo AS "Manager Employee Number",
    E2.firstName AS "Manager First Name",
    E2.lastName AS "Manager Last Name"
FROM
    employees E1
LEFT JOIN
    employees E2 ON E1.reportsTo = E2.employeeNumber;

--Q8--

CREATE OR REPLACE VIEW vwEmployeeManager AS
SELECT
    E1.employeeNumber,
    E1.firstName AS "Employee First Name",
    E1.lastName AS "Employee Last Name",
    E1.email AS "Employee Email",
    E1.jobTitle AS "Employee Job Title",
    E1.officeCode AS "Employee Office Code",
    E1.reportsTo AS "Manager Employee Number",
    E2.firstName AS "Manager First Name",
    E2.lastName AS "Manager Last Name"
FROM
    employees E1
INNER JOIN
    employees E2 ON E1.reportsTo = E2.employeeNumber
WHERE
    E1.reportsTo IS NOT NULL;

--Q9--

DROP VIEW vwEmployeeManager;
DROP VIEW vwCustomerOrder;



























*/