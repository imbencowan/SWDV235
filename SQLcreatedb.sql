/* project1
	Ben Cowan
	2018-08-23 */

-- -----------------------	
-- create the database
DROP DATABASE IF EXISTS outdoorsite;
CREATE DATABASE outdoorSite;
USE outdoorSite;		-- sets the database to use


-- ------------------------
-- create an employee table
CREATE TABLE employees (
	employeeID	INT		NOT NULL		PRIMARY KEY		IDENTITY,
	email			VARCHAR(60)		NOT NULL,
	fName			VARCHAR(20)		NOT NULL,
	lName			VARCHAR(30)		NOT NULL,
	hireDate		DATETIME			NOT NULL		DEFAULT CURRENT_TIMESTAMP
);

-- populate employees
INSERT INTO employees
	(fName, lName, email)
VALUES
	('Keera', 'Songuin', 'KSong@outdoorsite.com'),
	('Meelan', 'Kora', 'MKora@outdoorsite.com'),
	('Kyla', 'Shepper', 'KShep@outdoorsite.com'),
	('Brock', 'Moon', 'BMoon@outdoorsite.com'),
	('Tyler', 'Raymon', 'TRaym@outdoorsite.com'),
	('Kai', 'Rizerra', 'KRize@outdoorsite.com'),
	('Klang', 'Mor', 'KMor@outdoorsite.com'),
	('Kroll', 'Singo', 'KSing@outdoorsite.com'),
	('Brolla', 'Endalo', 'BEnda@outdoorsite.com'),
	('Suzy', 'Quentallo', 'SQuen@outdoorsite.com'),
	('Cody', 'McCravin', 'CMccr@outdoorsite.com'),
	('Jenna', 'Brell', 'JBrel@outdoorsite.com'),
	('Branda', 'Bilt', 'BBilt@outdoorsite.com'),
	('Silas', 'Romma', 'SRomm@outdoorsite.com'),
	('Ezrom', 'Tran', 'ETran@outdoorsite.com'),
	('Katy', 'Shipping', 'KShip@outdoorsite.com'),
	('Jenna', 'Blankenboat', 'JBoat@outdoorsite.com'),
	('Jin', 'Wordswood', 'JWord@outdoorsite.com'),
	('Mona', 'Silver', 'MSilv@outdoorsite.com'),
	('Bill', 'Brone', 'BBron@outdoorsite.com');
	
-- -----------------------
-- create the table for the newsletter
CREATE TABLE emailList (
--	emailID		INT(8)			NOT NULL		KEY			IDENTITY,
	email			VARCHAR(60)		NOT NULL		PRIMARY KEY,
	fName			VARCHAR(20)		NOT NULL,
	lName			VARCHAR(30)		NOT NULL,
	startDate	DATETIME			NOT NULL		DEFAULT CURRENT_TIMESTAMP
);

-- populate the newsletter table
INSERT INTO emailList
	(email, fName, lName)
VALUES
	('jj164@gmail.com', 'John', 'Jensen'),
	('whodat@newphone.fm', 'Alex', 'Lewis'),
	('commierockstar@kiergulen.france', 'Austin', 'Neegard Walters'),
	('alwaysannoyed@homeschooled.net', 'Sarah', 'Whittig'),
	('ohgus@gus.gus', 'Gus', 'Arnold'),
	('soprog@woke.tay', 'Taylor', 'Blankenship'),
	('coolestbeard@chill.chill', 'Spencer', 'Hudson'),
	('stayinhome@thepad.fm', 'Cody', 'McCavin'),
	('workinforsomething@myhouse.us', 'Skyler', 'McCavin'),
	('havinkids@jerome.id', 'Spencer', 'McCavin'),
	('mia@icc.gov', 'Alex', 'McCavin'),
	('some@where.us', 'Sheela', 'McQueeny'),
	('narrator21@fight.me', 'Tyler', 'Durden'),
	('chicitabonita@gmail.com', 'Megan', 'Pryor'),
	('lilsumthin@hotmail.com', 'Brielle', 'Smith'),
	('jfd1776@patriot.net', 'John', 'Quincy'),
	('tjforlifer@patriot.net', 'Thomas', 'Jonesmaybe'),
	('jfrealtommy@nowhere.us', 'Johnny', 'Tsunami'),
	('gnargnar@mnarnar.us', 'John', 'Brown'),
	('lsatview234@gmail.com', 'Linnie', 'Jensen');

-- -----------------------	
-- create the table for the contact form
CREATE TABLE contact (
	contactID		INT			NOT NULL		PRIMARY KEY		IDENTITY,
	email				VARCHAR(60)		NOT NULL,
	text				TEXT				NOT NULL,
	contactDate		DATETIME			NOT NULL		DEFAULT CURRENT_TIMESTAMP,
	empAssigned		INT			NOT NULL		DEFAULT 2,
	FOREIGN KEY (empAssigned)
	REFERENCES employees (employeeID)
);

-- populate the contact table
INSERT INTO contact (email, text)
VALUES
	('john@where.com', 'What the hell is really going on here?'),
	('bigley@trumpism.net', 'Hey, i really love this site, just want to say keep up the good work!'),
	('bigbig@bigbig.biz', 'Come to Jamaica, buy our timeshares, this is not a spam'),
	('jessy35@prim.so', 'I can''t find the buy button'),
	('ben@here.now', 'am i really going to be able to come up with 15 more lines of nonsense to fill in here'),
	('thenextone@hereitcomes.us', 'Here is a comment, it''s not a great comment, but it''ll get the job done.'),
	('jeffy16@hotmail.net', 'I''m still learning how all of this works, can you give me some pointers?'),
	('bree@hotmail.com', 'I''d like to see more buying options here, are there plans for any more in the near future?'),
	('devicowa@nope.org', 'Thanks for sharing all of the information that you''ve made available here.'),
	('atleast20@cmon.getit', 'I was really confused by the different buttons here, i think there were more than two.'),
	('mushu@bigdogs.biz', 'Ruff'),
	('isaac@labs.com', 'Where''s the food. I didn''t see any food on this site. Very concerned'),
	('oscar@bigdogs.biz', 'I liked the pictures of the small animals. Is there any way for me to access them?'),
	('oscar@bigdogs.biz', 'I should mention that I''m willing to bark and jump at windows.'),
	('isaac@labs.com', 'I''m still interested in the food.'),
	('mushu@bigdogs.biz', 'awhoooooooooooooooooooooooooorooooooooo'),
	('ringo@pastdogs.net', 'I miss you guys, but i''m happy here. [general good vibes]'),
	('dee742@boeing.com', 'Do you cover more areas than this?'),
	('rod@stewart.net', 'If you want my body, and you think I''m sexy, Cmon baby let me know.'),
	('brock@nevergrowold.us', 'On gears around an uncaring sun, it doesn''t know what it gave, as the bone moon winds round again.');

