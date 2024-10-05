/*Group: - 05
1.	Name: - MOHAMED ASHRAF BHAROT
•	Student ID#: 139539225
•	Email: mamabharot@myseneca.ca
2.	Name: - Fenil Hemangbhai Soni
•	Student ID#: 145416228
•	Email: fhsoni@myseneca.ca 
--------------------------------------------------------------------------------------------------

-- Q1 SOLUTION --

SELECT officecode, city, state, country, phone 
FROM offices;

-- Q2 SOLUTION --

SELECT employeeNumber, firstName, lastName, extension
FROM employees
WHERE officeCode = 1
ORDER BY employeeNumber;


-- Q3 SOLUTION --

SELECT customernumber, customername, contactfirstname, contactlastname
FROM customers
WHERE UPPER(city) = UPPER('Paris')
ORDER BY customernumber;

-- Q4 SOLUTION --

SELECT customerNumber, customerName, contactLastName || ', ' || contactFirstName AS contactName, phone
FROM customers
WHERE UPPER(country) = 'CANADA' 
ORDER BY customerName;


-- Q5 SOLUTION --

SELECT DISTINCT customerNumber
FROM payments
ORDER BY customerNumber
FETCH FIRST 10 ROWS ONLY;


-- Q6 SOLUTION --

SELECT customerNumber, checkNumber, amount
FROM payments
WHERE amount NOT BETWEEN 1500 AND 120000
ORDER BY amount DESC;

-- Q7 SOLUTION --

SELECT orderNumber,orderDate,status,customerNumber 
FROM orders
WHERE UPPER(status) = 'CANCELLED';
ORDER BY orderDate;

-- Q8 SOLUTION --

Select ProductCode,ProductName,BuyPrice,MSRP,(MSRP-BuyPrice) as markup,
ROUND((MSRP-BuyPrice)/BuyPrice*100,1) as percmarkup
From Products
Where (((MSRP-BuyPrice)/BuyPrice)*100) > 140
Order By percmarkup;

-- Q9 SOLUTION --

SELECT ProductCode, ProductName, QuantityInStock
FROM Products
WHERE LOWER(ProductName) LIKE '%co%'
ORDER BY QuantityInStock;

-- Q10 SOLUTION --

SELECT CustomerNumber, ContactFirstName, ContactLastName
FROM customers
WHERE LOWER(ContactFirstName) LIKE 's%e%'
OR UPPER(ContactFirstName) LIKE 'S%E%'
ORDER BY CustomerNumber;













*/
