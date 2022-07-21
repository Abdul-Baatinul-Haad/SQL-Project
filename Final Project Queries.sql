/*Question 9 Queries*/
/*from a - d
a.	List all the Student information from the Student table.
b.	List all the Department information from the Department table.
c.	List all the Lecturer information from the Lecturer table.
d.	List all the Address information from the Address table.*/

SELECT *  FROM [LMT_University].[enroll].[Student]
SELECT *  FROM [LMT_University].[enroll].[Department]
SELECT *  FROM [LMT_University].[enroll].[Lecturer]
SELECT *  FROM [LMT_University].[enroll].[Address]

/*e.List the StudentFullName, StudentDOB, StudentMobile from Student [StudentFullName=StudentFirstName + ‘  ‘ + StudentLastName]*/
SELECT StudentFirstName + ' ' + StudentLastname as StudentFullName, StudentDOB, StudentMobile FROM [enroll].[Student]

/*f.List the StudentID, StudentFirstName, StudentLastName, StudentDOB, StudentMobile from Student StudentRollNo in AddressID 7*/
SELECT StudentID, StudentFirstName, StudentLastname, StudentDOB, StudentMobile FROM [enroll].[Student] WHERE StudentRollNo in (SELECT AddressID From [enroll].[Address] WHERE AddressID = 7);

/*g.List all the student information whose first name is start with 'B'*/
SELECT * FROM [enroll].[Student] WHERE StudentFirstName LIKE 'B%';

/*h.List all the student information whose first name is start and end with 'A'*/
SELECT * FROM [enroll].[Student] WHERE StudentFirstName LIKE 'a%a';

/*i.Count the number of Student from Student table whose DepartmentID 6.*/
SELECT COUNT(StudentID) as Dep6Students FROM [enroll].[Student] WHERE DepartmentID = 6;

/*j.List all the StudentFullName, StudentAge, StudentMobile from Student [StudentFullName= StudentFirstName + ‘  ‘ + StudentLastName][StudentAge= Current date – DOB (in Years)]*/
SELECT StudentFirstName + ' ' + StudentLastname as StudentFullName, DATEDIFF(YEAR,StudentDOB,GETDATE()) as StudentAge, StudentMobile FROM [enroll].[Student]

/*k.List all the StudentFullName, StudentAge, StudentMobile whose Age>23 from Student [StudentFullName= StudentFirstName + ‘  ‘ + StudentLastName][StudentAge= Current date – DOB (in Years)]*/
SELECT StudentFirstName + ' ' + StudentLastname as StudentFullName, DATEDIFF(YEAR,StudentDOB,GETDATE()) as StudentAge, StudentMobile FROM [enroll].[Student] WHERE DATEDIFF(YEAR,StudentDOB,GETDATE()) > 23;

/*l.List all the StudentFullName, StudentAge, StudentMobile whose Age is either 21 or 23 from Student [StudentFullName= StudentFirstName + ‘  ‘ + StudentLastName] [StudentAge= Current date – DOB (in Years)]*/
SELECT StudentFirstName + ' ' + StudentLastname as StudentFullName, DATEDIFF(YEAR,StudentDOB,GETDATE()) as StudentAge, StudentMobile FROM [enroll].[Student] 
WHERE DATEDIFF(YEAR,StudentDOB,GETDATE()) = 21 OR DATEDIFF(YEAR,StudentDOB,GETDATE()) = 23;

/*m.List all the LecturerID, LecturerName, LecturerHighestQualification, LecturerAge from Lecturer*/
SELECT LecturerID, LecturerName,LecturerHighestQualification, LecturerAge FROM [enroll].[Lecturer]

/*n.List all the LecturerID, LecturerName, LecturerHighestQualification, LecturerAge from Lecturer whose HighestQualification is either “MS” or “PhD”.*/
SELECT LecturerID, LecturerName,LecturerHighestQualification, LecturerAge FROM [enroll].[Lecturer] WHERE LecturerHighestQualification = 'MS' or LecturerHighestQualification= 'PHD';

/* o.List all the lecturer information who belongs to DepartmentID 2*/
SELECT LecturerID, LecturerName,LecturerHighestQualification, LecturerAge FROM [enroll].[Lecturer] WHERE DepartmentID = 2;

/*p.List all the lecturer information whose name end with “R”.*/
SELECT * FROM [enroll].[Lecturer] WHERE LecturerName LIKE '%r';

/*q.List all the lecturer information whose name either start or end with “E”.*/
SELECT * FROM [enroll].[Lecturer] WHERE LecturerName LIKE 'e%' OR LecturerName LIKE '%e';

/*r.	List all the lecturer name is in capital letter.*/
SELECT UPPER(LecturerName) FROM [enroll].[Lecturer]

/*s.	Display 5 character from the lecturer name along with LecturerID and LecturerHighestQualification.*/
SELECT LecturerID, LEFT(LecturerName,5), LecturerHighestQualification FROM [enroll].[Lecturer]

/*t.	List LecturerID, LecturerName, LecturerHighestQualification, LecturerAge(in year) [LecturerAge= Current Date – LecturerAge)] (in year).*/
SELECT LecturerID, LecturerName,LecturerHighestQualification, DATEDIFF(YEAR,LecturerAge,GETDATE()) as LecturerAge FROM [enroll].[Lecturer]

/*u.	List DepartmentID, DepartmentName, DepartmentDescription, DepartmentCapacity from Department.*/
SELECT DepartmentID, DepartmentName, DepartmentDescription, DepartmentCapacity FROM [enroll].[Department]

/*v.	List all the Department information who’s DepartmentName is “ECE”.*/
SELECT * FROM [enroll].[Department] WHERE DepartmentName = 'ECE'

/*w.	List all DepartmentName, DepartmentDescription, DepartmentCapacity from Department whose capacity is greater than 60.*/
SELECT DepartmentName, DepartmentDescription, DepartmentCapacity FROM [enroll].[Department] WHERE DepartmentCapacity >60;

/*x.	List all AddressID, StreetAddress, City, State, PostalCode, Country from Address.*/
SELECT AddressID, StreetAddress, City, State, PostalCode, Country FROM [enroll].[Address]

/*y.	List all AddressID, StreetAddress, City, State, PostalCode, Country from Address who belongs to “Poland” country*/
SELECT AddressID, StreetAddress, City, State, PostalCode, Country FROM [enroll].[Address] WHERE Country = 'Poland';

/*z.	List all the Address information whose state is null*/
SELECT * FROM [enroll].[Address] WHERE State is NULL;

/*aa.	List all the Address information whose PostalCode is not null.*/
SELECT * FROM [enroll].[Address] WHERE PostalCode is NULL;

/*bb.	List all the Address information whose City name is "Honda" and Country name is "Colombia"*/
SELECT * FROM [enroll].[Address] WHERE City = 'Honda' AND Country = 'Columbia';



/*Question 10 Queries*/
/*a.	List unique DOB from Student.*/
SELECT DISTINCT StudentDOB as DistinctDOBs FROM [enroll].[Student]

/*b.	List unique DepartmentName from Department.*/
SELECT DISTINCT DepartmentName as DistinctDepName FROM [enroll].[Department]

/*c.	List unique Country name from Address.*/
SELECT DISTINCT Country as Countries FROM [enroll].[Address]

/*d.	List unique State name from Address.*/
SELECT DISTINCT State as States FROM [enroll].[Address] WHERE State is not null;

/*e.	List unique City name from Address.*/
SELECT DISTINCT City as Cities FROM [enroll].[Address]

/*f.	List all the LecturerID, LecturerName, LecturerHighestQualification, LecturerYearService from Lecturer [LecturerYearService= Current Date – LecturerAge] (in year).*/
SELECT LecturerID, LecturerName,LecturerHighestQualification, DATEDIFF(YEAR,LecturerAge,GETDATE()) as LecturerYearService FROM [enroll].[Lecturer]

/*g.	List all the LecturerID, LecturerName, LecturerHighestQualification, LecturerType from Lecturer 
[LecturerType= if LecturerYearService< 5 then "Begining Level Experience" else if LecturerYearService>= 5 and LecturerYearService<10 then "Mid Level experience" else "Experienced".*/
SELECT LecturerID, LecturerName,LecturerHighestQualification,
CASE
	WHEN DATEDIFF(YEAR,LecturerAge,GETDATE()) < 5 THEN 'Begining Level Experience'
	WHEN DATEDIFF(YEAR,LecturerAge,GETDATE()) >= 5 AND DATEDIFF(YEAR,LecturerAge,GETDATE()) < 10 THEN 'Mid Level experience'
	ELSE 'Experienced'
END AS LecturerType
FROM [enroll].[Lecturer];



/*Question 11 Queries*/
/*a.	Display all Student and their Department Information based on the relationship.*/
SELECT Student.StudentID, Student.StudentFirstName,Student.StudentLastName, Department.DepartmentID, Department.DepartmentName, Department.DepartmentDescription,Department.DepartmentCapacity
FROM [enroll].[Student] 
LEFT JOIN [enroll].[Department] ON Student.DepartmentID = Department.DepartmentID

/*b.	Display all Student and their Address Information based on the relationship.*/
SELECT Student.StudentID, Student.StudentFirstName,Student.StudentLastName, Address.AddressID, Address.Country, Address.City, Address.State, Address.StreetAddress,Address.PostalCode
FROM [enroll].[Student] 
LEFT JOIN [enroll].[Address] ON Student.AddressID = Address.AddressID

/*c.	Display all Department and their Lecturer Information based on the relationship.*/
SELECT Department.DepartmentID, Department.DepartmentName, Department.DepartmentDescription,Department.DepartmentCapacity, Lecturer.LecturerID, Lecturer.LecturerName, Lecturer.LecturerHighestQualification
FROM [enroll].[Department] 
LEFT JOIN [enroll].[Lecturer] ON Department.DepartmentID = Lecturer.DepartmentID

/*d.	Display all Student with their Department with Lecturer Information based on the relationship*/
SELECT Student.StudentID, Student.StudentFirstName,Student.StudentLastName, Department.DepartmentID, Department.DepartmentName, Department.DepartmentDescription,Department.DepartmentCapacity,
Lecturer.LecturerID, Lecturer.LecturerName, Lecturer.LecturerHighestQualification FROM [enroll].[Student] 
LEFT JOIN [enroll].[Department] ON Student.DepartmentID = Department.DepartmentID
LEFT JOIN [enroll].[Lecturer] ON Department.DepartmentID = Lecturer.DepartmentID

/*e.	Display all Student with their Address and Department Information based on the relationship.*/
SELECT Student.StudentID, Student.StudentFirstName,Student.StudentLastName, Address.AddressID, Address.Country, Address.City, Address.State, Address.StreetAddress,Address.PostalCode,
Department.DepartmentID, Department.DepartmentName, Department.DepartmentDescription FROM [enroll].[Student] 
LEFT JOIN [enroll].[Address] ON Student.AddressID = Address.AddressID
LEFT JOIN [enroll].[Department] ON Student.DepartmentID = Department.DepartmentID

/*f.	Display all Student with Address, Department and Lecturer Information based on the relationship.*/
SELECT Student.StudentID, Student.StudentFirstName,Student.StudentLastName, Address.AddressID, Address.Country, Address.City, Address.State, Address.StreetAddress,Address.PostalCode,
Department.DepartmentID, Department.DepartmentName, Department.DepartmentDescription, Lecturer.LecturerID, Lecturer.LecturerName, Lecturer.LecturerHighestQualification FROM [enroll].[Student] 
LEFT JOIN [enroll].[Address] ON Student.AddressID = Address.AddressID
LEFT JOIN [enroll].[Department] ON Student.DepartmentID = Department.DepartmentID 
LEFT JOIN [enroll].[Lecturer] ON Department.DepartmentID = Lecturer.DepartmentID

/*g.	Display all Student with Address, Department and Lecturer Information who belongs to either “ME” or “ECE” department.*/
SELECT Student.StudentID, Student.StudentFirstName,Student.StudentLastName,Address.AddressID, Address.Country, Address.City, Address.State, Address.StreetAddress,Address.PostalCode,
Department.DepartmentID, Department.DepartmentName, Department.DepartmentDescription,Department.DepartmentCapacity,
Lecturer.LecturerID, Lecturer.LecturerName, Lecturer.LecturerHighestQualification FROM [enroll].[Student] 
LEFT JOIN [enroll].[Address] ON Student.AddressID = Address.AddressID
LEFT JOIN [enroll].[Department] ON Student.DepartmentID = Department.DepartmentID
LEFT JOIN [enroll].[Lecturer] ON Department.DepartmentID = Lecturer.DepartmentID 
WHERE Department.DepartmentName = 'ME' OR Department.DepartmentName = 'ECE';

/*h.	Display Student with Department and their Lecturer information based on the LecturerHighestQualification either “MS” or “PhD”.*/
SELECT Student.StudentID, Student.StudentFirstName,Student.StudentLastName, Department.DepartmentID, Department.DepartmentName, Department.DepartmentDescription,Department.DepartmentCapacity,
Lecturer.LecturerID, Lecturer.LecturerName, Lecturer.LecturerHighestQualification FROM [enroll].[Student] 
LEFT JOIN [enroll].[Department] ON Student.DepartmentID = Department.DepartmentID
LEFT JOIN [enroll].[Lecturer] ON Department.DepartmentID = Lecturer.DepartmentID WHERE Lecturer.LecturerHighestQualification = 'MS' OR Lecturer.LecturerHighestQualification = 'PhD';

/*i.	Display Student with Department and Address Information, where student belongs to “Thailand” country*/
SELECT Student.StudentID, Student.StudentFirstName,Student.StudentLastName, Address.AddressID, Address.Country, Address.City, Address.State, Address.StreetAddress,Address.PostalCode,
Department.DepartmentID, Department.DepartmentName, Department.DepartmentDescription FROM [enroll].[Student] 
LEFT JOIN [enroll].[Address] ON Student.AddressID = Address.AddressID
LEFT JOIN [enroll].[Department] ON Student.DepartmentID = Department.DepartmentID
WHERE Address.Country = 'Thailand'

/*j.	Display Count of Student, Department wise.
k.	Display Count of Lecturer, Department wise.
l.	Display Count of Student, Country wise.*/
SELECT Department.DepartmentDescription, COUNT(StudentID) AS No_of_Students FROM [enroll].[Student] LEFT JOIN [enroll].[Department] ON Student.DepartmentID = Department.DepartmentID GROUP BY Department.DepartmentDescription
SELECT Department.DepartmentDescription, COUNT(LecturerID) AS No_of_Lecturers FROM [enroll].[Lecturer] LEFT JOIN [enroll].[Department] ON Lecturer.DepartmentID = Department.DepartmentID GROUP BY Department.DepartmentDescription
SELECT Address.Country , COUNT(StudentID) AS No_of_Students FROM [enroll].[Student] LEFT JOIN [enroll].[Address] ON Student.AddressID = Address.AddressID GROUP BY Address.Country



/*Question 12 Queries*/
/*a.	Create new table StudCopy and copy all records from Student table.*/
SELECT * INTO enroll.StudCopy FROM [enroll].[Student]

/*b.	Create a new table DeptCopy and copy only the schema from Department table.*/
SELECT TOP 0 * INTO enroll.DeptCopy FROM [enroll].[Department]

/*c.	Create a new table DepartmentCopy and copy all records from Department table.*/
SELECT * INTO enroll.DepartmentCopy FROM [enroll].[Department]

/*d.	Create a new table AddrCopy and copy only the schema from Address table.*/
SELECT TOP 0 * INTO enroll.AddrCopy FROM [enroll].[Address]

/*e.	Create a new table AddrCopy and copy all the records from Address table.*/
DROP TABLE IF EXISTS enroll.AddrCopy     -- BECAUSE OF THE TABLE CREATED EARLIER WITH THE SAME NAME
SELECT * INTO enroll.AddrCopy FROM [enroll].[Address]

/*f.	Create a new table LecturerCopy and copy all the records from Lecturer table.*/
SELECT * INTO enroll.LecturerCopy FROM [enroll].[Lecturer]



/*Question 13 Queries*/
/*a.	Delete all the records from LecturerCopy table.*/
DELETE FROM [enroll].[LecturerCopy]

/*FOR THE FOLLOWING QUESTIONS WE WILL DELETE THE RECORDS FROM THE TABLE COPIES CREATED*/
/*b.	Delete all the student information for the students who belong to “IT” department.*/
DELETE FROM [enroll].[StudCopy] WHERE EXISTS (SELECT * FROM [enroll].[DepartmentCopy] WHERE DepartmentCopy.DepartmentID =  StudCopy.DepartmentID AND DepartmentCopy.DepartmentName= 'IT') --because the departmentID for the IT department is 1

/*c.	Delete all the student information for the students who belong to “Indonesia” country.*/
DELETE FROM [enroll].[StudCopy] WHERE EXISTS (SELECT * FROM [enroll].[AddrCopy] WHERE AddrCopy.AddressID = StudCopy.AddressID AND AddrCopy.Country = 'Indonesia')

/*d.	Delete all the student information for the student who belongs to “Nanshi” city.*/
DELETE FROM [enroll].[StudCopy] WHERE EXISTS (SELECT * FROM [enroll].[AddrCopy] WHERE AddrCopy.AddressID = StudCopy.AddressID AND AddrCopy.City = 'Nanshi')

/*e.	Delete all the student information for the student who belongs to “Bretagne” state.*/
DELETE FROM [enroll].[StudCopy] WHERE EXISTS (SELECT * FROM [enroll].[AddrCopy] WHERE AddrCopy.AddressID = StudCopy.AddressID AND AddrCopy.State = 'Bretagne')


/*Question 14 Queries*/
/*FOR THE FOLLOWING QUESTIONS WE WILL UPDATE THE RECORDS FROM THE TABLE COPIES CREATED EXCEPT FOR enroll.Lecturer table since there a no records in its copy*/
/*a.	Update StudentMobile for those students who belongs to Department “ME”.*/
UPDATE [enroll].[StudCopy]
SET StudentMobile = 'ME' + StudentMobile
WHERE EXISTS (SELECT * FROM [enroll].[DepartmentCopy] WHERE DepartmentCopy.DepartmentID =  StudCopy.DepartmentID AND DepartmentCopy.DepartmentName= 'ME')

/*b.	Update Student DepartmentID as 3, for the StudentID=42.*/
UPDATE [enroll].[StudCopy]
SET DepartmentID = 3
WHERE StudentID=42

/*c.	Update LecturerHighestQualification as “PHd” for the Lecturer whose LecturerHighestQualification= “PhD”.*/
UPDATE [enroll].[Lecturer]
SET LecturerHighestQualification = 'PHd'
WHERE LecturerHighestQualification= 'PhD'

/*d.	Update PostalCode as “00000” for the Address which contain NULL as a PostalCode.*/
UPDATE [enroll].[AddrCopy]
SET PostalCode = '00000'
WHERE PostalCode IS NULL

/*e.	Update StudentLastName as “Paul” for the Student whose Name is “Jerry”.*/
UPDATE [enroll].[StudCopy]
SET StudentLastName = 'Paul'
WHERE StudentFirstName = 'Jerry'