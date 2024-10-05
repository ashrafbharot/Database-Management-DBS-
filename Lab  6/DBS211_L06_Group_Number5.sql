/*
Group: - 05
1.	Name: - MOHAMED ASHRAF BHAROT
•	Student ID#: 139539225
•	Email: mamabharot@myseneca.ca
2.	Name: - Fenil Hemangbhai Soni
•	Student ID#: 145416228
•	Email: fhsoni@myseneca.ca 

Date:- 2023-10-04
Purpose: LAB 06 DBS211
*/
--------------------------------------------------------------------------------------------------

-- Q1 SOLUTION --
CREATE TABLE L6_MOVIES ( 
	mid INT PRIMARY KEY,
	title VARCHAR(35) NOT NULL,
	releaseYear INT NOT NULL,
	director INT NOT NULL,
	score DECIMAL(3,2) CHECK (score < 5 AND score > 0)
);

CREATE TABLE L6_ACTORS (
	aid INT PRIMARY KEY,
	firstName VARCHAR(20) NOT NULL,
	lastName VARCHAR(30) NOT NULL
);

CREATE TABLE L6_CASTINGS (
    movieid INT,
    actorid INT,
    PRIMARY KEY (movieid, actorid),
    CONSTRAINT cast_movie_fk FOREIGN KEY (movieid) REFERENCES L6_MOVIES(mid) ON DELETE CASCADE,
    CONSTRAINT cast_actor_fk FOREIGN KEY (actorid) REFERENCES L6_ACTORS(aid) ON DELETE CASCADE
);

CREATE TABLE L6_DIRECTORS (
    directorid INT PRIMARY KEY,
    firstname VARCHAR(20) NOT NULL,
    lastname VARCHAR(30) NOT NULL
);


-- Q2 SOLUTION --
ALTER TABLE L6_MOVIES
ADD CONSTRAINT movies_directors_fk FOREIGN KEY(director) REFERENCES L6_DIRECTORS(directorid);

-- Q3 SOLUTION --
ALTER TABLE L6_MOVIES
ADD CONSTRAINT title UNIQUE(title);


-- Q4 SOLUTION --

INSERT INTO L6_Directors(directorid, firstname, lastname)
VALUES(1010, 'Rob', 'Minkoff');
INSERT INTO L6_directors(directorid, firstname, lastname)
VALUES(1020,'Bill','Condon');
INSERT INTO L6_Directors(directorid, firstname, lastname)
VALUES(1050, 'Josh', 'Cooley');
INSERT INTO L6_Directors(directorid, firstname, lastname)
VALUES(2010, 'Brad', 'Bird');
INSERT INTO L6_Directors(directorid, firstname, lastname)
VALUES(3020, 'Lake', 'Bell');

INSERT INTO L6_MOVIES(mid, title, releaseYear, director, score)
VALUES(100, 'The Lion King', 2019, 3020, 3.50);
INSERT INTO L6_MOVIES(Mid, Title, releaseYear, director, score)
VALUES(200,'Beauty and the Beast', 2017, 1050, 4.20);
INSERT INTO L6_MOVIES(Mid, Title, releaseYear, director, score)
VALUES(300, 'Toy Story 4', 2019, 1020, 4.50);
INSERT INTO L6_MOVIES(Mid, Title, releaseYear, director, score)
VALUES(400, 'Mission Impossible', 2018, 2010, 5.00);
INSERT INTO L6_MOVIES(Mid, Title, releaseYear, director, score)
VALUES(500, 'The Secret Life of Pets', 2016, 1010, 3.90); 

-- Q5 SOLUTION --

DROP TABLE L6_CASTINGS CASCADE CONSTRAINTS;
DROP TABLE L6_ACTORS CASCADE CONSTRAINTS;
DROP TABLE L6_MOVIES CASCADE CONSTRAINTS;
DROP TABLE L6_DIRECTORS CASCADE CONSTRAINTS;


-- Q6 SOLUTION --

CREATE TABLE employee2 AS 
SELECT
   * 
FROM
   employees;


-- Q7 SOLUTION --

ALTER TABLE employee2 ADD username VARCHAR(50);

-- Q8 SOLUTION --

DELETE
FROM
   employee2;
   

-- Q9 SOLUTION --

INSERT INTO
   employee2(employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle) 
   SELECT
      employeenumber,
      lastname,
      firstname,
      extension,
      email,
      officecode,
      reportsto,
      jobtitle 
   FROM
      employees;
   

-- Q10 SOLUTION --

UPDATE
   employee2 
SET
   firstname = 'Harold', lastname = 'Talavera' 
WHERE
   employeenumber = 1002;

-- Q11 SOLUTION --
UPDATE
   employee2 
SET
   username = LOWER(SUBSTR(firstname, 0, 1) || lastname);

-- Q12 SOLUTION --
DELETE
FROM
   employee2 a 
WHERE
   a.reportsto IN 
   (
      SELECT
         b.employeenumber 
      FROM
         employee2 b 
      WHERE
         b.officecode = 4 
   )
;
DELETE
FROM
   employee2 
WHERE
   officecode = 4;

-- Q13 SOLUTION --
DROP TABLE employee2;