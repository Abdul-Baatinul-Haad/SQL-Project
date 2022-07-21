--Part 1
Create database Assignment_Training;
use Assignment_Training;
CREATE TABLE dbo.Employee(
	ID int,
	FullName nvarchar(101),
	BirthDate date,
	EmailAddress nvarchar(50),
	Phone nvarchar(25)
)



	Insert into [dbo].[Employee]([ID], [FullName], [BirthDate], [EmailAddress], [Phone])
	Values
	(1,'Guy Gilbert','1981-11-12','guy1@adventure-works.com','320-555-0195'),
	(2,'Kevin Brown','1986-12-01','kevin0@adventure-works.com','150-555-0189'),
	(3,'Roberto Tamburello','1974-06-12','roberto0@adventure-works.com','212-555-0187'),
	(4,'Rob Walters','1974-07-23','rob0@adventure-works.com','612-555-0100'),
	(5,'Rob Walters','1974-07-23','rob0@adventure-works.com','612-555-0100'),
	(6,'Thierry D Hers','1959-02-26','thierry0@adventure-works.com','168-555-0183'),
	(7,'David Bradley','1974-10-17','david0@adventure-works.com','913-555-0172'),
	(8,'David Bradley','1974-10-17','david0@adventure-works.com','913-555-0172'),
	(9,'JoLynn Dobney','1955-08-16','jolynn0@adventure-works.com','903-555-0145'),
	(10,'Ruth Ellerbrock','1956-01-03','ruth0@adventure-works.com','145-555-0130');



	Select 
		[ID], 
		[FullName], 
		[BirthDate], 
		[EmailAddress], 
		[Phone]
	From [dbo].[Employee]


	Alter table [dbo].[Employee] Add EmployeeSalary decimal(10,2);

	Select * into [dbo].[Employee1] from [dbo].[Employee]


	Drop table [dbo].[Employee1]

-- Part 2

	SELECT  @@SERVERNAME  as 'Server Name'



	Create Table Student
	(
		StudentID int Constraint NotNULL_StudentID Not Null
	)

	Alter table Student Alter Column StudentID int Not Null;



Create Table Student
(
	StudentID int Constraint CK_StudentID Check(StudentID>100)
)


Alter table Student Add Constraint CK_StudentID Check(StudentID>100)


Drop Table Student;

Create Table Student
(
	HireDate date --Constraint DF_HireDate Default GetDate()
)

Alter table Student Add Constraint DF_HireDate Default GetDate() for HireDate; 

Drop Table Student;


Create Table Student
(
	StudentID int --Constraint UQ_StudentID Unique 
)

Alter table Student Add Constraint UQ_StudentID Unique(StudentID)


Create Table Student
(
	StudentID int Not Null --Constraint PK_StudentID Primary Key 
)


Alter table Student Add Constraint PK_StudentID Primary Key(StudentID)

Drop Table Department;

--Department Table
Create Table Department
(
	DepartmentID int Constraint PK_DepartmentID Primary Key(DepartmentID)
)

--Student Table
Create Table Student
(
	StudentID int ,
	DepartmentID int Foreign Key References [dbo].[Department](DepartmentID) 
)

Alter table Student Add Constraint FK_DepartmentID Foreign Key(DepartmentID) References [dbo].[Department](DepartmentID) 






IF (1=1) 
	PRINT 'CONDITION IS TRUE' 
ELSE 
	PRINT 'CONDITION IS FALSE' 




IF (1=2) 
	PRINT 'CONDITION IS TRUE' 
ELSE 
	PRINT 'CONDITION IS FALSE' 



DECLARE @Employee_ID INT = 4
IF (@Employee_ID <=2)
	BEGIN
		Select * from [dbo].[Employee] where ID = 1
		Select * from [dbo].[Employee] where ID = 2
	END
ELSE
	BEGIN
		Select * from [dbo].[Employee] where ID = 3
		Select * from [dbo].[Employee] where ID = 4
	END



DECLARE @age INT;
SET @age = 60;
IF @age < 18
   PRINT 'underage';
ELSE
BEGIN
   IF @age < 50
      PRINT 'You are below 50';
   ELSE
      PRINT 'Senior';
END;


SELECT IIF(1000>800, 'True Condition', 'False Condition');



SELECT NULLIF('Hello', 'World');






SELECT ISNULL(Null, 'Null Value');



SELECT ISNUMERIC('Hello world');

SELECT ISNUMERIC('4586');

SELECT ISNUMERIC(8745);



Select 
	[ID], 
	[FullName], 
	[BirthDate], 
	[EmailAddress], 
	[Phone], 
	[EmployeeSalary],
	Case When [EmployeeSalary]<1500 then 'Fresher'
		 When [EmployeeSalary]>=1500 AND [EmployeeSalary]<4000 then 'Senior'
		 Else 'Manager'
	End as 'Experience'
From [dbo].[Employee]



Select * from [dbo].[Employee]





Create function fun_Employee()      
Returns table       
as      
Return(SELECT [ID], [FullName], [BirthDate], [EmailAddress], [Phone], [EmployeeSalary] FROM [dbo].[Employee])


Select * from [dbo].[fun_Employee]();





create function fun_Concatinate 
(  
   @EmpID nchar(15),  
   @EmpName nvarchar(50)
)  
Returns nvarchar(100)  
As  
Begin Return
(
	select @EmpID + ' ' + @EmpName
)  
end 


Select 
	(Select [dbo].[fun_Concatinate]([ID],[FullName])) as EmpNameIDName,
	[BirthDate], 
	[EmailAddress], 
	[Phone], 
	[EmployeeSalary]
From [dbo].[Employee]


Select SUM([EmployeeSalary]) as 
TotalSalary from [dbo].[Employee];


Select 
	[EmployeeDepartment],
	SUM([EmployeeSalary]) as TotalSalary 
from [dbo].[Employee]
Group By [EmployeeDepartment];




Select COUNT([EmployeeSalary]) as TotalEmployee
from [dbo].[Employee];




Select 
	[EmployeeDepartment],
	COUNT([EmployeeSalary]) as TotalEmployee 
from [dbo].[Employee]
Group By [EmployeeDepartment];



Select AVG([EmployeeSalary]) as AverageSalary 
from [dbo].[Employee];




Select 
	[EmployeeDepartment],
	AVG([EmployeeSalary]) as AverageSalary 
from [dbo].[Employee]
Group By [EmployeeDepartment];



Select MAX([EmployeeSalary]) as MaximumSalary 
from [dbo].[Employee];




Select 
	[EmployeeDepartment],
	MAX([EmployeeSalary]) as MaximumSalary 
from [dbo].[Employee]
Group By [EmployeeDepartment];




Select MIN([EmployeeSalary]) as MinimumSalary 
from [dbo].[Employee];




Select 
	[EmployeeDepartment],
	MIN([EmployeeSalary]) as MinimumSalary 
from [dbo].[Employee]
Group By [EmployeeDepartment];







Select Top 2 * 
From [dbo].[Employee]
Order by [EmployeeSalary] desc;

Select 
	UPPER([FullName]) as UpperCase_EmployeeName,
	LOWER([FullName]) as LowerCase_EmployeeName
From [dbo].[Employee];



Select 
	[FullName],
	SUBSTRING([FullName],1,5) as First5Character
From [dbo].[Employee]



Select 
	[FullName],
	LEN([FullName]) as Length_EmployeeName
From [dbo].[Employee]


SELECT ROUND(8952.3245, 2) AS RoundValue;


Select GETDATE() as CurrentDate;




SELECT FORMAT(879623541, '##-##-#####');
SELECT FORMAT(879623541, '##,.0#');
Select FORMAT(GETDATE(),'dd/mm/yyyy');

SELECT TRIM(' SQL Server    ') AS Trim_Left_Right;
SELECT LTRIM('  SQL Server') AS Trim_Left;
SELECT RTRIM('SQL Server       ') AS Trim_Right;


SELECT LEFT('SQL Server',3) AS LEFT_Characters;
SELECT RIGHT('SQL Server',6) AS Right_Characters;


SELECT COALESCE(NULL, NULL, NULL, 'John', NULL, 'Mark');


SELECT REPLACE('Power BI Tutorial', 'Power BI', 'SQL');


SELECT CONCAT('SQL', ' ', 'Database');


SELECT CHARINDEX('QL','SQL Tutorial') AS MatchPosition;


SELECT PATINDEX('%q%ri%', 'SQL Tutorial');
SELECT PATINDEX('%[al]%', 'SQL Tutorial');
SELECT PATINDEX('%[to]%', 'SQL Tutorial');
SELECT PATINDEX('%[^ql]%', 'SQL Tutorial');


SELECT CAST('2021-08-25 12:05:03.002' AS date);
SELECT CAST(25.65 AS varchar);



SELECT CONVERT(varchar, 220.05);
SELECT CONVERT(varchar(15), '2021-01-05');
SELECT CONVERT(VARCHAR,GETDATE(),101) as MMDDYYYY;
SELECT CONVERT(VARCHAR,GETDATE(),111) as YYYYMMDD;





SELECT DATEPART(year, GETDATE()) AS DatePartInt;
SELECT DATEPART(month, GETDATE()) AS DatePartInt;
SELECT DATEPART(hour, GETDATE()) AS DatePartInt;
SELECT DATEPART(minute, GETDATE()) AS DatePartInt;




SELECT Month(GETDATE()) AS Month;
SELECT Year(GETDATE()) AS Year;
SELECT Day(GETDATE()) AS Day;




SELECT DATEADD(month, 2, GETDATE()) AS DateAdd;
SELECT DATEADD(YEAR, -2, GETDATE()) AS DateAdd;




SELECT DATEDIFF(month, '2021/06/20',GetDate()) AS MonthDiff;
SELECT DATEDIFF(year, '2020/05/21',GetDate()) AS YearDiff;


Select * from [dbo].[Employee];

Select * from [dbo].[Department];




--Inner Join 
Select 
	E.[ID], 
	E.[FullName], 
	E.[BirthDate], 
	E.[EmailAddress], 
	E.[Phone], 
	E.[EmployeeSalary], 
	E.[DepartmentID],
	D.[DepartmentName],
	D.[DepartmentLocation]
From [dbo].[Employee] E
Inner join [dbo].[Department] D on E.DepartmentID=D.DepartmentID

--Left Join 
Select 
	E.[ID], 
	E.[FullName], 
	E.[BirthDate], 
	E.[EmailAddress], 
	E.[Phone], 
	E.[EmployeeSalary], 
	E.[DepartmentID],
	D.[DepartmentName],
	D.[DepartmentLocation]
From [dbo].[Employee] E
Left join [dbo].[Department] D on E.DepartmentID=D.DepartmentID

--Right Join 
Select 
	E.[ID], 
	E.[FullName], 
	E.[BirthDate], 
	E.[EmailAddress], 
	E.[Phone], 
	E.[EmployeeSalary], 
	E.[DepartmentID],
	D.[DepartmentName],
	D.[DepartmentLocation]
From [dbo].[Employee] E
Right join [dbo].[Department] D on E.DepartmentID=D.DepartmentID



--Full Join 
Select 
	E.[ID], 
	E.[FullName], 
	E.[BirthDate], 
	E.[EmailAddress], 
	E.[Phone], 
	E.[EmployeeSalary], 
	E.[DepartmentID],
	D.[DepartmentName],
	D.[DepartmentLocation]
From [dbo].[Employee] E
Full join [dbo].[Department] D on E.DepartmentID=D.DepartmentID













































































































