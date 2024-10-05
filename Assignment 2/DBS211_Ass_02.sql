/***************************************************************************************************************************
GROUP 02
/* 
/*Group: - 05
1.	Name: - MOHAMED ASHRAF BHAROT
•	Student ID#: 139539225
•	Email: mamabharot@myseneca.ca
2.	Name: - Fenil Hemangbhai Soni
•	Student ID#: 145416228
•	Email: fhsoni@myseneca.ca 
--------------------------------------------------------------------------------------------------
Date: 2023-12-03
Purpose: Assignment2 DBS211
We, members of Group2, declare that the attached assignment is our own work in accordance with 
the Seneca Academic Policy. No part of this assignment has been copied manually or electronically
from any other source (including web sites) or distributed to other students.
***************************************************************************************************************************/

--PART II--

CREATE TABLE TRAVELER
(
    traveler_id NUMBER PRIMARY KEY,
    traveler_Fname VARCHAR(50),
    traveler_Lname VARCHAR(50),
    Gender VARCHAR2(10),
    Meal_preference VARCHAR(20)
);

INSERT ALL
INTO TRAVELER VALUES (111,'Andrew','Smith','Male','Vegetrian')
INTO TRAVELER VALUES (112,'Mariam','Daoud','Female','Halal')
INTO TRAVELER VALUES (113,'Yasmine','Ch','Female','Vegetrian')
INTO TRAVELER VALUES (114,'Hasan','Ch','Male','Halal')
SELECT * FROM DUAL;
COMMIT;
 


CREATE TABLE BOOKING (
	BookingID NUMBER PRIMARY KEY,
	BookedOn DATE
);
 
INSERT ALL
INTO BOOKING VALUES (56753365,'28-Jan-19')
INTO BOOKING VALUES (56753936,'25-Jun-19')
SELECT * FROM DUAL;
COMMIT;
 


CREATE TABLE AIRLINE (
	Airline_code VARCHAR(10) PRIMARY KEY,
	Airline_name VARCHAR(100)
);
 
INSERT ALL
INTO AIRLINE VALUES ('AF','Air France')
SELECT * FROM DUAL;
COMMIT;
 


CREATE TABLE AIRCRAFT(
	Aircraft_code VARCHAR(20) PRIMARY KEY,
	Aircraft_desc VARCHAR(100)
);
 
INSERT ALL 
INTO AIRCRAFT VALUES ('772','BOEING 777 285-305 STD')
INTO AIRCRAFT VALUES ('332','AIRBUS INDUSTRIE JET 200-345 STD')
SELECT * FROM DUAL;
COMMIT;
 


CREATE TABLE FLIGHT (
	Flight_num VARCHAR(50) PRIMARY KEY,
	Airline_code VARCHAR(10),
	AirCraft_code VARCHAR(20),
   	operatedBy VARCHAR(10),
    	FOREIGN KEY (Airline_code) REFERENCES AIRLINE(Airline_code),
	FOREIGN KEY (Aircraft_code) REFERENCES AIRCRAFT(Aircraft_code)
);
 
INSERT ALL 
INTO FLIGHT VALUES ('AF393','AF','772','AF')
INTO FLIGHT VALUES ('AF386','AF','772','AF')
INTO FLIGHT VALUES ('AF5106','AF','332','MEA')
SELECT * FROM DUAL;
COMMIT;



CREATE TABLE AIRPORT
(
	Airport_code VARCHAR(10) PRIMARY KEY,
	Airport_name VARCHAR(100),
	city VARCHAR(50)
);
 
INSERT ALL 
INTO AIRPORT VALUES ('YYZ','Toronto Pearson Intl','Toronto')
INTO AIRPORT VALUES ('CDG','Charles de Gaul','Paris')
INTO AIRPORT VALUES ('BEY',NULL,'Beirut')
SELECT * FROM DUAL;
COMMIT;
 


CREATE TABLE TICKET
(
	eticket_num NUMBER PRIMARY KEY,
	BookingID NUMBER,
	traveler_id NUMBER,
	ticket_price NUMBER,
    	taxes_fees NUMBER,
    	FOREIGN KEY (BookingID) REFERENCES BOOKING(BookingID),
    	FOREIGN KEY (traveler_id) REFERENCES TRAVELER(traveler_id)
);
 
INSERT ALL 
INTO TICKET VALUES (573480996631,56753936,111,1200,182)
INTO TICKET VALUES (573480996619,56753365,112,1353,182)
INTO TICKET VALUES (573480996620,56753365,113,1142,180)
INTO TICKET VALUES (573480996621,56753365,114,1142,180)
SELECT * FROM DUAL;
COMMIT;
 


CREATE TABLE FLIGHTBOOKING
(
	BookingID NUMBER,
	Flight_Num VARCHAR(50),
	dep_airport_code VARCHAR(10),
	arr_airport_code VARCHAR(10),
    	dep_date DATE,
    	dep_time VARCHAR(10),
    	arr_date DATE,
    	arr_time VARCHAR(10),
    	PRIMARY KEY(BookingID, Flight_num),
   	FOREIGN KEY (BookingID) REFERENCES BOOKING(BookingID),
   	FOREIGN KEY (Flight_num) REFERENCES FLIGHT(Flight_num),
    	FOREIGN KEY (dep_airport_code) REFERENCES AIRPORT(airport_code),
    	FOREIGN KEY (arr_airport_code) REFERENCES AIRPORT(airport_code)
);
 
INSERT ALL 
INTO FLIGHTBOOKING VALUES (56753365,'AF393','YYZ','CDG','22-Jun-19','9:20 PM','23-Jun-19','10:50 AM')
INTO FLIGHTBOOKING VALUES (56753936,'AF393','YYZ','CDG','22-Jun-19','9:20 PM','23-Jun-19','10:50 PM')
INTO FLIGHTBOOKING VALUES (56753936,'AF386','CDG','YYZ','17-Jun-19','5:00 PM','17-Jun-19','7:20 PM')
INTO FLIGHTBOOKING VALUES (56753365,'AF5106','CDG','BEY','23-Jun-19','1:40 PM','23-Jun-19','6:55 PM')
SELECT * FROM DUAL;
COMMIT;
