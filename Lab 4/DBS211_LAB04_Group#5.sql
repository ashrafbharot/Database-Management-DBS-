/* 
/*Group: - 05
1.	Name: - MOHAMED ASHRAF BHAROT
•	Student ID#: 139539225
•	Email: mamabharot@myseneca.ca
2.	Name: - Fenil Hemangbhai Soni
•	Student ID#: 145416228
•	Email: fhsoni@myseneca.ca 
--------------------------------------------------------------------------------------------------


SET AUTOCOMMIT ON;

-- Q1 SOLUTION --

CREATE TABLE employee2 AS 
SELECT
   * 
FROM
   employees 
WHERE
   1 = 0;

-- Q2 SOLUTION --

ALTER TABLE employee2 
ADD username VARCHAR2(100);

-- Q3 SOLUTION --

DELETE 
FROM employee2;

-- Q4 SOLUTION --

INSERT INTO employee2(employeenumber,lastname,firstname,extension,email,officecode,reportsto,jobtitle)
SELECT * FROM employees;

ALTER TABLE employee2 ADD CONSTRAINT pk_employee2_employeenumber PRIMARY KEY (employeenumber);
ALTER TABLE employee2 ADD CONSTRAINT fk_employee2_reportsto FOREIGN KEY (reportsto) REFERENCES employee2 (employeenumber);
ALTER TABLE employee2 ADD CONSTRAINT fk_employee2_officecode FOREIGN KEY (officecode) REFERENCES offices (officecode);


-- Q5 SOLUTION --

INSERT INTO employee2(employeenumber,lastname,firstname,extension,email,officecode,reportsto,jobtitle)
VALUES (1703,'Bharot','Ashraf','x2222','ab@myseneca.ca',4,1088,'cashier');

-- Q6 SOLUTION --

SELECT
   * 
FROM
   employee2 
WHERE
   employeeNumber = 1703;

-- Q7 SOLUTION --

UPDATE employee2
SET jobtitle = 'Head Cashier'
WHERE employeenumber = 1703;

-- Q8 SOLUTION --

INSERT INTO employee2(employeenumber,lastname,firstname,extension,email,officecode,reportsto,jobtitle)
VALUES (1704,'Soni','Fenil','x2223','fs@myseneca.ca',4,1703,'cashier');

-- Q9 SOLUTION --

DELETE FROM employee2 
WHERE employeenumber = 1703;

No the statement for deleting the data failed because the record in the table have a refrence to the  reportsto column.  There is a foregin key constraint.


-- Q10 SOLUTION --

DELETE
FROM
   employee2 
WHERE
   employeenumber = 1704;
   
DELETE
FROM
   employee2 
WHERE
   employeenumber = 1703;

   After deleting the fake employee number which was refrenced to employee number with foregin key refrenece. It allowed to delete the data.    
-- Q11 SOLUTION --

INSERT INTO employee2 (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle, username)
SELECT 1703, 'Soni', 'Fenil', 'x2222', 'fs@myseneca.ca', 4, 1088, 'cashier', NULL FROM dual
UNION ALL
SELECT 1704, 'Bharot', 'Ashraf', 'x2223', 'ab@myseneca.ca', 4, 1088, 'cashier', NULL FROM dual;

-- Q12 SOLUTION --

DELETE 
FROM employee2
WHERE employeenumber IN (1703,1704);

-- Q13 SOLUTION --

UPDATE employee2
SET username = LOWER(SUBSTR(firstName, 1, 1) || lastName);


-- Q14 SOLUTION --
 
DELETE FROM employee2
WHERE officeCode = 4;

 The data can not be deleted as its again have foregion key . Employee is refrenced to another employee's reportst with FK relation.


-- Q15 SOLUTION --

DROP TABLE employee2;
























*/