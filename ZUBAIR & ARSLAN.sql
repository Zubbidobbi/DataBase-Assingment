/*
CREATE DATABASE
*/
CREATE DATABASE Assing;

/*
USING DATABASE
*/
USE Assing;

/*
CREATING BRANCH Table
*/
CREATE TABLE BRANCH (
    branchNO VARCHAR(100) NOT NULL PRIMARY KEY,
    street VARCHAR(100),
    city VARCHAR(100),
    postcode VARCHAR(100),
    gender VARCHAR(1), -- Assuming 'M' or 'F' for gender
    CHECK (gender='M' or gender='F')
);

Select *from BRANCH
order by branchNO

INSERT INTO BRANCH VALUES ('B005','22 DEER road','London','SW1 4EH', 'M');
INSERT INTO BRANCH VALUES ('B007','16 Argyll st','aberdeen','AB2 3SU', 'F');
INSERT INTO BRANCH VALUES ('B003','163 main st','Glasgow','G11 9QS', 'M');
INSERT INTO BRANCH VALUES ('B004','32 manse road','bristol','BS99 1NZ', 'M');
INSERT INTO BRANCH VALUES ('B002','56 clover dr','London','NW10 6EU', 'F');
INSERT INTO BRANCH VALUES ('B009','56 clover dr','London','NW10 6EU', 'L'); 

/*
VIEW DATA IN BRANCH TABLE
*/
SELECT * FROM BRANCH;

SELECT street, city FROM BRANCH;

SELECT DISTINCT city FROM BRANCH;

/*
CREATE STAFF TABLE
*/
CREATE TABLE staff (
    staffNO VARCHAR(6) NOT NULL PRIMARY KEY,
    f_name VARCHAR(100),
    l_name VARCHAR(100),
    position VARCHAR(100),
    sex VARCHAR(1), -- Assuming 'M' or 'F' for gender
    dob VARCHAR(100),
    salary INT, -- Assuming salary is an integer
    branchNO VARCHAR(100) NULL,
    FOREIGN KEY (branchNO) REFERENCES BRANCH (branchNO)
);

/*
INSERT DATA INTO TABLE
*/
INSERT INTO staff VALUES ('SL21','ali','hamza','manager','M','01-oct-2003',30000,'B005');
INSERT INTO staff VALUES ('SG37','haziq','naeem','assistant','M','26-jun-2003',12000,'B003');
INSERT INTO staff VALUES ('SG14','mubariz','elahi','supervisor','M','21-jun-2002',18000,'B003');
INSERT INTO staff VALUES ('SA9','akram','iqbal','assistant','M','05-oct-2005',9000,'B007');
INSERT INTO staff VALUES ('SG5','rana','tayab','manager','M','11-oct-2000',24000,'B003');
INSERT INTO staff VALUES ('SL41','ali','akram','assistant','M','05-sep-2001',9000,'B005');

/*
VIEW DATA IN STAFF TABLE
*/
SELECT * FROM staff;

SELECT f_name, salary FROM staff;

SELECT DISTINCT branchNO FROM staff;

/*
CREATE PROPERTYFORRENT TABLE
*/
CREATE TABLE propertyforrent (
    propertyno VARCHAR(6) PRIMARY KEY NOT NULL,
    street VARCHAR(100),
    CITY VARCHAR(100),
    postcode VARCHAR(100),
    [Type] VARCHAR(100),
    room VARCHAR(10),
    rent INT, -- Assuming rent is an integer
    OwnerNO VARCHAR(10),
    staffNO VARCHAR(6),
    branchNO VARCHAR(100),
    FOREIGN KEY (OwnerNO) REFERENCES privateowner (OwnerNO),
    FOREIGN KEY (staffNO) REFERENCES staff (staffNO),
    FOREIGN KEY (branchNO) REFERENCES BRANCH (branchNO)
);


/*
INSERT DATA INTO TABLE
*/
INSERT INTO propertyforrent VALUES ('PA14','16 HOLHEAD','ABRDEEN','AB7 SSU','HOUSE','06',650, 'CO46', 'SA9','B007');
INSERT INTO propertyforrent VALUES ('PL94','6 ARGYLL','LONDON','NW2','FLAT','04',400,'CO87','SL41','B005');
INSERT INTO propertyforrent VALUES ('PG4','6 LAWRENCE','GLASGOW','G11 9QX','FLAT','03',350, 'CO40',NULL,'B003');
INSERT INTO propertyforrent VALUES ('PG36','2 MANOR RD','GLASGOW','G32 4QS','FLAT','03',375,'CO93','SG37','B003');
INSERT INTO propertyforrent VALUES ('PG21','18 DALE RD','GLASGOW','G12','HOUSE','O5',600,'CO87','SG37','B003');
INSERT INTO propertyforrent VALUES ('PG16','5 NOVEAR DR','GLASGOW','G12 9AX','FLAT','04',450,'CO93','SG14','B003');

/*
VIEW DATA IN TABLE
*/
SELECT * FROM propertyforrent;

SELECT street, [Type], branchNO FROM propertyforrent WHERE [Type]='FLAT';

/*
CREATE CLIENT TABLE													

*/
CREATE TABLE CLIENT (
    clientNO VARCHAR(4) NOT NULL PRIMARY KEY,
    fname VARCHAR(100),
    Lname VARCHAR(100),
    telno VARCHAR(11),
    preftype VARCHAR(20),
    maxrent INT, -- Assuming maxrent is an integer
    gender VARCHAR(1),
    CHECK(gender='M' or gender='F')
);

/*
INSERT VALUE INTO TABLE
*/
INSERT INTO CLIENT VALUES ('CR76','AROOJ','anwar', '03334647986' ,'flat',425,'M' );
INSERT INTO CLIENT VALUES ('CR56','ALINA','USMAN', '03334665486' ,'FLAT',350,'M' );
INSERT INTO CLIENT VALUES ('CR74','AMAN','HAZIQ','03334647986','HOUSE',750,'F' );
INSERT INTO CLIENT VALUES ('CR75','AMAN','ALI','03334649686','HOUSE',750,'F' );
INSERT INTO CLIENT VALUES ('CR62','ALI','NADEEM','03334647986','FLAT',600,'M' );

/*
VIEW DATA TABLE
*/
SELECT * FROM CLIENT;

SELECT clientNo, preftype, maxrent FROM CLIENT WHERE maxrent=750;

/*
CREATE TABLE privateowner
*/
CREATE TABLE privateowner (
    OwnerNO VARCHAR(10) PRIMARY KEY,
    Fname VARCHAR(100),
    Lname VARCHAR(100),
    [Address] VARCHAR(50),
    Telno VARCHAR(20),
    Gender VARCHAR(1),
    CHECK(gender='M' or gender='F')
);

/*
INSERT DATA IN TABLE
*/
INSERT INTO privateowner VALUES ('Co46','shifa','Amar',' 2 fergus DR,aberdeen AB2 7SX' ,'03324647489','F');
INSERT INTO privateowner VALUES ('Co87','HAZIQ','NAEEM',' 6 ACHRAY ST,GLASGOW G32 9DX' ,'0424647489', 'M' );
INSERT INTO privateowner VALUES ('Co40','AFFAN','Amar',' 63 WELL ST,GL');
