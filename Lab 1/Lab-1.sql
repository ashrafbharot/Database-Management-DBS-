/*-- ----------------------------------
-- DBS211 - Lab 01
-- Name: MOHAMED ASHRAF BHAROT
-- StudentID: 139539225
-- Date: 2023-09-08
-- ----------------------------------


1)	How many tables have been created? List the names of the created tables.
-> There are seven(07) talbes created. 
->Names of tables are: Customers, Employees, Offices, OderDetails, Orders, ProductLines and Products.

2)	Click on table customers. Click on the Data tab near the top of the worksheet. How many rows are there in the table customers?
-> There are total 122 rows in the table customer.

3)	What SQL statement would return the same results. Write the statement in the .sql file and execute it.  
->select * from customers;

4)	How many columns does the customers table have? List the column names.
-> There are thirteen(13) columns in customer table.
-> names of column: CustomerNumber, CustomerName, ContactLastName, ContactFirstName, Phone, AddressLine1, AddressLine2, City, State, 
   PostalCode, Country, SalesRepEmployeeNumber and CreditLimit.   

5)	What is the value of each column in the first row in table customers? Write the column name and the column data type in addition 
    to the value.

 
6)	Write the number of rows and columns for the rest of the tables in your schema.  Format it something like the following.
Table Name		  Rows			Columns
Employees          22           08
Offices            07           09
OderDetails        2996         05
Orders             326          07
ProductLines       07           04
Products           110          09

7)	Right Click on the orderdetails table and choose tables/count rows.  How many rows does the order details table include?
-> It shows 2996 rows in the table

8)	Write the following SQL statement in the new tab.
desc offices; 
	You can also write
describe offices;
	What is the result of the statement execution?

-> The statement gives the names of the columns, type and whether its null or not.
    
9)	Type the following statements in, execute them, then briefly describe what the statement is doing!
SELECT * FROM employees;
-> This statement list outs all the details stored in Employees table i.e. EmployeeNumber, LastName, FirstName, Extensions, Email, 
   OfficeCode, ReportSto and JobTitle. It also displays number of rows as well.

SELECT * FROM customer ORDER BY ContactLastName;
-> This statement list out the details of table Customer and it arranges all the data in the alphabetical orders of ContactLastName
   when displaying result of the statement.

10)	How many constraints does the products table have?
-> The products table has 11 constraints.

11)	Find a way to turn on the line numbers in the gutter.
-> Right click on the gutter and select "Toggle Line Numbers".

12)	Set the font size in the worksheet editor to a size that is best for you.  (Hint: Tools/Preferences)

-> Go to Tools->Prefrences->Code Editor->Fonts->Font Size->12

*/