DROP DATABASE TRAVELDB;
CREATE DATABASE TRAVELDB;
USE TRAVELDB;
CREATE TABLE COUNTRY 
(
Country_Name 		VARCHAR(30)		NOT NULL,
Population			INT				NOT NULL,
PRIMARY KEY (Country_Name),
CONSTRAINT Population_Check CHECK (Population >= 0)
);

INSERT INTO COUNTRY(Country_Name, Population)
VALUES ('Spain', 48146134), ('France', 66553766), 
('Belgium', 11323973), ('Monaco', 37731), 
('Ireland', 4892305);

CREATE TABLE LANGUAGE
(
Name				VARCHAR(30)		NOT NULL,
PRIMARY KEY (Name)
);

INSERT INTO LANGUAGE
VALUES ('English'), ('Spanish'), ('Catalan'), ('German'), 
('Italian'), ('French'), ('Flemish'), ('Dutch'), ('Greek'),
('Valencian'), ('Galician'), ('Basque'), ('Gaelic'), ('Portuguese');

CREATE TABLE COUNTRY_LANGUAGE
(
Lang_Name			VARCHAR(30)		NOT NULL,
Country_Name		VARCHAR(30)		NOT NULL,
PRIMARY KEY (Lang_Name, Country_Name),
FOREIGN KEY (Country_Name) REFERENCES COUNTRY (Country_Name),
FOREIGN KEY (Lang_Name) REFERENCES LANGUAGE (Name)
);

INSERT INTO COUNTRY_LANGUAGE(Country_Name, Lang_Name)
VALUES ('Spain', 'Spanish'), ('France', 'French'), 
('Belgium', 'French'), ('Belgium', 'Dutch'), 
('Belgium', 'German'), ('Monaco', 'French'), 
('Ireland', 'English'), ('Ireland', 'Gaelic');

CREATE TABLE CITY
(
 Country_Name		VARCHAR(30)		NOT NULL,
 City_Name			VARCHAR(30)		NOT NULL,
 Longitude			VARCHAR(7)		NOT NULL,
 Latitude			VARCHAR(7)		NOT NULL,
 City_Population	INT				NOT NULL,
 PRIMARY KEY (Country_Name, City_Name),
 UNIQUE (Longitude, Latitude),
 FOREIGN KEY (Country_Name) REFERENCES COUNTRY (Country_Name),
 CONSTRAINT GPS_Check CHECK ( Latitude >= -90 AND Latitude <= 90 AND Longitude >= -180 AND Longitude <= 180),
 CONSTRAINT City_Population_Check CHECK (City_Population >= 0)
);

INSERT INTO CITY
VALUES ('Spain', 'Madrid', '03 41 W', '40 24 N', 6489162), ('Spain', 'Barcelona', '02 11 E', '41 23 N', 5375774),
('Spain', 'Valencia', '00 23 W', '39 28 N', 2516818), ('Ireland', 'Dublin', '06 15 W', '53 20 N', 1801040),
('France', 'Paris', '02 20 E', '48 52 N', 12405426), ('Monaco', 'Monaco', '07 25 E', '43 43 N', 37731),
('Belgium', 'Brussels', '04 21 E', '50 51 N', 1837000), ('France', 'Nice', '07 26 N', '43 71 N', 2537000);

CREATE TABLE CAPITAL
(
 Country_Name		VARCHAR(30)		NOT NULL,
 City_Name			VARCHAR(30)		NOT NULL,
 PRIMARY KEY (Country_Name, City_Name),
 FOREIGN KEY (Country_Name, City_Name) REFERENCES CITY (Country_Name, City_Name)
);

INSERT INTO CAPITAL
VALUES ('Spain', 'Madrid'), ('France', 'Paris'),
('Belgium', 'Brussels'), ('Monaco', 'Monaco'),
('Ireland', 'Dublin');

CREATE TABLE CITY_LANGUAGE
(
 Lang_Name			VARCHAR(30)		NOT NULL,
 Country_Name		VARCHAR(30)		NOT NULL,
 City_Name			VARCHAR(30)		NOT NULL,
 PRIMARY KEY (Lang_Name, Country_Name, City_Name),
 FOREIGN KEY (Country_Name, City_Name) REFERENCES City (Country_Name, City_Name),
 FOREIGN KEY (Lang_Name) REFERENCES LANGUAGE (Name)
);

INSERT INTO CITY_LANGUAGE
VALUES ('Spanish', 'Spain', 'Madrid'), ('Spanish', 'Spain', 'Barcelona'),
('Catalan', 'Spain', 'Barcelona'), ('Spanish', 'Spain', 'Valencia'),
('Valencian', 'Spain', 'Valencia'), ('English', 'Ireland', 'Dublin'),
('Gaelic', 'Ireland', 'Dublin'), ('French', 'France', 'Paris'),
('French', 'Monaco', 'Monaco'), ('French', 'Belgium', 'Brussels'),
('Dutch', 'Belgium', 'Brussels'), ('French', 'France', 'Nice');

CREATE TABLE LOCATION 
(
 Country_Name		VARCHAR(30)		NOT NULL,
 City_Name			VARCHAR(30)		NOT NULL,
 Address			VARCHAR(35)		NOT NULL,
 Loc_Name			VARCHAR(30)		NOT NULL,
 Cost				INT				NOT NULL,
 Loc_Type			VARCHAR(10)		NOT NULL,
 STD_Discount		BOOLEAN			NOT NULL,
 PRIMARY KEY (Country_Name, City_Name, Address),
 FOREIGN KEY (Country_Name, City_Name) REFERENCES CITY (Country_Name, City_Name),
CONSTRAINT Location_Check CHECK ( Loc_Type IN ('Museum', 'Stadium', 'Restaurant', 'Plaza', 'Park', 'Memorial', 'Church', 'Other'))
);

INSERT INTO LOCATION (Loc_Name, Address, City_Name, Country_Name, Loc_Type, Cost, STD_Discount)
VALUES ('Retiro Park', '101 Disney Way', 'Madrid', 'Spain', 'Park', 0, false),
('The Prado', '102 Disney Way', 'Madrid', 'Spain', 'Museum', 15, true),
('Royal Palace', '103 Disney Way', 'Madrid', 'Spain', 'Museum', 13, true),
('Opera House', '104 Disney Way', 'Madrid', 'Spain', 'Other', 0, false),
('Reina Sofia', '105 Disney Way', 'Madrid', 'Spain', 'Museum', 17, true),
('Arc d''Triomf', '106 Disney Way', 'Barcelona', 'Spain', 'Other', 0, false),
('Camp Nou', '107 Disney Way', 'Barcelona', 'Spain', 'Stadium', 0, false),
('Sagrada Familia', '108 Disney Way', 'Barcelona', 'Spain', 'Church', 15, true),
('Parc Guell', '109 Disney Way', 'Barcelona', 'Spain', 'Park', 8, false),
('Teatre Apolo', '110 Disney Way', 'Barcelona', 'Spain', 'Other', 0, false),
('Eiffle Tower', '111 Disney Way', 'Paris', 'France', 'Other', 14, true),
('Louvre', '112 Disney Way', 'Paris', 'France', 'Museum', 25, true),
('Notre Dame', '113 Disney Way', 'Paris', 'France', 'Church', 0, false),
('Moulin Rouge', '114 Disney Way', 'Paris', 'France', 'Restaurant', 0, false);

CREATE TABLE EVENT 
(
 Country_Name		VARCHAR(30)		NOT NULL,
 City_Name			VARCHAR(30)		NOT NULL,
 Address			VARCHAR(35)		NOT NULL,
 Event_Name			VARCHAR(50)		NOT NULL,
 Event_Date			DATE			NOT NULL,
 Start_Time			TIME			NOT NULL,
 Cost				DECIMAL(6,2)	NOT NULL,
 End_Time			TIME,
 STD_Discount		BOOLEAN			NOT NULL,
 Description		VARCHAR(1000)	NOT NULL,
 Category			VARCHAR(12)		NOT NULL,
 PRIMARY KEY (Country_Name, City_Name, Address, Event_Name, Event_Date, Start_Time),
 FOREIGN KEY (Country_Name, City_Name, Address) REFERENCES LOCATION (Country_Name, City_Name, Address),
CONSTRAINT Event_Check CHECK ( Category IN ('Concert', 'Sports Match', 'Race', 'Festival', 'Presentation')),
CONSTRAINT Cost_Check CHECK (Cost >= 0 and STD_Discount >= 0)
 );
 
 INSERT INTO EVENT(Event_Name, Address, City_Name, Country_Name, Event_Date, 
 Start_Time, End_Time, Cost, STD_Discount, Category, Description)
 VALUES ('Beauty and the Beast Sing Along', '106 Disney Way', 'Barcelona', 'Spain', '2016-04-25', '18:00', '20:30', 15, true, 'Concert',
 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
 sed do eiusmod tempor incididunt ut labore et dolore magna 
 aliqua. Ut enim ad minim veniam, quis nostrud exercitation
 ullamco laboris nisi ut aliquip ex ea commodo consequat.'),
 ('Animating Finding Dory', '109 Disney Way', 'Barcelona', 'Spain', '2016-08-01', '19:30', NULL, 0, false, 'Presentation',
 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
 sed do eiusmod tempor incididunt ut labore et dolore magna 
 aliqua. Ut enim ad minim veniam, quis nostrud exercitation
 ullamco laboris nisi ut aliquip ex ea commodo consequat.'),
 ('Brother Bear Live', '110 Disney Way', 'Barcelona', 'Spain', '2016-05-06', '15:00', '17:00', 20, false, 'Concert',
 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
 sed do eiusmod tempor incididunt ut labore et dolore magna 
 aliqua. Ut enim ad minim veniam, quis nostrud exercitation
 ullamco laboris nisi ut aliquip ex ea commodo consequat.'),
 ('Why Jane Is A Boss', '109 Disney Way', 'Barcelona', 'Spain', '2016-06-09', '17:30', NULL, 5, true, 'Presentation',
 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
 sed do eiusmod tempor incididunt ut labore et dolore magna 
 aliqua. Ut enim ad minim veniam, quis nostrud exercitation
 ullamco laboris nisi ut aliquip ex ea commodo consequat.'),
 ('Beauty and the Beast Sing Along', '106 Disney Way', 'Barcelona', 'Spain', '2016-07-01', '20:00', '22:30', 15, true, 'Concert',
 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
 sed do eiusmod tempor incididunt ut labore et dolore magna 
 aliqua. Ut enim ad minim veniam, quis nostrud exercitation
 ullamco laboris nisi ut aliquip ex ea commodo consequat.'),
 ('Olaf vs. Sven', '107 Disney Way', 'Barcelona', 'Spain', '2016-07-03', '20:00', '23:00', 30, false, 'Sports Match',
 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
 sed do eiusmod tempor incididunt ut labore et dolore magna 
 aliqua. Ut enim ad minim veniam, quis nostrud exercitation
 ullamco laboris nisi ut aliquip ex ea commodo consequat.'),
 ('Race to Defeat the Huns', '111 Disney Way', 'Paris', 'France', '2016-05-09', '12:00', NULL, 40, false, 'Race',
 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
 sed do eiusmod tempor incididunt ut labore et dolore magna 
 aliqua. Ut enim ad minim veniam, quis nostrud exercitation
 ullamco laboris nisi ut aliquip ex ea commodo consequat.'),
 ('Disney Convention', '112 Disney Way', 'Paris', 'France', '2016-01-25', '19:00', '23:00', 35, false, 'Festival',
 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
 sed do eiusmod tempor incididunt ut labore et dolore magna 
 aliqua. Ut enim ad minim veniam, quis nostrud exercitation
 ullamco laboris nisi ut aliquip ex ea commodo consequat.'),
 ('Race to See the Floating Lanterns', '111 Disney Way', 'Paris', 'France', '2016-03-22', '06:00', '12:00', 50, false, 'Race',
 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
 sed do eiusmod tempor incididunt ut labore et dolore magna 
 aliqua. Ut enim ad minim veniam, quis nostrud exercitation
 ullamco laboris nisi ut aliquip ex ea commodo consequat.'),
 ('Brother Bear Live', '114 Disney Way', 'Paris', 'France', '2016-06-01', '15:00', '17:00', 20, true, 'Concert',
 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
 sed do eiusmod tempor incididunt ut labore et dolore magna 
 aliqua. Ut enim ad minim veniam, quis nostrud exercitation
 ullamco laboris nisi ut aliquip ex ea commodo consequat.');

CREATE TABLE USER
(
 Username			VARCHAR(15)		NOT NULL,
 Email				VARCHAR(50)		NOT NULL,
 Password			VARCHAR(30)		NOT NULL,
 isManager			BOOLEAN			NOT NULL,
 PRIMARY KEY (Username),
 UNIQUE (Email)
);

INSERT INTO USER
VALUES ('pearson', 'p@gt', '123', false), ('jacob', 'j@gt', '123', false),
('boots', 'boots@gt', '123', false), ('mgr', 'mgr@gttravel', '123', true),
('drew', 'ateachout@gt', '69', false);

CREATE TABLE CITY_REVIEW
(
 Username			VARCHAR(30)		NOT NULL,
 Date_Written		DATE			NOT NULL,
 City_Name			VARCHAR(30)		NOT NULL,
 Country_Name		VARCHAR(30)		NOT NULL,
 Score				INT				NOT NULL,
 Description			VARCHAR(1000)		NOT NULL,
 PRIMARY KEY (Username, Date_Written, Country_Name, City_Name),
 FOREIGN KEY (Country_Name, City_Name) REFERENCES CITY (Country_Name,    City_Name),
 FOREIGN KEY (Username) REFERENCES USER (Username),
 CONSTRAINT Score_Check CHECK (Score >= 1 AND Score <= 5)
 );

INSERT INTO CITY_REVIEW
VALUES ('pearson', '2016-07-13', 'Barcelona', 'Spain', 5, 'Just an amazing city!'),
('boots', '2016-07-14', 'Paris', 'France', 4, 'Just an amazing city!'),
('jacob', '2016-07-15', 'Paris', 'France', 4, 'Just an amazing city!'),
('drew', '2016-07-16', 'Paris', 'France', 3, 'Just an amazing city!'),
('pearson', '2016-07-17', 'Nice', 'France', 5, 'Just an amazing city!'),
('drew', '2016-07-17', 'Paris', 'France', 1, 'The streets were flooded.'),
('drew', '2016-07-15', 'Brussels', 'Belgium', 2, 'Not enough chocolate!');

CREATE TABLE LOCATION_REVIEW
(
 Username			VARCHAR(15)		NOT NULL,
 Date_Written 		DATE			NOT NULL,
 Address			VARCHAR(100)	NOT NULL,
 Country_Name		VARCHAR(30)		NOT NULL,
 City_Name			VARCHAR(30)		NOT NULL,
 Score				INT				NOT NULL,
 Description			VARCHAR(1000)		NOT NULL,
 PRIMARY KEY (Username, Date_Written, Country_Name, City_Name, Address),
 FOREIGN KEY (Country_Name, City_Name, Address) REFERENCES      LOCATION(Country_Name, City_Name, Address),
 FOREIGN KEY (Username) REFERENCES USER (Username),
 CONSTRAINT Score_Check CHECK (Score >= 1 AND Score <= 5)
);

INSERT INTO LOCATION_REVIEW
VALUES ('pearson', '2016-07-12', '106 Disney Way', 'Spain', 'Barcelona', 5, 'Beautiful. Love it!'),
('jacob', '2016-07-11', '106 Disney Way', 'Spain', 'Barcelona', 4, 'Beautiful. Love it!'),
('drew', '2016-07-12', '106 Disney Way', 'Spain', 'Barcelona', 5, 'Beautiful. Love it!'),
('pearson', '2016-07-11', '107 Disney Way', 'Spain', 'Barcelona', 5, 'I love soccer, amazing'),
('jacob', '2016-07-12', '107 Disney Way', 'Spain', 'Barcelona', 1, 'Didn''t see the locker room.');

CREATE TABLE EVENT_REVIEW
(
 Username			VARCHAR(15)		NOT NULL,
 Date_Written 		DATE			NOT NULL,
 Address			VARCHAR(100)	NOT NULL,
 Country_Name		VARCHAR(30)		NOT NULL,
 City_Name			VARCHAR(30)		NOT NULL,
 Event_Name			VARCHAR(50)		NOT NULL,
 Event_Date			DATE			NOT NULL,
 Start_Time			TIME			NOT NULL,
 Score				INT				NOT NULL,
 Description			VARCHAR(1000)		NOT NULL,
 PRIMARY KEY (Username, Date_Written, Country_Name, City_Name, Address,  Event_Name, Event_Date, Start_Time),
 FOREIGN KEY (Country_Name, City_Name, Address, Event_Name, Event_Date, Start_Time) REFERENCES EVENT (Country_Name, City_Name, Address, Event_Name, Event_Date, Start_Time),
 FOREIGN KEY (Username) REFERENCES USER (Username),
 CONSTRAINT Score_Check CHECK (Score >= 1 AND Score <= 5)
 );
 
 INSERT INTO EVENT_REVIEW
 VALUES ('pearson', '2016-07-20', '106 Disney Way', 'Spain', 'Barcelona', 'Beauty and the Beast Sing Along', '2016-07-01', '20:00', 5, 'So cool!');
 
 CREATE VIEW AVE_CITY_SCORE AS
 SELECT Country_Name, City_Name, AVG(Score) AS AVG_Score
 FROM CITY_REVIEW
 GROUP BY City_Name
 ORDER BY AVG_SCORE DESC;
 
 CREATE VIEW AVE_LOCATION_SCORE AS
 SELECT Country_Name, City_Name, Loc_Name, Address, AVG(Score) AS AVG_Score
 FROM LOCATION_REVIEW NATURAL JOIN LOCATION 
 GROUP BY Address
 ORDER BY AVG_SCORE DESC;
 
 CREATE VIEW AVE_EVENT_SCORE AS
 SELECT Country_Name, City_Name, Event_Name, Event_Date, Address, AVG(Score) AS AVG_Score
 FROM EVENT_REVIEW
 GROUP BY Event_Name, Address
 ORDER BY AVG_Score DESC;
 
 # This view creates a table of Spanish cities and how many languages they have
CREATE VIEW SPANISH_CITIES AS
SELECT City_Name, COUNT(*) as Languages_Spoken
FROM CITY_LANGUAGE
WHERE Country_Name = 'Spain'
GROUP BY City_Name;

CREATE View Two_Lang As
SELECT Country_Name, Lang_Name
FROM Country_Language NATURAL JOIN Country
ORDER BY Country_Name;