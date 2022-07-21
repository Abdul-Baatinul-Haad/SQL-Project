Create Database LMT_University

Create Schema enroll

Drop table if exists enroll.Address;
Create table [LMT_University].[enroll].Address(
	AddressID int IDENTITY(1,1) PRIMARY KEY not null,
	StreetAddress varchar(100) null,
	City Varchar(50) not null,
	State varchar(50) null,
	PostalCode varchar(50) null,
	Country varchar(50) not null,
	InsertedOn datetime Default getdate() not null
);

DROP TABLE IF EXISTS [enroll].[Department]
CREATE TABLE [LMT_University].[enroll].Department(
	DepartmentID int IDENTITY(1,1) PRIMARY KEY not null,
	DepartmentName Varchar(50) not null,
	DepartmentDescription varchar(100) not null,
	DepartmentCapacity int not null,
	InsertedOn datetime Default getdate() not null
);

Drop table if exists [enroll].[Lecturer]
create table [LMT_University].[enroll].Lecturer(
	LecturerID int IDENTITY(1,1) PRIMARY KEY not null,
	LecturerName varchar(100) not null,
	LecturerHighestQualification varchar(50) null,
	LecturerAge date not null,
	DepartmentID int FOREIGN KEY references enroll.Department(DepartmentID) not null,
	InsertedOn datetime Default getdate() not null
);

Drop table if exists [LMT_University].enroll.Student
Create table [LMT_University].enroll.Student(
	StudentID int IDENTITY(1,1) PRIMARY KEY not null,
	StudentFirstName varchar(50) not null,
	StudentLastName varchar(50) null,
	StudentDOB date not null,
	StudentMobile varchar(15) null,
	StudentRollNo int not null,
	DepartmentID int FOREIGN KEY references enroll.Department(DepartmentID) not null ,
	AddressID int  FOREIGN KEY references enroll.Address(AddressID) not null,
	InsertedOn datetime Default getdate() not null
);


INSERT INTO [enroll].[Address](StreetAddress,City,State,PostalCode,Country)
Values
('5 Schurz Lane', 'Grybów', NULL, '33-330', 'Poland'),
('628 Waubesa Drive', 'Jinsheng', NULL, NULL,'China'),
('44135 Northfield Way', 'Nowy Dwór Mazowiecki', NULL, '05-160','Poland'),
('335 Bellgrove Road', 'Gaoqiao', NULL, NULL,'China'),
('28 Victoria Junction', 'Bukovek', NULL, '739 84','Czech Republic'),
('6 Stuart Road', 'Wushan', NULL, NULL,'China'),
('730 Barby Street', 'Zhengchang', NULL, NULL,'China'),
('22742 Schiller Street', 'Sumurwaru', NULL, NULL,'Indonesia'),
('31 Elka Junction', 'Cigembong', NULL, NULL,'Indonesia'),
('5 Kenwood Circle', 'Davao', NULL, '8000','Philippines'),
('99 Bunker Hill Crossing', 'Zarasai', NULL, '32001','Lithuania'),
('5 Farragut Center', 'Jaromerice', NULL, '569 44','Czech Republic'),
('25 Lerdahl Street', 'Nanshi', NULL, NULL,'China'),
('918 Bonner Way', 'Phayakkhaphum Phisai', NULL, '44110','Thailand'),
('9 West Alley', 'Sempu', NULL, NULL,'Indonesia'),
('234 Hagan Lane', 'Rennes', 'Bretagne', '35033','France'),
('33942 Eagle Crest Trail', 'Oliveiras', 'Porto', '4745-235','Portugal'),
('20791 Hermina Way', 'B?o L?c', NULL, NULL,'Vietnam'),
('86 Lake View Way', 'Marsa Alam', NULL, NULL,'Egypt'),
('19732 Burning Wood Parkway', 'Piteå', 'Norrbotten', '944 73','Sweden'),
('9320 Oak Valley Road', 'Rathangani', NULL, 'A45','Ireland'),
('2638 Waubesa Circle', 'Honda', NULL, '732048','Columbia'),
('6999 Monument Center', 'Cortes', NULL, '6341','Philippines'),
('1 Warbler Hill', 'Proletar', NULL,NULL,'Tajikistan'),
('1311 Crowley Street', 'Baghlan', NULL, NULL,'Afghanistan'),
('19 Walton Way', 'Öldziyt', NULL, NULL,'Mongolia'),
('1 Glacier Hill', 'Cergy-Pontoise', 'Île-de-France', '95304','France'),
('5094 Gateway Way', 'Živinice', NULL, NULL,'Bosnia and Herzegovina'),
('2 Roth Pass', 'Tuatuka', NULL, NULL,'Indonesia'),
('89531 Northview Road', 'Ganyi', NULL, NULL,'China');

INSERT INTO [enroll].[Department] (DepartmentName, DepartmentDescription, DepartmentCapacity)
VALUES 
('IT', 'Information Technology', 60),
('EE', 'Electrical Engineering', 120),
('CSE', 'Computer Science Engineering', 140),
('ME', 'Mechanical Engineering', 110),
('ECE', 'Electronic and Communication Engineering', 80),
('AEIE', 'Applied Electronics and Instrumentation Engineering', 50);	

insert into  [enroll].[Lecturer](LecturerName, LecturerHighestQualification,LecturerAge,DepartmentID)
values
('Peder Bernaldez', 'M.Tech', '2010-10-10', 6),
('Emile Adolthine', 'PhD', '2010-04-04', 5),
('Titos Iorizzi', 'M.Tech', '2012-04-09', 4),
('Ferris Falck', 'MSC', '2011-05-05', 3),
('Georgie McIlwraith', 'M.Tech', '2017-05-08', 2),
('Karlen Kearn', 'MSC', '2019-03-03', 1),
('Axe Whistlecroft', 'MCA', '2019-03-03', 6),
('Drucie Bazek', 'PhD', '2019-04-01', 5),
('Antony Gamlin', 'M.Tech', '2019-04-01', 4),
('Alexina Moncaster', 'MBA', '2019-04-01', 3),
('Milzie Kabos', 'MCA', '2019-03-03', 2),
('Arlene Glendza', 'MS', '2019-03-03', 1),
('Kirby Kabisch', 'M.Tech', '2019-04-01', 1),
('Selma Eliyahu', 'PhD', '2019-04-01', 2),
('Ilysa Chooter', 'M.Tech', '2019-04-01', 3),
('Rozalie Pennycord', 'MSC', '2010-10-10', 4),
('Dacey Glidder', 'M.Tech', '2010-04-04', 5),
('Claretta Diaper', 'MSC', '2012-04-09', 6),
('Kalil Pendleton', 'MCA', '2011-05-05', 6),
('Trudey Brech', 'PhD', '2011-10-05', 5),
('Gypsy Ambrosini', 'M.Tech', '2011-03-30', 4),
('Lauree Ribbon', 'MBA', '2013-04-04', 3),
('Hugo Valois', 'MCA', '2012-04-29', 2),
('Perren Chetter', 'MS', '2018-05-03', 1),
('Fawn Coffelt', 'M.Tech', '2020-02-26', 1),
('Terrie Golby', 'PhD', '2020-02-26', 2),
('Jeanette Ciraldo', 'M.Tech', '2020-03-26',3),
('Elfrieda Elijahu', 'MSC', '2020-03-26', 4),
('Guthry Blaes', 'M.Tech', '2020-03-26', 5),
('Richy Saice', 'MSC', '2010-04-04', 6);

insert into [enroll].[Student] (StudentFirstName,StudentLastName, StudentDOB,StudentMobile,StudentRollNo,DepartmentID, AddressID)
values 
	('Joey', 'Ironside','1995-11-22', '1276234258', 1,3,1),
	('Karlotta', 'Garraway','1997-07-06', '2192431615', 2,3,24),
	('Jerry', 'Stutte','1996-12-18', '4125425783', 3,1,17),
	('Yehudit', 'Rahill','1995-01-15', '9939485406', 4,2,29),
	('Cele', 'Crosetto','1998-11-24', '3622733725', 5,3,16),
	('Hazlett', 'Mowsdale','1995-04-09', '1482883476', 6,4,23),
	('Carlyn', 'Marks','1996-12-27', '6129154080', 7,5,20),
	('Ellis', 'Boatman','1997-04-29', '8269707118', 8,6,7),
	('Florina', 'Boyack','1997-08-03', '9623352863', 9,3,14),
	('Borg', 'Innett','1997-09-03', '5256034960', 10,1,19),
	('Sayres', 'Jennings','1996-05-12', '8675076454', 11,4,27),
	('Jarid', 'Sprull','1998-11-02', '1391270091', 12,2,6),
	('Elvera', 'Bannard','1996-09-07', '7897232539', 13,4,24),
	('Ody', 'Inggall','1995-03-05', '6094734260', 14,5,25),
	('Curcio', 'McWhan','1996-07-29', '2394865847', 15,6,11),
	('Connie', 'Sinnie','1995-07-19', '1473936221', 16,6,23),
	('Auroora', 'Nel','1996-09-05', '2216400391', 17,3,14),
	('Wendall', 'Rosendale','1999-12-30', '1818120249', 18,3,28),
	('Hadley', 'Bradbury','1996-08-16', '6518067697', 19,1,10),
	('Celine', 'Smales','1999-07-11', '7106508130', 20,2,10),
	('Jesselyn', 'Stevenson','1998-05-16', '9231672206', 21,2,22),
	('Corinna', 'Pinkney','1998-01-16', '8323630067', 22,5,29),
	('Orelle', 'Adamthwaite','1997-07-26', '2539126766', 23,3,17),
	('Howie', 'Seaman','1997-12-01', '9888259627', 24,2,4),
	('Sibyl', 'Corey','1996-07-18', '4493239590', 25,5,11),
	('Ruperta', 'Peaker','1999-05-22', '5124781263', 26,5,4),
	('Delmer', 'Roughey','1995-04-21', '4175314364', 27,3,22),
	('Gifford', 'O`Scannill','1996-10-31', '3134783726', 28,4,22),
	('Hedy', 'O`Hone','1998-03-29', '7316228047', 29,2,17),
	('Shalna', 'Hyde-Chambers','1999-11-23', '7455116160', 30,5,6),
	('Ferdie', 'Di Napoli','1995-01-17', '1905908693', 31,4,30),
	('Piper', 'Giacomuzzo','1998-09-14', '5499340503', 32,6,4),
	('Gerhardt', 'Schruurs','1999-11-18', '8197494894', 33,3,1),
	('Mellicent', 'Buncher','1996-10-03', '4584525312', 34,5,28),
	('Corette', 'Demead','1997-09-17', '4909862137', 35,5,17),
	('Jorgan', 'Barson','1997-05-01', '6022309183', 36,1,21),
	('Koral', 'Bowen','1998-05-12', '4198817454', 37,4,3),
	('Allissa', 'Kitter','1998-08-17', '7328676920', 38,5,7),
	('Townsend', 'Doughtery','1998-04-13', '2639777958', 39,4,7),
	('Yolane', 'Geratt','1998-06-10', '2069585951', 40,6,17),
	('Chrystel', 'Allwood','1996-09-07', '6958461692', 41,3,25),
	('Dyana', 'Clutterbuck','1997-09-22', '5842483886', 42,1,1),
	('Nikki', 'Edy','1999-01-10', '5096155315', 43,6,25),
	('Hendrik', 'Surr','1997-04-05', '2021255732', 44,5,11),
	('Marta', 'Bosch','1998-09-28', '4075136713', 45,6,5),
	('Garrik', 'Pell','1999-04-14', '3071057649', 46,6,7),
	('Stormi', 'Colbron','1998-10-21', '9968113654', 47,3,28),
	('Angelique', 'Lacivelli','1995-06-07', '9518365081', 48,5,7),
	('Zack', 'Hefforde','1999-07-25', '5455693035', 49,1,29),
	('Gusella', 'Pettiford','1999-08-23', '2425172721', 50,4,3);
