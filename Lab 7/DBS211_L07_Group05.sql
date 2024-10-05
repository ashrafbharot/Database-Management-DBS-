/* 
/*Group: - 05
1.	Name: - MOHAMED ASHRAF BHAROT
•	Student ID#: 139539225
•	Email: mamabharot@myseneca.ca
2.	Name: - Fenil Hemangbhai Soni
•	Student ID#: 145416228
•	Email: fhsoni@myseneca.ca 

Lab-7
--------------------------------------------------------------------------------------------------

/*
PART A - Transactions
--SOLUTION 01--
the 4 ways that we know that a transaction can be started are:
Any DML commands,
Series of insert or update statements,
Combination of SELECT, UPDATE, and INSERT statements,
BEGIN statement.





--SOLUTION 02--
CREATE TABLE newEmployees AS
SELECT * FROM employees
WHERE 1 = 0;



--SOLUTION 03--
SET AUTOCOMMIT OFF;
SET TRANSACTION READ WRITE;



--SOLUTION 04--
INSERT ALL
INTO newEmployees
VALUES (100, 'Patel', 'Ralph', 22333, 'rpatel@mail.com', 1, NULL, 'Sales Rep')
INTO newEmployees
VALUES (101, 'Denis', 'Betty', 33444, 'bdenis@mail.com', 4, NULL, 'Sales Rep')
INTO newEmployees
VALUES (102, 'Biri', 'Ben', 44555, 'bben@mail.com', 2, NULL, 'Sales Rep')
INTO newEmployees
VALUES (103, 'Newman', 'Chad', 66777, 'nchad@mail.com', 3, NULL, 'Sales Rep')
INTO newEmployees
VALUES (104, 'Ropeburn', 'Audrey', 77888, 'raudrey@mail.com', 1, NULL, 'Sales Rep')
SELECT * FROM dual; 



--SOLUTION 05--
SELECT * FROM newEmployees;

Total 5 rows are selected.



--SOLUTION 06--
ROLLBACK;
SELECT * FROM newEmployees;

No rows were selected as we undo the changes using rollback command.



--SOLUTION 07--
INSERT ALL
INTO newEmployees
VALUES (100, 'Patel', 'Ralph', 22333, 'rpatel@mail.com', 1, NULL, 'Sales Rep')
INTO newEmployees
VALUES (101, 'Denis', 'Betty', 33444, 'bdenis@mail.com', 4, NULL, 'Sales Rep')
INTO newEmployees
VALUES (102, 'Biri', 'Ben', 44555, 'bben@mail.com', 2, NULL, 'Sales Rep')
INTO newEmployees
VALUES (103, 'Newman', 'Chad', 66777, 'nchad@mail.com', 3, NULL, 'Sales Rep')
INTO newEmployees
VALUES (104, 'Ropeburn', 'Audrey', 77888, 'raudrey@mail.com', 1, NULL, 'Sales Rep')
SELECT * FROM dual;
COMMIT;
SELECT * FROM newEmployees;

5 rows are selected.




--SOLUTION 08--
UPDATE newEmployees 
SET jobtitle = 'Unknown';


   
--SOLUTION 09--
COMMIT; 



--SOLUTION 10--
ROLLBACK;

--SOLUTION 10-A  --
SELECT * FROM newEmployees
WHERE jobTitle = 'unknown';

5 rows are still updated.

--SOLUTION 10-B  --
The ROLLBACK command had no effect. As we execute commit before it, which permanently 
updates 'jobTitle' value to 'unknown' in the 'newEmployees' table in the database.

--SOLUTION 10-C  --
In Task 6, we execute rollback before the commit command that allow us to revert the changes. 
However, in this task, we execute rollback after commit command that did not allow us to 
revert the state before the update statement.





--SOLUTION 11--
BEGIN
DELETE FROM newEmployees
END;



--SOLUTION 12--
CREATE VIEW vwNewEmps AS 
SELECT * FROM newEmployees 
ORDER BY lastname, firstname;



--SOLUTION 13--
ROLLBACK;

--SOLUTION 13-A  --
5 rows were retrieved

--SOLUTION 13-B  --
Yes, the Rollback is effective because the delete statement executed in the previous transaction was not committed. 
Therefore, by rollback command, the deleted data was restored."




--SOLUTION 14--
BEGIN
INSERT ALL
INTO newEmployees
VALUES (100, 'Patel', 'Ralph', 22333, 'rpatel@mail.com', 1, NULL, 'Sales Rep')
INTO newEmployees
VALUES (101, 'Denis', 'Betty', 33444, 'bdenis@mail.com', 4, NULL, 'Sales Rep')
INTO newEmployees
VALUES (102, 'Biri', 'Ben', 44555, 'bben@mail.com', 2, NULL, 'Sales Rep')
INTO newEmployees
VALUES (103, 'Newman', 'Chad', 66777, 'nchad@mail.com', 3, NULL, 'Sales Rep')
INTO newEmployees
VALUES (104, 'Ropeburn', 'Audrey', 77888, 'raudrey@mail.com', 1, NULL, 'Sales Rep')
SELECT * FROM dual; 
END;



--SOLUTION 15--
SAVEPOINT insertion;



--SOLUTION 16--
UPDATE newEmployees 
SET jobtitle = 'Unknown';
SELECT * FROM newEmployees;




--SOLUTION 17--
ROLLBACK TO insertion;
SELECT * FROM newEmployees;

The value of the jobtitle in the newEmployees table which was updated to 'Unknown' 
after the 'insertion' Savepoint, has been restored to its previous value because the 
'insertion' Savepoint was rollback.




--SOLUTION 18--
ROLLBACK;

The newEmployees table has been restored to its previous Commit state which was query from question 8.
Therefore, the current query result retrievs 5 records, and the jobtitle column value is 'Unknown'.



Part B - Permissions

--SOLUTION 19--
REVOKE ALL PRIVILEGES ON newEmployees 
FROM PUBLIC;



--SOLUTION 20--
GRANT SELECT ON newEmployees TO ClassmateUsername;  --assuming ClassmateUsername is actual username of someone in class.



--SOLUTION 21--
GRANT INSERT, UPDATE, DELETE ON newEmployees 
TO ClassmateUsername;



   
--SOLUTION 22--
REVOKE ALL PRIVILEGES ON newEmployees 
FROM ClassmateUsername;




Part C – Clean up 

--SOLUTION 23--
DROP VIEW vwNewEmps;
DROP TABLE newEmployees;




*/